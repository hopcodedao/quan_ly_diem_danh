<?php
// (A) GET USERS
$users = $_CORE->autoCall("Users", "getAll");
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
