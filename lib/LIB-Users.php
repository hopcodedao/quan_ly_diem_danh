<?php

//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

// (A-B) PROPERTIES, SETTINGS, HELPER
// (C-D) GET USERS
// (E-H) SAVE & DELETE USER
// (I-K) VERIFY, LOGIN, LOGOUT
// (L-N) REGISTRATION, ACTIVATION
// (O-Q) USER HASH
// (R) IMPORT
class Users extends Core
{
  // (A) SETTINGS
  private $hvalid = 900; // validation link good for 15 mins
  private $hlen = 12; // 24 characters validation hash

  // (B) PASSWORD CHECKER (HELPER)
  //  $password : password to check
  //  $pattern : regex pattern check (at least 8 characters, alphanumeric)
  function checker($password, $pattern = '/^(?=.*[0-9])(?=.*[A-Z]).{8,20}$/i')
  {
    if (preg_match($pattern, $password)) {
      return true;
    } else {
      $this->error = "Password must be at least 8 characters alphanumeric.";
      return false;
    }
  }

  // (C) GET USER
  //  $id : user id or email
  //  $hash : optional, also get validation hash
  function get($id, $hash = null)
  {
    $sql = sprintf(
      "SELECT %s FROM `users` u%s WHERE u.`user_%s`=?",
      $hash == null ? "u.*" : "u.*, h.`hash_code`, h.`hash_time`, h.`hash_tries`",
      $hash == null ? "" : " LEFT JOIN `users_hash` h ON (u.`user_id`=h.`user_id` AND h.`hash_for`=?)",
      is_numeric($id) ? "id" : "email"
    );
    $data = $hash == null ? [$id] : [$hash, $id];
    return $this->DB->fetch($sql, $data);
  }

  // (D) GET ALL OR SEARCH USERS (ADMIN USE)
  //  $search : optional, user name or email
  //  $page : optional, current page number
  function getAll($search = null, $page = null)
  {
    // (D1) PARITAL USERS SQL + DATA
    $sql = "FROM `users`";
    $data = null;
    if ($search != null) {
      $sql .= " WHERE `user_name` LIKE ? OR `user_email` LIKE ?";
      $data = ["%$search%", "%$search%"];
    }

    // (D2) PAGINATION
    if ($page != null) {
      $this->Core->paginator(
        $this->DB->fetchCol("SELECT COUNT(*) $sql", $data),
        $page
      );
      $sql .= $this->Core->page["lim"];
    }

    // (D3) RESULTS
    return $this->DB->fetchAll("SELECT * $sql", $data, "user_id");
  }

