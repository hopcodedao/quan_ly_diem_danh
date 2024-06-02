<?php
// (A) NOT SIGNED IN
if (!isset($_SESSION["user"])) { $_CORE->redirect(); }

// (B) PAGE META & SCRIPTS
$_PMETA = ["load" => [
  ["s", HOST_ASSETS."PAGE-wa-helper.js", "defer"],
  ["s", HOST_ASSETS."PAGE-wa.js", "defer"]
]];

// (C) HAS REGISTERED
$_CORE->load("Users");
$regged = is_array($_CORE->Users->hashGet($_SESSION["user"]["user_id"], "PL"));

// (D) HTML PAGE
require PATH_PAGES . "TEMPLATE-top.php"; ?>
<div class="container">
<div class="row justify-content-center">
<div class="col-md-10 bg-white border">
<div class="row">
  <div class="col-8 p-4">
    <!-- (D1) HEADER -->
    <img src="<?=HOST_ASSETS?>ctut.png" class="p-2 rounded-circle" style="width:128px;height:128px;background:#f1f1f1">
    <h3 class="mt-4 mb-2">PASSWORDLESS LOGIN</h3>
    <div class="mb-4 text-secondary">
    Đăng nhập bằng vân tay, nhận diện khuôn mặt, mã PIN, hoặc chìa khóa USB. Lưu ý - Điều này chỉ có thể được đăng ký trên một thiết bị và một phương thức đăng nhập không cần mật khẩu.
    </div>

    <!-- (D2) REGISTER & UNREGISTER -->
    <button type="button" id="wa-unreg" class="my-1 btn btn-primary d-flex-inline"
            onclick="wa.unreg()"<?=$regged?"":" disabled"?>>
      <i class="ico-sm icon-cross"></i> Hủy
    </button>
    <button type="button" id="wa-reg" class="my-1 btn btn-primary d-flex-inline"
            onclick="wa.regA()" disabled>
      <i class="ico-sm icon-key"></i> Đăng ký
    </button>

    <!-- (D3) NOTES -->
    <div id="wa-txt" class="p-3 mt-3 text-white bg-danger d-none"></div>
  </div>
</div>
</div>
</div>
</div>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>