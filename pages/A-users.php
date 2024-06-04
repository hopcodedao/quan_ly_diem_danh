<?php
// (A) PAGE META
$_PMETA = ["load" => [
  ["s", HOST_ASSETS."CB-autocomplete.js", "defer"],
  ["s", HOST_ASSETS."csv.min.js", "defer"],
  ["s", HOST_ASSETS."A-import.js", "defer"],
  ["s", HOST_ASSETS."A-users.js", "defer"]
]];

// (B) HTML
require PATH_PAGES . "TEMPLATE-top.php"; ?>

<style>
/* Điều chỉnh nút */
#cb-page-1 > form > div.btn-group > button,
#cb-page-1 > form > button:nth-child(2) {
  color: white;
}

#cb-page-1 > form > div.btn-group > button:nth-child(1),
#cb-page-1 > form > button:nth-child(3) {
  background-color: #1a7f64;
}

/* #cb-page-1 > form > div.btn-group > button:nth-child(2) {
  background-color: #007bff;
} */

#cb-page-1 > form > button:nth-child(2) {
  background-color: #2f638d;
  border: none;
}

/* Biểu tượng màu trắng */
.white-icon i {
  color: white !important;
}

/* Điều chỉnh khoảng cách icon */
#cb-page-1 > form > button.btn.btn-primary.p-3.white-icon > i:nth-child(2) {
  margin-left: -5px;
}

/* Tiêu đề trang */
#cb-page-1 > h4 {
  font-weight: bold;
}

/* Nút không xuống dòng */
#cb-page-1 > form > div.btn-group > button {
  white-space: nowrap;
}
</style>

<!-- (B1) HEADER -->
<h4 class="mb-3">QUẢN LÝ THÀNH VIÊN</h4>

<!-- (B2) SEARCH BAR -->
<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return usr.search()">
  <input type="text" id="user-search" placeholder="Tìm kiếm" class="form-control form-control-sm">
  <button type="submit" class="btn btn-primary p-3 mx-1 ico-sm icon-search"></button>

  <div class="btn-group">
    <button class="btn btn-primary p-3 white-icon" type="button" onclick="usr.addEdit()">
      <i class="text-secondary ico-sm icon-plus"></i> Thêm người dùng
    </button>
    <button class="btn btn-primary p-3 white-icon" type="button" onclick="usr.import()">
      <i class="text-secondary ico-sm icon-upload3"></i> Tải tệp CSV
    </button>
  </div>
</form>


<!-- (B3) USERS LIST -->
<div id="user-list" class="zebra my-4"></div>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>