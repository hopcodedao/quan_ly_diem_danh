<?php
// (A) GET USERS
$users = $_CORE->autoCall("Users", "getAll");
// (B) DRAW USERS TABLE
if (is_array($users)) {
  ?>

<style>
  #user-list > table {
    font-size: 14px;
  }

  .table td, .table th {
    vertical-align: middle; /* Canh giữa các giá trị theo chiều dọc */
    text-align: left; /* Đảm bảo văn bản được căn trái, thay đổi nếu cần */
  }

  .btn.btn-edit {
    margin-right: 10px;
  }

  .btn-edit:hover, .btn-delete:hover {
    background-color: #add8e6;
  }

  #user-list > table > tbody > tr:hover > td{
    background-color: #f2f2f2 /* Màu xám nhạt khi hover */
  }

</style>

  <table class="table">
    <thead>
      <tr>
        <th scope="col">Họ & tên</th>
        <th scope="col">MSSV</th>
        <th scope="col">Lớp</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <?php
      foreach ($users as $id => $u) { ?>
        <tr>
          <td><?= htmlspecialchars($u["user_name"]) ?></td>
          <td><?= htmlspecialchars($u["user_mssv"]) ?></td>
          <td><?= htmlspecialchars($u["user_class"]) ?></td>
          <td><?= date("d/m/Y", strtotime($u["user_birthdate"])) ?></td>
          <td><?= htmlspecialchars($u["user_phonenumber"]) ?></td>
          <td>
            <!-- Replace button texts with icons -->
            <button type="button" class="btn btn-edit" onclick="usr.addEdit(<?= $id ?>)">
            <i class="ico-sm icon-pencil"></i>
            </button>

            <button type="button" class="btn btn-delete" onclick="usr.del(<?= $id ?>)">
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
