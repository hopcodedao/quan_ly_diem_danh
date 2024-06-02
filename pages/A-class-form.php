<?php
// (A) GET CLASS
$edit = isset($_POST["id"]) && $_POST["id"]!="";
if ($edit) {
  $class = $_CORE->autoCall("Classes", "get");
  $_CORE->load("Courses");
  $course = $_CORE->Courses->get($class["course_code"]);
  $teachers = $_CORE->Courses->getTeachers($class["course_code"]);
}

// (B) CLASS FORM ?>
<h3 class="mb-3"><?=$edit?"CHỈNH SỬA":"THÊM"?> LỚP HỌC</h3>
<form onsubmit="return classes.save()">
  <div class="fw-bold text-danger mb-0">MÔN HỌC</div>
  <div class="text-secondary mb-2">Nhập Tên/ Mã môn học. Chọn vào gợi ý tự động.</div>
  <div class="bg-white border p-4 mb-4">
    <div class="form-floating">
      <input type="text" class="form-control" id="class_course"
             <?=isset($class)?" readonly onclick='classes.toggle(false)'":""?>
             value="<?=isset($class)?"[{$class["course_code"]}] {$class["course_name"]}":""?>">
      <input type="hidden" id="class_course_code" value="<?=isset($class)?$class["course_code"]:""?>">
      <label>Môn học</label>
    </div>
    <small id="class_course_note" class="text-danger<?=isset($class)?"":" d-none"?>">
      * Click để thay đổi môn học.
    </small>
  </div>

  <div class="fw-bold text-danger mb-2">LỚP HỌC</div>
  <div class="bg-white border p-4 mb-4">

  <div class="form-floating mb-4">
      <input type="text" class="form-control" id="class_desc"<?=isset($class)?"":" disabled"?>
             value="<?=isset($class)?$class["class_desc"]:""?>">
      <label>Tên Lớp</label>
    </div>

    <input type="hidden" id="class_id" value="<?=isset($class)?$class["class_id"]:""?>">

    <div class="form-floating mb-4">
      <input type="datetime-local" class="form-control" id="class_date" required<?=isset($class)?"":" disabled"?>
             value="<?=isset($class)?str_replace(" ", "T", $class["class_date"]):""?>"
             min="<?=isset($class)?$course["course_start"]." 00:00:00":""?>"
             max="<?=isset($class)?$course["course_end"]." 23:59:59":""?>">
      <label>Thiết lập thời gian</label>
    </div>

    <div class="form-floating mb-4">
      <select class="form-select" id="class_teacher"<?=isset($class)?"":" disabled"?>><?php
        if (isset($teachers) && is_array($teachers)) { foreach ($teachers as $id=>$t) {
          printf("<option %svalue='%u'>%s (%s)</option>",
            $id==$class["user_id"] ? "selected " : "",
            $id, $t["user_name"], $t["user_email"]
          );
        }} else { echo "<option value=''>Không có giảng viên được chọn!</option>"; }
      ?></select>
      <label>Giảng viên được phân công</label>
    </div>



    <div class="form-floating mb-4">
    <select class="form-select" id="class_room">
      <option value="">Chọn phòng học</option>
      <?php
      $rooms = ["C101", "C102", "C103", "C104", "C205"]; // và những phòng khác nếu có
      foreach ($rooms as $room) {
        printf(
          "<option %svalue='%s'>%s</option>",
          (isset($class) && $class["class_room"] == $room) ? "selected " : "",
          $room,
          $room
        );
      }
      ?>
    </select>
    <label>Phòng</label>
  </div>

  <div class="form-floating mb-4">
    <div class="input-group">
      <span class="input-group-text">Tiết từ</span>
      <select class="form-select" id="class_period_start">
        <?php
        for ($i = 1; $i <= 10; $i++) {
          printf(
            "<option %svalue='%s'>%s</option>",
            (isset($class) && $class["class_period_start"] == $i) ? "selected " : "",
            $i,
            $i
          );
        }
        ?>
      </select>
      <span class="input-group-text">đến</span>
      <select class="form-select" id="class_period_end">
        <?php
        for ($i = 1; $i <= 10; $i++) {
          printf(
            "<option %svalue='%s'>%s</option>",
            (isset($class) && $class["class_period_end"] == $i) ? "selected " : "",
            $i,
            $i
          );
        }
        ?>
      </select>
    </div>
  </div>


  
  </div>

  <button type="button" class="my-1 btn btn-danger d-flex-inline" onclick="cb.page(1)">
    <i class="ico-sm icon-undo2"></i> Quay lại
  </button>
  <button type="submit" class="my-1 btn btn-primary d-flex-inline">
    <i class="ico-sm icon-checkmark"></i> Lưu
  </button>
</form>