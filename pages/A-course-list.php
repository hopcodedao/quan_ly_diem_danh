<?php
// (A) GET COURSES
$courses = $_CORE->autoCall("Courses", "getAll");


// (B) DRAW COURSES LIST
if (is_array($courses)) {
  foreach ($courses as $code => $c) { ?>

    <style>
      #course-list>div>button {
        margin-right: 10px;
      }

      .btn-edit:hover,
      .btn-delete:hover {
        background-color: #add8e6;
        /* Màu xám nhẹ */
      }

      #course-list>div:hover {
        background-color: #f2f2f2;
        /* Màu xám nhẹ khi hover */
      }
    </style>


    <div class="d-flex align-items-center border p-2">
      <div class="flex-grow-1" onclick="cuser.show('<?= $code ?>')">
        <strong>[<?= $c["course_code"] ?>] <?= $c["course_name"] ?></strong><br>
        <small><?= $c["sd"] ?> &#x2192 <?= $c["ed"] ?></small><br>
        <small><?= $c["course_desc"] ?></small>
      </div>


      <!-- Replace button texts with icons -->
      <button type="button" class="btn btn-edit" onclick="course.addEdit('<?= $code ?>')">
        <i class="ico-sm icon-pencil"></i>
      </button>

      <button type="button" class="btn btn-delete" onclick="course.del('<?= $code ?>')">
        <i class="ico-sm icon-bin2"></i>
      </button>
    </div>
  <?php }
} else {
  echo "Không tìm thấy học kỳ.";
}

// (C) PAGINATION
$_CORE->load("Page");
$_CORE->Page->draw("course.goToPage");