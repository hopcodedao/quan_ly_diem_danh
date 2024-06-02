<?php
// (A) GET USER
$edit = isset($_POST["id"]) && $_POST["id"] != "";
if ($edit) {
  $user = $_CORE->autoCall("Users", "get");
}

// (B) USER FORM ?>
<style>
  .container{
    display: flex;
    flex-direction: row;
  }

  #cb-page-2 > form > div > div:nth-child(1){
    width: 70%;
  }

  #cb-page-2 > form > div > div.bg-white.border.p-4.my-3.mx-3{
    width: 30%;
  }
</style>

<h3 class="mb-2"><?= $edit ? "CHỈNH SỬA" : "THÊM" ?> NGƯỜI DÙNG</h3>
<form onsubmit="return usr.save()">
<div class="container">


  <div class="bg-white border p-4 my-3">
    <input type="hidden" id="user_id" value="<?= isset($user) ? $user["user_id"] : "" ?>">

    <div class="form-floating mb-2">
      <input type="file" class="form-control" id="" onchange="chooseFile(this)">
      <label>Chọn Avatar</label>
    </div>

    <div class="form-floating mb-2">
      <input type="text" class="form-control" id="user_name"  value="<?= isset($user) ? $user["user_name"] : "" ?>">
      <label>Họ & tên</label>
    </div>

    <div class="form-floating mb-2">
      <input type="text" class="form-control" id="user_mssv"  value="<?= isset($user) ? $user["user_mssv"] : "" ?>">
      <label>Mã số</label>
    </div>

    <div class="form-floating mb-2">
      <input type="date" class="form-control" id="user_birthdate"  value="<?= isset($user) ? $user["user_birthdate"] : "" ?>">
      <label>Ngày sinh</label>
    </div>

    <div class="form-floating mb-2">
      <input type="text" class="form-control" id="user_phonenumber"  value="<?= isset($user) ? $user["user_phonenumber"] : "" ?>">
      <label>Số điện thoại</label>
    </div>

    <div class="form-floating mb-2">
      <input type="email" class="form-control" id="user_email" 
        value="<?= isset($user) ? $user["user_email"] : "" ?>">
      <label>Email</label>
    </div>

    <div class="form-floating mb-2">
      <input type="text" class="form-control" id="user_address"  value="<?= isset($user) ? $user["user_address"] : "" ?>">
      <label>Địa chỉ</label>
    </div>

    <div class="form-floating mb-2">
      <select class="form-select" id="user_level" ><?php
      foreach (USR_LVL as $k => $v) {
        printf(
          "<option %svalue='%s'>%s</option>",
          $edit && $user["user_level"] == $k ? "selected " : "",
          $k,
          $v
        );
      }
      ?></select>
      <label>Quyền User</label>
    </div>

    <div class="form-floating mb-1">
      <input type="password" class="form-control" id="user_password" >
      <label>Mật khẩu</label>
    </div>

    <div class="text-secondary">* Mật khẩu phải có ít nhất 8 ký tự chữ và số.</div>
    <br>

    <button type="button" class="my-1 btn btn-danger d-flex-inline" onclick="cb.page(1)">
    <i class="ico-sm icon-undo2"></i> Quay lại
  </button>
  <button type="submit" class="my-1 btn btn-primary d-flex-inline">
    <i class="ico-sm icon-checkmark"></i> Lưu
  </button>
  </div>

  <div class="bg-white border p-4 my-3 mx-3">
    <img id="image_preview" src="" alt="Preview Image"
      style="max-width: 100%; max-height: 500px; display: block; margin: auto; border-radius: 10px;">
  </div>
</div>
  
</form>