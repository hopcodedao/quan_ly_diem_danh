<?php
// (A) GET CLASS + COURSE
$_CORE->load("Courses");
$class = $_CORE->autoCall("Classes", "get"); ?>

<style>
  #cb-page-2>div.d-flex.align-items-center.mb-3>div>h5 {
    font-weight: bold;
  }
</style>
<!-- (B) NAVIGATION -->
<div class="d-flex align-items-center mb-3">
  <div class="flex-grow-1">

    <h5 class="mb-0 mb-2"><?= $class["class_name"] ?> tại <?= $class["class_location"] ?></h5>
    <small class="fw-bold"><?= $class["cd"] ?></small>
  </div>
  <button type="button" class="btn btn-danger p-3 ico-sm icon-undo2" onclick="cb.page(1)"></button>
</div>

<!-- (C) NOTES
<div class="d-flex align-items-stretch bg-white border mb-1 p-2">
  * Dấu tick màu xanh là "đã có mặt", dấu chéo màu đỏ là "vắng mặt".<br>
  * Nhớ "lưu điểm danh" bên dưới.
</div> -->

<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return attend.add()">
  <input type="text" id="class-user-add" placeholder="Nhập Tên / MSSV" class="form-control form-control-sm">
  <button type="submit" class="btn btn-primary p-3 mx-1 ico-sm icon-search"></button>
</form>

<!-- (D) ATTENDANCE LIST -->
<div id="attend-list" class="zebra my-4"></div>