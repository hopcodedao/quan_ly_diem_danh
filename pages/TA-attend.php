<?php
// (A) GET CLASS + COURSE
$_CORE->load("Courses");
$class = $_CORE->autoCall("Classes", "get");
$course = $_CORE->Courses->get($class["course_code"]); ?>
<!-- (B) NAVIGATION -->
<div class="d-flex align-items-center mb-3">
  <div class="flex-grow-1">
    <h3 class="mb-0">[<?=$course["course_code"]?>] <?=$course["course_name"]?></h3>
    <small class="fw-bold"><?=$class["cd"]?></small>
  </div>
  <button type="button" class="btn btn-danger p-3 ico-sm icon-undo2" onclick="cb.page(1)"></button>
</div>

<!-- (C) NOTES -->
<div class="d-flex align-items-stretch bg-white border mb-1 p-2">
  * Dấu tick màu xanh là "đã có mặt", dấu chéo màu đỏ là "vắng mặt".<br>
  * Nhớ "lưu điểm danh" bên dưới.
</div>

<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return course.search()">
  <input type="text" id="course-search" placeholder="Tìm kiếm" class="form-control form-control-sm">
  <button type="submit" class="btn btn-primary p-3 mx-1 ico-sm icon-search"></button>
</form>

<!-- (D) ATTENDANCE LIST -->
<div id="attend-list" class="zebra my-4"></div>