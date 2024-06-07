<?php
class Attend extends Core
{
  // (A) SAVE ATTENDANCE
  //  $id : class id
  //  $att : array, attendance records
  //    id => [s : status, n : notes] 
  function save($id, $att)
  {
    $att = json_decode($att, true);
    foreach ($att as $uid => $a) {
      $this->DB->replace(
        "attendance",
        ["class_id", "user_id", "a_status", "a_by", "a_date", "a_notes"],
        [
          $id,
          $uid,
          $a["s"],
          isset($_SESSION["user"]["user_id"]) ? $_SESSION["user"]["user_id"] : 0,
          date("Y-m-d H:i:s"),
          $a["n"] == "" ? null : $a["n"]
        ]
      );
    }
    return true;
  }

  function attendUser($id, $user_info)
  {
    // (F1) VERIFY VALID USER - Truy vấn trực tiếp từ cơ sở dữ liệu
    $user = $this->DB->fetch(
      "SELECT * FROM `users` WHERE `user_name` LIKE ? OR `user_mssv` = ?",
      ["%$user_info%", $user_info] // Tìm kiếm theo cả user_id và user_mssv
    );

    if (!$user) {
      $this->error = "Không tìm thấy thành viên.";
      return false;
    }

    if ($user["user_level"] == "S") {
      $this->error = "Thành viên đã bị tạm khoá.";
      return false;
    }

    // (F2) CHECK IF ALREADY ATTENDED
    $attended = $this->DB->fetchCol(
      "SELECT a_status FROM attendance WHERE class_id = ? AND user_id = ?",
      [$id, $user["user_id"]]
    );

    if ($attended && $attended[0] == 1) {
      $this->error = "Sinh viên đã được điểm danh.";
      return false;
    }

    // (F3) SAVE ATTENDANCE
    $this->DB->replace(
      "attendance",
      ["class_id", "user_id", "a_status", "a_by", "a_date", "a_notes"],
      [$id, $user["user_id"], 1, $_SESSION["user"]["user_id"], date("Y-m-d H:i:s"), ""]
    );

    return true;
  }

  function del()
  {
    // (A) GET PARAMETERS
    $class_id = $_POST["id"];
    $user_id = $_POST["aid"];

    // (B) CHECK IF THE RECORD EXISTS
    $attended = $this->DB->fetch(
      "SELECT * FROM `attendance` WHERE `class_id` = ? AND `user_id` = ?",
      [$class_id, $user_id]
    );

    if (!$attended) {
      $this->error = "Không tìm thấy bản ghi điểm danh.";
      return false;
    }

    // (C) DELETE THE ATTENDANCE RECORD
    $this->DB->delete(
      "attendance",
      "`class_id` = ? AND `user_id` = ?",
      [$class_id, $user_id]
    );

    return true;
  }


  // (B) ATTENDANCE VIA QR
  //  $id : class id
  //  $hash : class hash
  function attendQR($id, $hash)
  {
    // (B1) GET CLASS
    $this->Core->load("Classes");
    $class = $this->Classes->get($id);
    if (!is_array($class)) {
      $this->error = "Invalid class.";
      return false;
    }

    // (B2) VERIFY
    if ($class["class_hash"] != $hash) {
      $this->error = "Invalid class.";
      return false;
    }

    // (B3) SAVE ATTENDANCE
    $this->DB->replace(
      "attendance",
      ["class_id", "user_id", "a_status", "a_by", "a_date", "a_notes"],
      [$id, $_SESSION["user"]["user_id"], 1, $_SESSION["user"]["user_id"], date("Y-m-d H:i:s"), "QR"]
    );
    return true;
  }

  // (C) GET STUDENT & ATTENDANCE FOR CLASS
  //  $id : class id
  function getStudents($id)
  {
    // (C1) GET COURSE CODE
    $code = $this->DB->fetchCol(
      "SELECT `course_code` FROM `classes` WHERE `class_id`=?",
      [$id]
    );

    // (C2) GET STUDENTS + ATTENDANCE FOR THE CLASS
    $this->DB->query(
      "SELECT u.`user_id`, u.`user_name`, u.`user_mssv`, a.`a_status`, a.`a_notes`, a.`a_date`
       FROM `courses_users` cu
       LEFT JOIN `users` u ON (cu.`user_id`=u.`user_id`)
       LEFT JOIN `attendance` a ON (cu.`user_id`=a.`user_id` AND a.class_id=?)
       WHERE cu.`course_code`=? AND u.`user_level`='U'
       ORDER BY `user_name`",
      [$id, $code]
    );
    $students = [];
    while ($r = $this->DB->stmt->fetch()) {
      $students[$r["user_id"]] = $r;
    }

    // (C3) RESULTS
    return $students;
  }
}