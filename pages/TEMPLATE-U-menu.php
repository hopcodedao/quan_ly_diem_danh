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
</li>
<li class="nav-item">
  <a class="nav-link ms-1" href="<?=HOST_BASE?>U">
    <i class="text-secondary ico-sm icon-file-text2"></i> Hoạt động
  </a>
  <a class="nav-link ms-2" href="<?=HOST_BASE?>U/qr">
    <i class="text-secondary ico-sm icon-qrcode"></i> Quét mã
  </a>
  <hr>
</li>