  // (E) ADD OR UPDATE USER (ADMIN/SECONDARY USE)
  //  $name : user name
  //  $email : user email
  //  $password : user password
  //  $lvl : user level
  //  $id : user id (for updating only)
  function save($name, $email, $password, $lvl, $mssv, $address, $birthdate, $phonenumber, $class, $id = null)
  {
    // (E1) DATA SETUP + PASSWORD CHECK
    if ($id === null || !empty($password)) {
      // Chỉ kiểm tra và mã hóa mật khẩu nếu mật khẩu được cung cấp hoặc đang thêm người dùng mới
      if (!$this->checker($password)) {
        return false;
      }
      $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    }

    $avatarFilename = null;

    // Xử lý tệp avatar
    if ($id !== null && isset($_FILES['user_avatar']) && $_FILES['user_avatar']['error'] === UPLOAD_ERR_OK) {
      $avatarFile = $_FILES['user_avatar'];

      // Kiểm tra kiểu tệp và kích thước (ví dụ: chỉ cho phép JPEG, PNG, tối đa 2MB)
      $allowedTypes = ['image/jpeg', 'image/png'];
      $maxSize = 2 * 1024 * 1024; // 2MB

      if (in_array($avatarFile['type'], $allowedTypes) && $avatarFile['size'] <= $maxSize) {
        // Tạo tên tệp duy nhất
        $avatarFilename = md5($avatarFile['name'] . time()) . '.jpg';

        // Đường dẫn lưu trữ hình ảnh
        $avatarPath = __DIR__ . '/../assets/uploads/user_avatars/' . $avatarFilename;

        // Tạo lại kích thước hình ảnh (ví dụ: 150x150 pixels)
        $image = imagecreatefromstring(file_get_contents($avatarFile['tmp_name']));
        $resizedImage = imagescale($image, 150, 150);
        imagejpeg($resizedImage, $avatarPath, 80); // Lưu ảnh với chất lượng 80%
      } else {
        // Trả về lỗi nếu kiểu tệp hoặc kích thước không hợp lệ
        $this->error = "Kiểu tệp hoặc kích thước hình ảnh không hợp lệ.";
        return false; // Kết thúc hàm và trả về lỗi
      }
    }

    $fields = ["user_name", "user_email", "user_level", "user_mssv", "user_address", "user_birthdate", "user_phonenumber", "user_class", "user_avatar"]; // Thêm "user_avatar" vào fields
    $data = [
      $name,
      $email,
      $lvl,
      $mssv,
      $address,
      $birthdate,
      $phonenumber,
      $class,
      $avatarFilename // Sử dụng giá trị của $avatarFilename ở đây
    ];

    if (isset($hashedPassword)) {
      $fields[] = "user_password";
      $data[] = $hashedPassword;
    }


    // (E2) ADD/UPDATE USER
    if ($id === null) {
      $this->DB->insert("users", $fields, $data);

      // Gửi email chỉ khi thêm mới người dùng
      $mail = new PHPMailer(true); // Tạo đối tượng PHPMailer

      // Cài đặt máy chủ
      $mail->isSMTP();                                            // Gửi sử dụng SMTP
      $mail->Host = 'smtp.gmail.com';                    // Đặt máy chủ SMTP để gửi qua
      $mail->SMTPAuth = true;                                   // Kích hoạt xác thực SMTP
      $mail->Username = 'nguyenhoahop1903@gmail.com';                     // Tên đăng nhập SMTP
      $mail->Password = 'nxshqottuxbqtbbm';                               // Mật khẩu SMTP
      $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            // Kích hoạt mã hóa SSL
      $mail->Port = 465;                                    // TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

      // Người nhận
      $mail->setFrom('nguyenhoahop1903@gmail.com', 'Nguyễn Hoà Hợp');
      $mail->addAddress($email, $name);     // Add a recipient

      // Nội dung
      $mail->isHTML(false);                                  // Set email format to HTML
      $mail->Subject = 'Thông tin đăng nhập';
      $mail->Body = "Xin chào $name,\nMật khẩu của bạn là: $password\nVui lòng đăng nhập và đổi mật khẩu ngay sau khi nhận được email này.";

      $mail->send();
    } else {
      // Nếu không có ảnh mới, giữ nguyên ảnh cũ
      if ($avatarFilename === null) {
        unset($fields[array_search('user_avatar', $fields)]);
        unset($data[array_search('user_avatar', $fields)]);
      }

      $data[] = $id;
      $this->DB->update("users", $fields, "`user_id`=?", $data);
    }

    return true;
  }

  // (F) DELETE USER (ADMIN USE)
  //  $id : user id
  function del($id)
  {
    $this->DB->start();
    $this->DB->delete("users", "`user_id`=?", [$id]);
    $this->DB->delete("users_hash", "`user_id`=?", [$id]);
    $this->DB->end();
    return true;
  }

  // (G) SUSPEND USER
  //  $id : user id
  function suspend($id)
  {
    $this->DB->update(
      "users",
      ["user_level"],
      "`user_id`=?",
      ["S", $id]
    );
  }

