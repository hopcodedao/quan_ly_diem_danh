<?php
// (A) GET CLASSES FOR TEACHER
$_POST["uid"] = $_SESSION["user"]["user_id"];
$classes = $_CORE->autoCall("Classes", "getByTeacher");

// (B) DRAW CLASSES LIST
if (is_array($classes)) {
  foreach ($classes as $id => $c) { ?>
    <div class="d-flex align-items-center border p-2">
      <div class="flex-grow-1">
        <strong><?= $c["cd"] ?></strong><br>
        [<?= $c["course_code"] ?>] <?= $c["course_name"] ?><br>
        <div class="class-description">
          <strong>Lớp: <?= $c["class_desc"] ?></strong>
        </div>
      </div>


      <!-- Replace button texts with icons -->
      <button type="button" class="btn btn-edit" onclick="attend.show(<?= $id ?>)">
        <i class="ico-sm icon-pencil"></i>
      </button>

      <button type="button" class="btn btn-qrcode" target="_blank" href="<?= HOST_BASE ?>TA/classqr?c=<?= $id ?>">
        <i class="ico-sm icon-qrcode"></i>
      </button>


      <div class="dropdown">
        <button type="button" class="btn btn-primary p-3 ico-sm icon-arrow-right" data-bs-toggle="dropdown"></button>
        <ul class="dropdown-menu dropdown-menu-dark">
          <li class="dropdown-item" onclick="attend.show(<?= $id ?>)">
            <i class="ico-sm icon-users"></i> Danh sách điểm danh
          </li>
          <li><a class="dropdown-item" target="_blank" href="<?= HOST_BASE ?>TA/classqr?c=<?= $id ?>">
              <i class="ico-sm icon-qrcode"></i> Tạo mã QR
            </a></li>
        </ul>
      </div>
    </div>
  <?php }
} else { ?>
  <div class="d-flex align-items-center border p-2">Không tìm thấy lớp học nào.</div>
<?php }

// (C) PHÂN TRANG
$_CORE->load("Page");
$_CORE->Page->draw("classes.goToPage");
?>