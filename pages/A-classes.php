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
<h4 class="mb3">QUẢN LÝ HOẠT ĐỘNG</h4>
<style>
/* Điều chỉnh nút */
#cb-page-1 > form > div.btn-group > button,
#cb-page-1 > form > button:nth-child(2) {
  color: white;
}

#cb-page-1 > form > div.btn-group > button:nth-child(1) {
  background-color: #1f9e44;
}

#cb-page-1 > form > div.btn-group > button:nth-child(2) {
  background-color: #2f638d;
}

/* Biểu tượng màu trắng */
.white-icon i {
  color: white !important;
}

/* Tiêu đề trang */
#cb-page-1 > h4 {
  font-weight: bold;
}

/* Nút không xuống dòng */
#cb-page-1 > form > div.btn-group > button {
  white-space: nowrap;
}

/* Tạo khoảng cách giữa hai nút */
#cb-page-1 > form > div.btn-group > button {
  margin-right: 5px;
  border: none;
  border-radius: 5px;
}

#class-search{
  margin-right: 5px;
}


</style>
<!-- (B2) SEARCH BAR -->
<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return classes.search()">
  <input type="text" id="class-search" placeholder="Tìm kiếm" class="form-control form-control-sm">

  <div class="btn-group">
    <button class="btn btn-primary p-3 white-icon" type="button" onclick="classes.addEdit()">
      <i class="text-secondary ico-sm icon-plus"></i> Thêm hoạt động
    </button>
    <button class="btn btn-primary p-3 white-icon" type="button" onclick="classes.import()">
      <i class="text-secondary ico-sm icon-upload3"></i> Tải tệp CSV
    </button>
  </div>
</form>

<!-- (B3) CLASSES LIST -->
<div id="class-list" class="zebra my-4"></div>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>