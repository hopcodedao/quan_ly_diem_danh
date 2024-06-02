<?php
// (A) PAGE META
$_PMETA = ["load" => [
  ["s", HOST_ASSETS."CB-autocomplete.js", "defer"],
  ["s", HOST_ASSETS."csv.min.js", "defer"],
  ["s", HOST_ASSETS."A-import.js", "defer"],
  ["s", HOST_ASSETS."PAGE-nfc.js", "defer"],
  ["s", HOST_ASSETS."A-users-nfc.js", "defer"],
  ["s", HOST_ASSETS."A-users.js", "defer"]
]];

// (B) HTML
require PATH_PAGES . "TEMPLATE-top.php"; ?>

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
</style>

<!-- (B1) HEADER -->
<h4 class="mb-3">QUẢN LÝ SINH VIÊN</h4>

<!-- (B2) SEARCH BAR -->
<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return usr.search()">
  <input type="text" id="user-search" placeholder="Tìm kiếm" class="form-control form-control-sm">
  <button type="submit" class="btn btn-primary p-3 mx-1 ico-sm icon-search"></button>
  <button class="btn btn-primary p-3 white-icon" type="button" data-bs-toggle="dropdown">
  <i class="text-secondary ico-sm icon-plus"></i>
  <i class="text-secondary ico-sm icon-users"></i>
</button>

  <ul class="dropdown-menu dropdown-menu-dark">
    <li class="dropdown-item" onclick="usr.addEdit()">
      <i class="text-secondary ico-sm icon-plus"></i> Thêm người dùng
    </li>
    <li class="dropdown-item" onclick="usr.import()">
      <i class="text-secondary ico-sm icon-upload3"></i> Tải tệp CSV
    </li>
  </ul>
</form>

<!-- (B3) USERS LIST -->
<div id="user-list" class="zebra my-4"></div>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>