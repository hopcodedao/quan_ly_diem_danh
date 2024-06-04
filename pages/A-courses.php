<?php
// (A) PAGE META
$_PMETA = ["load" => [
  ["s", HOST_ASSETS."CB-autocomplete.js", "defer"],
  ["s", HOST_ASSETS."csv.min.js", "defer"],
  ["s", HOST_ASSETS."A-import.js", "defer"],
  ["s", HOST_ASSETS."A-course.js", "defer"],
  ["s", HOST_ASSETS."A-course-user.js", "defer"]
]];

// (B) HTML
require PATH_PAGES . "TEMPLATE-top.php"; ?>
<!-- (B1) HEADER -->
<h4 class="mb-3">QUẢN LÝ HỌC KỲ</h4>
<style>

#cb-page-1 > form > button:nth-child(3){
  width: 6%;
  background-color: #1a7f64;
  border: none;
}

#cb-page-1 > form > button.btn.btn-primary.p-3.white-icon > i::before{
  color: white;
}

#cb-page-1 > h4{
  font-weight: bold;
}

#cb-page-1 > form > button.btn.btn-primary.p-3.white-icon > i:nth-child(2) {
  margin-left: -5px; /* Điều chỉnh giá trị này để các icon sát nhau hơn hoặc xa nhau hơn */
}


</style>
<!-- (B2) SEARCH BAR -->
<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return course.search()">
  <input type="text" id="course-search" placeholder="Tìm kiếm" class="form-control form-control-sm">
  <button type="submit" class="btn btn-primary p-3 mx-1 ico-sm icon-search"></button>
  <button class="btn btn-primary p-3 white-icon" type="button" data-bs-toggle="dropdown">
  <i class="text-secondary ico-sm icon-plus"></i>
  <i class="text-secondary ico-sm icon-users"></i>
</button>
  <ul class="dropdown-menu dropdown-menu-dark">
    <li class="dropdown-item" onclick="course.addEdit()">
      <i class="text-secondary ico-sm icon-plus"></i> Thêm môn học
    </li>
    <li class="dropdown-item" onclick="course.import()">
      <i class="text-secondary ico-sm icon-upload3"></i> Tải tệp CSV
    </li>
  </ul>
</form>

<!-- (B3) COURSES LIST -->
<div id="course-list" class="zebra my-4"></div>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>