<style>
  /* Common styles for dropdown menus inside nav-items */
  .nav-item {
    clear: both;
  }

  .nav-item .dropdown-menu {
    background-color: #2c3b41;
    width: 100%;
    border-radius: 0;
    border: none;
    left: 0;
    right: 0;
    position: static !important;
    /* Override any other positioning */
    display: none;
    /* Hide by default */
  }

  .nav-item .dropdown-menu .dropdown-item {
    color: #8aa4af;
  }

  .nav-item .dropdown-menu .dropdown-item::before {
    content: "\003E";
    display: inline-block;
    margin-right: 10px;
  }

  .nav-item .dropdown-menu .dropdown-item:hover {
    background-color: #3d5261;
  }

  .arrow {
    display: inline-block;
    float: right;
  }

  .nav-item .dropdown-menu.show {
    display: block;
  }

  /* Additional styles */
  #cb-side>ul>li>ul {
    transform: none !important;
    /* Adjust as needed */
  }

  .text{
    margin: 10px 10px 0;
    font-size: 18px;
    font-weight: bold;
  }
</style>

<li class="nav-item">
  <div class="text-center">
    <img src="<?= HOST_ASSETS ?>ctut.png" loading="lazy" width="60" height="60"
      style="display: inline-block; margin-top:10px;">
    <div class="text">HỆ THỐNG QUẢN LÝ ĐIỂM DANH</div>
  </div>
  <hr>
  <a class="nav-link ms-1" href="<?= HOST_BASE ?>A/">
    <i class="text-secondary ico-sm icon-pie-chart"></i> Báo cáo thống kê
  </a>
  <hr>
</li>

<li class="nav-item">
<a class="nav-link ms-1" href="<?= HOST_BASE ?>A/users">
    <i class="text-secondary ico-sm icon-briefcase"></i> Thành viên
  </a>
  <a class="nav-link ms-1" href="<?= HOST_BASE ?>A/courses">
    <i class="text-secondary ico-sm icon-briefcase"></i> Học kỳ
  </a>
  <a class="nav-link ms-1" href="<?= HOST_BASE ?>A/classes">
    <i class="text-secondary ico-sm icon-file-text2"></i> Hoạt động
  </a>
  <a class="nav-link ms-1" href="<?= HOST_BASE ?>A/settings">
    <i class="text-secondary ico-sm icon-cog"></i> Cài đặt
  </a>
</li>


<script>

  $(document).ready(function () {
    $('#navbarDropdownMenuLink').on('show.bs.dropdown', function (e) {
      $(this).find('.arrow').html("&or;");
    });

    $('#navbarDropdownMenuLink').on('hide.bs.dropdown', function (e) {
      $(this).find('.arrow').html("&lt;"); // Mũi tên < như ban đầu
    });
  });
</script>