<?php
// (A) PAGE META
$_PMETA = ["load" => [
  ["s", HOST_ASSETS."CB-autocomplete.js", "defer"],
  ["s", HOST_ASSETS."csv.min.js", "defer"],
  ["s", HOST_ASSETS."A-import.js", "defer"],
  ["s", HOST_ASSETS."PAGE-nfc.js", "defer"],
  ["s", HOST_ASSETS."A-users-nfc.js", "defer"],
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
<h4 class="mb-3">QUẢN LÝ GIẢNG VIÊN</h4>

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
<div id="user-list" class="zebra my-4">

<?php
// (A) GET USERS
$users = $_CORE->autoCall("Users", "getAlltc");
// (B) DRAW USERS TABLE
if (is_array($users)) {
  ?>

  <style>

#user-list > table{
  font-size: 14px;
}
  </style>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">MSSV</th>
        <th scope="col">Họ & tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Email</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <?php $count = 1;
      foreach ($users as $id => $u) { ?>
        <tr>
          <td><?= $count++ ?></td>
          <td><?= htmlspecialchars($u["user_mssv"]) ?></td>
          <td><?= htmlspecialchars($u["user_name"]) ?></td>
          <td><?= htmlspecialchars($u["user_birthdate"]) ?></td>
          <td><?= htmlspecialchars($u["user_email"]) ?></td>
          <td><?= htmlspecialchars($u["user_phonenumber"]) ?></td>
          <td><?= htmlspecialchars($u["user_address"]) ?></td>
          <td>
            <!-- Replace button texts with icons -->
            <button type="button" class="btn btn-primary" onclick="usr.addEdit(<?= $id ?>)">
            <i class="ico-sm icon-pencil"></i>
            </button>
            <button type="button" class="btn btn-secondary" onclick="unfc.show(<?= $id ?>)">
            &#x1F4F6;
            </button>
            <button type="button" class="btn btn-warning" onclick="usr.del(<?= $id ?>)">
            <i class="ico-sm icon-bin2"></i>
            </button>
          </td>
        </tr>
      <?php } ?>
    </tbody>
  </table>
  <?php } else {
    echo "No users found.";
  }

// (C) PAGINATION
$_CORE->load("Page");
$_CORE->Page->draw("usr.goToPage");
?>




</div>



<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>