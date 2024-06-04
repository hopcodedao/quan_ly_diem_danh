<?php
// (A) PAGE META
$_PMETA = [
  "load" => [
    ["s", HOST_ASSETS . "CB-autocomplete.js", "defer"],
    ["s", HOST_ASSETS . "A-reports.js", "defer"]
  ]
];

try {
  $pdo = new PDO('mysql:host=localhost;dbname=nckh', 'root', '');
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
  echo 'Connection failed: ' . $e->getMessage();
}

$studentsCount = 0;
$teachersCount = 0;
$classesCount = 0;
$attendanceCount = 0;

// Lấy số lượng sinh viên
$stmt = $pdo->prepare("SELECT COUNT(*) FROM `users` WHERE `user_level` = 'U'");
$stmt->execute();
$studentsCount = $stmt->fetchColumn();

// Lấy số lượng giảng viên
$stmt = $pdo->prepare("SELECT COUNT(*) FROM `users` WHERE `user_level` = 'T'");
$stmt->execute();
$teachersCount = $stmt->fetchColumn();

// Lấy số lượng lớp học
$stmt = $pdo->prepare("SELECT COUNT(*) FROM `classes`");
$stmt->execute();
$classesCount = $stmt->fetchColumn();

// Lấy số lượng điểm danh
$stmt = $pdo->prepare("SELECT COUNT(*) FROM `attendance`");
$stmt->execute();
$attendanceCount = $stmt->fetchColumn();

// (B) HTML
require PATH_PAGES . "TEMPLATE-top.php"; ?>
<style>

#cb-page-1 > div > div{
  margin-bottom: 10px;
}

#cb-page-1 > div > div > div > div.inner{
  padding: 10px;
}
.small-box .inner h3, .small-box .inner p {
  margin: 0;
}

#cb-page-1 > div > div > div > div.inner > h3{
  font-size: 38px;
    font-weight: bold;
    margin: 0 0 10px 0;
    white-space: nowrap;
    padding: 0;
}
#cb-page-1 > div > div > div{
  background-color: #0073b7 !important;
  color: white;
  border-radius: 10px;
}

#cb-page-1 > div > div > div > a{
  position: relative;
    text-align: center;
    padding: 3px 0;
    color: #fff;
    color: rgba(255, 255, 255, 0.8);
    display: block;
    z-index: 10;
    background: rgba(0, 0, 0, 0.1);
    text-decoration: none;
}
#cb-page-1 > div > div > div > div.icon{
  position: absolute;
  right: 20px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 70px;
  color: rgba(0, 0, 0, 0.15);
}

.small-box-footer {
  clear: both;
}
.small-box {
  position: relative; /* Tạo điểm tham chiếu vị trí cho .icon */
}

.fw-bold.text-danger.mb-3 {
        font-size: 20px; /* Kích thước font 24px */
    }
</style>


<div class="row">
  <!-- TỔNG SỐ SINH VIÊN -->
  <div class="col-lg-3 col-xs-6">
    <div class="small-box bg-white">
      <div class="inner">
        <h3><?= $studentsCount ?></h3>
        <p>Tổng Sinh Viên</p>
      </div>
      <div class="icon">
        <i class="icon-user"></i>
      </div>
      <!-- Đường dẫn xem thêm thông tin sinh viên - cập nhật href tùy theo nhu cầu -->
      <a href="<?=HOST_BASE?>/A/users" class="small-box-footer">Xem Thông Tin <i class="icon-arrow-right"></i></a>

      
    </div>
  </div>

  <!-- TỔNG SỐ GIẢNG VIÊN -->
  <div class="col-lg-3 col-xs-6">
    <div class="small-box bg-white">
      <div class="inner">
        <h3><?= $teachersCount ?></h3>
        <p>Tổng Giảng Viên</p>
      </div>
      <div class="icon">
        <i class="icon-star-full"></i>
      </div>
      <!-- Đường dẫn xem thêm thông tin giảng viên - cập nhật href tùy theo nhu cầu -->
      <a href="<?=HOST_BASE?>/A/usersTC" class="small-box-footer">Xem Thông Tin <i class="icon-arrow-right"></i></a>
    </div>
  </div>

  <!-- TỔNG SỐ LỚP HỌC -->
  <div class="col-lg-3 col-xs-6">
    <div class="small-box bg-white">
      <div class="inner">
        <h3><?= $classesCount ?></h3>
        <p>Tổng Lớp Học</p>
      </div>
      <div class="icon">
        <i class="icon-list"></i>
      </div>
      <!-- Đường dẫn xem thêm thông tin lớp học - cậpnhật href tùy theo nhu cầu --><a href="<?=HOST_BASE?>/A/classes"
        class="small-box-footer">Xem Thông Tin <i class="icon-arrow-right"></i></a>
    </div>
  </div>
  <div class="col-lg-3 col-xs-6">
    <div class="small-box bg-white">
      <div class="inner">
        <h3><?= $attendanceCount ?></h3>
        <p>Tổng Điểm Danh</p>
      </div>
      <div class="icon"><i class="icon-checkmark"></i></div>
      <!-- Đường dẫn xem thêm thông tin điểm danh - cập nhật href tùy theo nhu cầu --><a href="<?=HOST_BASE?>/A/classes"
        class="small-box-footer">Xem Thông Tin <i class="icon-arrow-right"></i></a>
    </div>
  </div>
  <div class="col-lg-12">
    <form id="report-attend" method="post" target="_blank" action="<?= HOST_BASE ?>report/attend" class="bg-white p-4">
      <div class="fw-bold text-danger mb-3">BÁO CÁO ĐIỂM DANH</div>
      <div class="form-group"><input type="text" class="form-control" id="attend-course"
          placeholder="Mã môn/Tên môn học"><input type="hidden" id="attend-code" name="code"></div>
    </form>
  </div>
</div>
<div>
<div class="fw-bold text-danger mb-2">Chọn khoảng thời gian để xuất dữ liệu<div>
  <div class="bg-white border p-4 mb-4">
    <div class="form-floating mb-4">
      <input type="date" class="form-control" id="" required value="<?=isset($course)?$course["course_start"]:""?>">
      <label>Ngày bắt đầu</label>
    </div>

    <div class="form-floating">
      <input type="date" class="form-control" id="" required value="<?=isset($course)?$course["course_end"]:""?>">
      <label>Ngày kết thúc</label>
    </div>
  </div>
</div>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>