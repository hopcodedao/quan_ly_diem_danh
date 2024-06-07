<?php
// (A) GET CLASS
$edit = isset($_POST["id"]) && $_POST["id"] != "";
if ($edit) {
  $class = $_CORE->autoCall("Classes", "get");
  $_CORE->load("Courses");
  $course = $_CORE->Courses->get($class["course_code"]);
  $teachers = $_CORE->Courses->getTeachers($class["course_code"]);
}


// (B) CLASS FORM ?>

<style>
  #cb-page-2>h4 {
    font-weight: bold;
  }

  #cb-page-2>form>button.my-1.btn.btn-danger.d-flex-inline {
    background-color: #8c8c8c;
    border: none;
  }

  #cb-page-2>form>button.my-1.btn.btn-primary.d-flex-inline {
    background-color: #357edd;
    border: none;
  }
</style>

<h4 class="mb-2"><?= $edit ? "CHỈNH SỬA" : "THÊM" ?> HOẠT ĐỘNG</h4>
<form onsubmit="return classes.save()">
  <div class="fw-bold text-danger mb-0">HỌC KỲ</div>
  <div class="text-secondary mb-2">Nhập Tên / Mã học kỳ. Chọn vào gợi ý tự động.</div>
  <div class="bg-white border p-4 mb-2">
    <div class="form-floating">
      <input type="text" class="form-control" id="class_course" <?= isset($class) ? " readonly onclick='classes.toggle(false)'" : "" ?>
        value="<?= isset($class) ? "[{$class["course_code"]}] {$class["course_name"]}" : "" ?>">
      <input type="hidden" id="class_course_code" value="<?= isset($class) ? $class["course_code"] : "" ?>">
      <label>Học kỳ</label>
    </div>
    <small id="class_course_note" class="text-danger<?= isset($class) ? "" : " d-none" ?>">
      * Click để thay đổi học kỳ.
    </small>
  </div>

  <div class="fw-bold text-danger mb-2">HOẠT ĐỘNG</div>
  <div class="bg-white border p-4 mb-2">

    <div class="form-floating mb-2">
      <input type="text" class="form-control" id="class_name" <?= isset($class) ? "" : " disabled" ?>
        value="<?= isset($class) ? $class["class_name"] : "" ?>">
      <label>Tên hoạt động</label>
    </div>

    <div class="form-floating mb-2">
      <input type="text" class="form-control" id="class_location" <?= isset($class) ? "" : " disabled" ?>
        value="<?= isset($class) ? $class["class_location"] : "" ?>">
      <label>Địa điểm hoạt động</label>
    </div>

    <input type="hidden" id="class_id" value="<?= isset($class) ? $class["class_id"] : "" ?>">

    <div class="form-floating mb-2">
      <input type="datetime-local" class="form-control" id="class_date" required<?= isset($class) ? "" : " disabled" ?>
        value="<?= isset($class) ? str_replace(" ", "T", $class["class_date"]) : "" ?>"
        min="<?= isset($class) ? $course["course_start"] . " 00:00:00" : "" ?>"
        max="<?= isset($class) ? $course["course_end"] . " 23:59:59" : "" ?>">
      <label>Thiết lập thời gian</label>
    </div>

    <div class="form-floating mb-2">
      <select class="form-select" id="class_teacher" <?= isset($class) ? "" : " disabled" ?>><?php
      if (isset($teachers) && is_array($teachers)) {
        foreach ($teachers as $id => $t) {
          printf(
            "<option %svalue='%u'>%s (%s)</option>",
            $id == $class["user_id"] ? "selected " : "",
            $id,
            $t["user_name"],
            $t["user_email"]
          );
        }
      } else {
        echo "<option value=''>Không có giảng viên được chọn!</option>";
      }
      ?></select>
      <label>Quản lý được phân công</label>
    </div>

  </div>

  <button type="button" class="my-1 btn btn-danger d-flex-inline" onclick="cb.page(1)">
    <i class="ico-sm icon-undo2"></i> Quay lại
  </button>
  <button type="submit" class="my-1 btn btn-primary d-flex-inline">
    <i class="ico-sm icon-checkmark"></i> Lưu
  </button>
</form>