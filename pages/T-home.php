<?php
// (A) PAGE META
$_PMETA = ["load" => [
  ["s", HOST_ASSETS."T-classes.js", "defer"],
  ["s", HOST_ASSETS."TA-attend.js", "defer"]
]];

// (B) HTML
require PATH_PAGES . "TEMPLATE-top.php"; ?>
<!-- (B1) HEADER -->
<h3 class="mb-3">LỊCH DẠY HỌC</h3>

<!-- (B2) SEARCH BAR -->
<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return classes.search()">
  <select id="search-range" class="form-select w-auto" onchange="classes.stog()">
    <option value="1">Sau ngày</option>
    <option value="-1">Trước ngày</option>
    <option value="0">Vào ngày</option>
    <option value="">Tất cả</option>
  </select>
  <input type="date" id="search-date" class="mx-1 form-control form-control-sm" value="<?=date("Y-m-d")?>">
  <button class="btn btn-primary p-3 ico-sm icon-search" type="submit"></button>
</form>

<!-- (B3) DANH SÁCH LỚP HỌC -->
<div id="class-list" class="zebra my-4"></div>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>