  // (H) UPDATE ACCOUNT (LIMITED "MY ACCOUNT" USER SAVE)
  //  $name : name
  //  $cpass : current password
  //  $pass : new password
  function update($name, $cpass, $pass)
  {
    // (H1) MUST BE SIGNED IN
    if (!isset($_SESSION["user"])) {
      $this->error = "Please sign in first";
      return false;
    }

    // (H2) PASSWORD STRENGTH
    if (!$this->checker($pass)) {
      return false;
    }

    // (H3) VERIFY CURRENT PASSWORD
    if (!$this->verify($_SESSION["user"]["user_email"], $cpass)) {
      return false;
    }

    // (H4) UPDATE DATABASE
    $this->DB->update(
      "users",
      ["user_name", "user_password"],
      "`user_id`=?",
      [$name, password_hash($pass, PASSWORD_DEFAULT), $_SESSION["user"]["user_id"]]
    );
    return true;
  }

  // (I) VERIFY EMAIL & PASSWORD (LOGIN OR SECURITY CHECK)
  // RETURNS USER ARRAY IF VALID, FALSE IF INVALID
  //  $email : user email
  //  $password : user password
  function verify($email, $password)
  {
    // (I1) GET USER
    $user = $this->get($email, "A");
    if (!is_array($user)) {
      $this->error = "Tài khoản hoặc mật khẩu không hợp lệ.";
      return false;
    }

    // (I2) PENDING ACTIVATION
    if ($user["hash_code"] != null) {
      $this->error = "Vui lòng kích hoạt tài khoản của bạn trước.";
      return false;
    }

    // (I3) SUSPENDED
    if ($user["user_level"] == "S") {
      $this->error = "Tài khoản hoặc mật khẩu không hợp lệ.";
      return false;
    }

    // (I4) PASSWORD CHECK
    if (!password_verify($password, $user["user_password"])) {
      $this->error = "Tài khoản hoặc mật khẩu không hợp lệ.";
      return false;
    }
    return $user;
  }

  // (J) LOGIN
  //  $email : user email
  //  $password : user password
  function login($email, $password)
  {
    // (J1) ALREADY SIGNED IN
    if (isset($_SESSION["user"])) {
      return true;
    }

    // (J2) VERIFY EMAIL PASSWORD ACCOUNT
    $user = $this->verify($email, $password);
    if ($user === false) {
      return false;
    }

    // (J3) SESSION START
    $_SESSION["user"] = $user;
    unset($_SESSION["user"]["user_password"]);
    unset($_SESSION["user"]["hash_code"]);
    unset($_SESSION["user"]["hash_time"]);
    $this->Session->save();
    return true;
  }

  // (K) LOGOUT
  function logout()
  {
    // (K1) ALREADY SIGNED OFF
    if (!isset($_SESSION["user"])) {
      return true;
    }

    // (K2) END SESSION
    $this->Session->destroy();
    return true;
  }

  // (L) REGISTER USER (SIGN UP)
  //  $name : user name
  //  $email : user email
  //  $password : user password
  function register($name, $email, $password, $mssv, $address, $birthdate, $phonenumber, $class)
  {
    // (L1) ALREADY SIGNED IN
    if (isset($_SESSION["user"])) {
      $this->error = "Bạn đã đăng nhập rồi.";
      return false;
    }

    // (L2) CHECK USER EXIST
    if (is_array($this->get($email))) {
      $this->error = "$email đã được đăng ký.";
      return false;
    }

    // (L3) CREATE ACCOUNT + SEND ACTIVATION LINK
    $this->DB->start();
    $ok = $this->save($name, $email, $password, "U", $mssv, $address, $birthdate, $phonenumber, $class);
    if ($ok) {
      $ok = $this->hsend($this->DB->lastID);
    }
    $this->DB->end($ok);
    return $ok;
  }

