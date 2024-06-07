<?php
// (A) GET COURSE
$edit = isset($_POST["code"]) && $_POST["code"]!="";
if ($edit) { $course = $_CORE->autoCall("Courses", "get"); }
// (B) COURSE FORM ?>
<style>
  #cb-page-2 > h4{
    font-weight: bold;
  }

    #cb-page-2 > form > div:nth-child(3) > div > button.my-1.btn.btn-danger.d-flex-inline{
      background-color: #8c8c8c;
        border: none;
    }

    #cb-page-2 > form > div:nth-child(3) > div > button.my-1.btn.btn-primary.d-flex-inline{
      background-color: #357edd;
        border: none;
    }

</style>

<h4 class="mb-2"><?=$edit?"CHỈNH SỬA":"THÊM"?> HỌC KỲ</h4>
<form onsubmit="return course.save()">
  <div class="fw-bold text-danger mb-2">Thông tin cơ bản</div>
  <div class="bg-white border p-4 mb-3">
    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="course_code"  value="<?=isset($course)?$course["course_code"]:""?>">
      <input type="hidden" id="course_ocode" value="<?=isset($course)?$course["course_code"]:""?>">
      <label>Mã học kỳ</label>
    </div>

    <div class="form-floating mb-3">
      <input type="text" class="form-control" id="course_name"  value="<?=isset($course)?$course["course_name"]:""?>">
      <label>Tên học kỳ</label>
    </div>

    <div class="form-floating">
      <input type="text" class="form-control" id="course_desc" value="<?=isset($course)?$course["course_desc"]:""?>">
      <label>Thông tin chi tiết (nếu có)</label>
    </div>
  </div>

  <div class="fw-bold text-danger mb-2">Ngày Bắt đầu - Kết thúc <div>
  <div class="bg-white border p-4 mb-3">
    <div class="form-floating mb-3">
      <input type="date" class="form-control" id="course_start"  value="<?=isset($course)?$course["course_start"]:""?>">
      <label>Ngày bắt đầu</label>
    </div>

    <div class="form-floating">
      <input type="date" class="form-control" id="course_end"  value="<?=isset($course)?$course["course_end"]:""?>">
      <label>Ngày kết thúc</label>
    </div>
  </div>

  <button type="button" class="my-1 btn btn-danger d-flex-inline" onclick="cb.page(1)">
    <i class="ico-sm icon-undo2"></i> Quay lại
  </button>
  <button type="submit" class="my-1 btn btn-primary d-flex-inline">
    <i class="ico-sm icon-checkmark"></i> Lưu
  </button>
</form>