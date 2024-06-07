<?php
// (A) GET CLASSES IN COURSE
$classes = $_CORE->autoCall("Classes", "getAll");

// (B) DRAW CLASSES LIST
if (is_array($classes)) {
  foreach ($classes as $id => $c) { ?>

    <style>
      #class-list>div>button {
        margin-right: 10px;
      }

      .btn-edit:hover,
      .btn-delete:hover,
      .btn.btn-qrcode:hover {
        background-color: #add8e6;
        /* Màu xám nhẹ */
      }

      #class-list>div:hover {
        background-color: #f2f2f2;
        /* Màu xám nhẹ khi hover */
      }

      #class-list>div>button.btn.btn-qrcode>a {
        color: black;
        text-decoration: none;
      }
    </style>
    <div class="d-flex align-items-center border p-2">
      <div class="flex-grow-1" onclick="attend.show(<?= $id ?>)">
        <strong><?= $c["class_name"] ?> tại <?= $c["class_location"] ?> - <?= $c["cd"] ?></strong><br>
        <small>Quản lý: <?= $c["user_name"] ?></small><br>
      </div>


      <!-- Replace button texts with icons -->
      <button type="button" class="btn btn-edit" onclick="classes.addEdit('<?= $id ?>')">
        <i class="ico-sm icon-pencil"></i>
      </button>

      <button type="button" class=" btn btn-qrcode">
        <a target="_blank" href="<?= HOST_BASE ?>TA/classqr?c=<?= $id ?>">
          <i class="ico-sm icon-qrcode"></i>
        </a></li>

      </button>

      <button type="button" class="btn btn-delete" onclick="classes.del('<?= $id ?>')">
        <i class="ico-sm icon-bin2"></i>
      </button>
    </div>
  <?php }
} else {
  echo "Không tìm thấy hoạt động.";
}

// (C) PAGINATION
$_CORE->load("Page");
$_CORE->Page->draw("classes.goToPage");