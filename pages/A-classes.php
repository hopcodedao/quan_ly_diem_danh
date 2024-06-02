<?php
// (A) PAGE META
$_PMETA = ["load" => [
  ["s", HOST_ASSETS."CB-autocomplete.js", "defer"],
  ["s", HOST_ASSETS."csv.min.js", "defer"],
  ["s", HOST_ASSETS."A-import.js", "defer"],
  ["s", HOST_ASSETS."A-classes.js", "defer"],
  ["s", HOST_ASSETS."TA-attend.js", "defer"]
]];

// (B) HTML
require PATH_PAGES . "TEMPLATE-top.php"; ?>
<!-- (B1) HEADER -->
<h4 class="mb3">QUẢN LÝ LỚP HỌC</h4>
<style>
  #cb-page-1 > h4{
  font-weight: bold;
}
</style>
<!-- (B2) SEARCH BAR -->
<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return classes.search()">
  <input type="text" id="class-search" placeholder="Tìm kiếm" class="form-control form-control-sm">
  <button type="submit" class="btn btn-primary p-3 mx-1 ico-sm icon-search"></button>
  <button class="btn btn-primary p-3 ico-sm icon-arrow-right" type="button" data-bs-toggle="dropdown"></button>
  <ul class="dropdown-menu dropdown-menu-dark">
    <li class="dropdown-item" onclick="classes.addEdit()">
      <i class="text-secondary ico-sm icon-plus"></i> Thêm lớp học
    </li>
    <li class="dropdown-item" onclick="classes.import()">
      <i class="text-secondary ico-sm icon-upload3"></i> Tải tệp CSV
    </li>
  </ul>
</form>

<!-- (B3) CLASSES LIST -->
<div id="class-list" class="zebra my-4"></div>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>