  // (M) GENERATE HASH & SEND ACTIVATION LINK
  //  $id : user id or email
  function hsend($id)
  {
    // (M1) ALREADY SIGNED IN
    if (isset($_SESSION["user"])) {
      $this->error = "Bạn đã đăng nhập rồi.";
      return false;
    }

    // (M2) GET USER + HASH
    $user = $this->get($id, "A");
    if (!is_array($user)) {
      $this->error = "Tài khoản không hợp lệ.";
      return false;
    }

    // (M3) HAS EXISTING HASH - CHECK EXPIRY
    if ($user["hash_code"] != null) {
      $now = strtotime("now");
      $till = strtotime($user["hash_time"]) + $this->hvalid;
      if ($now < $till) {
        $this->error = "Vui lòng đợi thêm " . ($till - $now) . " giây.";
        return false;
      }
    }

    // (M4) GENERATE RANDOM HASH
    $hash = $this->Core->random($this->hlen);
    $this->hashAdd($user["user_id"], "A", $hash);

    // (M5) SEND ACTIVATION LINK TO USER EMAIL
    $this->Core->load("Mail");
    return $this->Mail->send([
      "to" => $user["user_email"],
      "subject" => "Validate Your Email",
      "template" => PATH_PAGES . "MAIL-activate.php",
      "vars" => [
        "link" => HOST_BASE . "activate?i={$user["user_id"]}&h={$hash}"
      ]
    ]);
  }

  // (N) ACTIVATE ACCOUNT
  //  $i : user id
  //  $h : hash code
  function hactivate($i, $h)
  {
    // (N1) ALREADY SIGNED IN
    if (isset($_SESSION["user"])) {
      $this->error = "Đã đăng nhập.";
      return false;
    }

    // (N2) GET USER + HASH
    $user = $this->get($i, "A");
    if (!is_array($user)) {
      $this->error = "Tài khoản không hợp lệ.";
      return false;
    }
    if ($user["hash_time"] == null) {
      $this->error = "Tài khoản đã được kích hoạt.";
      return false;
    }

    // (N3) HASH CHECK
    if (strtotime("now") >= strtotime($user["hash_time"]) + $this->hvalid) {
      $this->error = "Liên kết kích hoạt đã hết hạn.";
      return false;
    }
    if ($user["hash_code"] != $h) {
      $this->error = "Liên kết kích hoạt không hợp lệ.";
      return false;
    }

    // (N4) ACTIVATE ACCOUNT
    $this->hashDel($i, "A");

    // (N5) LOGIN
    unset($user["user_password"]);
    unset($user["hash_code"]);
    unset($user["hash_time"]);
    $_SESSION["user"] = $user;
    $this->Session->save();
    return true;
  }

  // (O) HASH ADD
  //  $id : user id
  //  $for : hash for - "A"ctivation, "OTP", "P"assword reset, "GOO"gle, "NFC"
  //  $time : timestamp
  //    - null : use current time
  //    - string : specify your own
  //    - "" : don't change
  function hashAdd($id, $for, $code, $time = null): void
  {
    $fields = ["user_id", "hash_for", "hash_code"];
    $data = [$id, $for, $code];
    if ($time === null) {
      $fields[] = "hash_time";
      $data[] = date("Y-m-d H:i:s");
    } else if ($time != "") {
      $fields[] = "hash_time";
      $data[] = $time;
    }
    $this->DB->replace("users_hash", $fields, $data);
  }

  // (P) HASH GET
  //  $id : user id
  //  $for : hash for
  function hashGet($id, $for)
  {
    return $this->DB->fetch(
      "SELECT * FROM `users_hash` WHERE `user_id`=? AND `hash_for`=?",
      [$id, $for]
    );
  }

  // (Q) HASH DELETE
  //  $id : user id
  //  $for : hash for
  function hashDel($id, $for): void
  {
    $this->DB->delete(
      "users_hash",
      "`user_id`=? AND `hash_for`=?",
      [$id, $for]
    );
  }

  // (R) IMPORT USER
  //  $name : user name
  //  $email : user email
  //  $password : user password
  //  $level : user level
  function import($name, $email, $password, $level, $mssv, $address, $birthdate, $phonenumber, $class)
  {
    // (R1) CHECK REGISTERED
    if (is_array($this->get($email))) {
      $this->error = "$email đã được đăng ký.";
    }

    // (R2) CHECK LEVEL
    if (!in_array($level, USR_LVL)) {
      $this->error = "Cấp độ người dùng không hợp lệ.";
    }

    // (R3) SAVE
    return $this->save($name, $email, $password, $level, $mssv, $address, $birthdate, $phonenumber, $class);
  }
}