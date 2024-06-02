<?php
// (A) ALREADY SIGNED IN
if (isset($_SESSION["user"])) {
  $_CORE->redirect();
}

// (B) PART 1 - ENTER EMAIL
if (!isset($_GET["i"]) && !isset($_GET["h"])) {
  $_PMETA = ["load" => [["s", HOST_ASSETS . "PAGE-forgot.js", "defer"]]];
  require PATH_PAGES . "TEMPLATE-top.php"; ?>

  <style>
    .card-body {
      background-color: #ffffff;
      /* Màu trắng cho form */
      border-radius: 10px;
      /* Bỏng viền nhẹ cho form */
      padding: 40px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      /* Tạo bóng đổ nhẹ */
    }

    #cb-body>div {
      display: flex;
      align-items: center;
      justify-content: center;

    }

    #cb-page-1>div>div>div>div>div>h4 {
      margin: 16px 0;
      font-size: 18px;
    }

    #cb-page-1>div>div>div>div>div>img {
      display: block;
      margin: 0 auto;
    }

    #forgot-email {
      border: none;
      border-radius: 0;
      border-bottom: solid 1px;
      margin-bottom: 25px;
    }

    #cb-page-1>div>div>div>div>div>form>div.text-secondary.mt-3>button {
      border-radius: 0;
    }

    #cb-page-1>div>div>div>div>div>form>div.text-secondary.mt-3>button.btn.btn-secondary.float-left {
      background-color: #cccccc;
      color: black;
      border: none;
    }

    #cb-page-1>div>div>div>div>div>form>div.text-secondary.mt-3>button.btn.btn-primary.float-right {
      background-color: #0068b8;
      border: none;
    }

    #cb-page-1>div>div>div>div>div>p {
      text-align: justify;
    }

    #cb-page-1>div>div>div>div>div>form>div.text-secondary.mt-3 {
      display: flex;
      justify-content: right;
    }

    #cb-page-1>div>div>div>div>div>form>div.text-secondary.mt-3 button {
      width: 30%;
      margin-right: 10px;
      /* Khoảng cách giữa các nút */
    }
  </style>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-body">
            <img src="<?= HOST_ASSETS ?>/login_files/eoffice-login.png">
            <h4 class="card-title">Khôi phục tài khoản của bạn</h4>
            <p class="card-text">Chúng tôi có thể giúp bạn đặt lại mật khẩu và thông tin bảo mật. Trước tiên, nhập tài
              khoản CTUT của bạn và làm theo hướng dẫn bên dưới.
            </p>

            <form onsubmit="return forgot();">
              <div class="form-group">
                <input type="email" id="forgot-email" class="form-control" placeholder="Email" required>
              </div>


              <div class="text-secondary mt-3">
                <button onclick="window.location='<?= HOST_BASE ?>login'" class="btn btn-secondary float-left">
                  Hủy
                </button>
                <button type="submit" class="btn btn-primary float-right">Tiếp theo</button>
                <div class="clearfix"></div>
              </div>

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php require PATH_PAGES . "TEMPLATE-bottom.php";
}

// (C) PART 2 - VALIDATION
else {
  $_CORE->load("Forgot");
  $pass = $_CORE->Forgot->reset($_GET["i"], $_GET["h"]);
  require PATH_PAGES . "TEMPLATE-top.php"; ?>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-body">
            <?php
            $_CORE->load("Forgot");
            $pass = $_CORE->Forgot->reset($_GET["i"], $_GET["h"]);
            ?>
            <h3 class="card-title"><?= $pass ? "DONE!" : "OH NO..." ?></h3>
            <div class="mb-4">
              <?php
              if ($pass) {
                echo "A new password has been sent to your email.";
              } else {
                echo $_CORE->error;
              }
              ?>
            </div>

            <div class="text-secondary mt-3">
              <a href="<?= HOST_BASE ?>login">Back To Login</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php require PATH_PAGES . "TEMPLATE-bottom.php";
} ?>