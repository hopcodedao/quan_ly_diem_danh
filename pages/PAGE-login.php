<?php
// (A) ALREADY SIGNED IN
if (isset($_SESSION["user"])) {
  $_CORE->redirect();
}

session_start();

// (B) PAGE META & SCRIPTS
$_PMETA = [
  "load" => [
    ["s", HOST_ASSETS . "PAGE-wa-helper.js", "defer"],
    ["s", HOST_ASSETS . "PAGE-login-wa.js", "defer"],
    ["s", HOST_ASSETS . "PAGE-nfc.js", "defer"],
    ["s", HOST_ASSETS . "PAGE-login-nfc.js", "defer"],
    ["s", HOST_ASSETS . "PAGE-login.js", "defer"]
  ]
];

// (C) HTML PAGE
require PATH_PAGES . "TEMPLATE-top.php"; ?>
<?php if ($_CORE->error != "") { ?>
  <!-- (C1) ERROR MESSAGE -->
  <div class="p-2 mb-3 text-light bg-danger"><?= $_CORE->error ?></div>
<?php } ?>

<!-- (C2) LOGIN FORM -->

<!DOCTYPE html>
<!-- saved from url=(0014)about:internet -->
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="origin-trial"
    content="Az520Inasey3TAyqLyojQa8MnmCALSEU29yQFW8dePZ7xQTvSt73pHazLFTK5f7SyLUJSo2uKLesEtEa9aUYcgMAAACPeyJvcmlnaW4iOiJodHRwczovL2dvb2dsZS5jb206NDQzIiwiZmVhdHVyZSI6IkRpc2FibGVUaGlyZFBhcnR5U3RvcmFnZVBhcnRpdGlvbmluZyIsImV4cGlyeSI6MTcyNTQwNzk5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">

  <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
  <meta name="robots" content="noindex">
  <title>Đăng nhập quản lý điểm danh</title>
  <link rel="shortcut icon" href="https://eoffice.ctuet.edu.vn/Content/AConfig/images/favicon.png">

  <link href="<?= HOST_ASSETS ?>/login_files/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="<?= HOST_ASSETS ?>/login_files/styles.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" async="" src="<?= HOST_ASSETS ?>/login_files/recaptcha__vi.js.tải xuống"
    crossorigin="anonymous"
    integrity="sha384-fOIj/MO5/g/YxE+tY/rPW2Hhk4ykc4S859bCz3wWFKrVh8loplREOL0Xi2gBpyvX"></script>
  <script src="<?= HOST_ASSETS ?>/login_files/jquery.min.js.tải xuống"></script>
  <script src="<?= HOST_ASSETS ?>/login_files/aes.js.tải xuống"></script>
  <script src="<?= HOST_ASSETS ?>/login_files/pbkdf2.js.tải xuống"></script>
  <script src="<?= HOST_ASSETS ?>/login_files/jquery.cookie.js.tải xuống"></script>
  <script src="<?= HOST_ASSETS ?>/login_files/jQuery.flashMessage.js.tải xuống"></script>
  <script src="<?= HOST_ASSETS ?>/login_files/bootstrap.min.js.tải xuống"></script>

</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-lg-1"></div>
      <div class="col-lg-11"></div>
    </div>

    <style>
      body {
        background: url("<?= HOST_ASSETS ?>/login_files/bg.jpg") center no-repeat;
        background-size: cover;
        min-height: 100vh;
      }

      #cb-page-1>div:nth-child(16)>div.row.h-100.pt-5>div.col-lg-4.col-md-5.col-12>div.logo-top>ul {
        display: flex;
        align-items: center;
      }

      #cb-page-1>div:nth-child(16)>div.row.h-100.pt-5>div.col-lg-4.col-md-5.col-12>div.logo-top>ul>img {
        max-width: 60%;
        /* Ảnh sẽ không vượt quá chiều rộng của khối div */
        max-height: 60%;
        /* Ảnh sẽ không vượt quá chiều cao của khối div */
        width: auto;
        /* Đảm bảo tỷ lệ khung hình được giữ nguyên */
        height: auto;
        /* Đảm bảo tỷ lệ khung hình được giữ nguyên */
      }

      .login-with-social-btn:before {
        content: "";
        position: absolute;
        z-index: 2;
        top: 0px;
        left: 44px;
        height: 48px;
        width: 1px;
        background: linear-gradient(90deg, #aaa 50%, #f0f0f0 30%);
      }

      .login-with-social-btn {
        transition: background-color .3s, box-shadow .3s;
        width: 100%;
        position: relative;
        padding: 12px 30px 12px 62px;
        border: none;
        border-radius: 3px;
        box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 1px 1px rgba(0, 0, 0, .25);
        color: #222;
        font-size: 16px;
        font-weight: 400;
        font-family: Roboto, sans-serif;
        background-color: white;
        background-repeat: no-repeat;
        background-position: 12px center;
        margin-bottom: 15px;
      }

      .login-with-social-btn:hover {
        box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 2px 4px rgba(0, 0, 0, .25);
      }

      .login-with-social-btn:active {
        background-color: #eeeeee;
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAABRSURBVDiNY2CgAWBkYGBg+BSg9J+QQr4N9xjrdzEQVNfoxsDIRA2XoYNRQ0cNHQqAkYGBgYFhyXuCOYUhRpDx/07COYrRfTRHjRo6NAylCQAAN14NI2Qzu4kAAAAASUVORK5CYII=');
      }

      .login-with-social-btn:focus {
        outline: none;
        box-shadow: 0 -1px 0 rgba(0, 0, 0, .04), 0 2px 4px rgba(0, 0, 0, .25), 0 0 0 3px #c8dafc;
      }

      .login-with-microsoft-btn {
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAABRSURBVDiNY2CgAWBkYGBg+BSg9J+QQr4N9xjrdzEQVNfoxsDIRA2XoYNRQ0cNHQqAkYGBgYFhyXuCOYUhRpDx/07COYrRfTRHjRo6NAylCQAAN14NI2Qzu4kAAAAASUVORK5CYII=') !important;
      }

      .login-with-google-btn {
        background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAMAAACeyVWkAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAACu1BMVEX///////7//Pz//f3++fj//v7//v397Ov2rKbwe3HtY1fsWk3tYVXweG71qKL96un0oZrrSjzoNSbpOCnpPS/qPzHpPi/pOCrqSDr1o5z/+/v++fnvdGnoMyTqQTPrSTvqRjjpPC3qPzDrSDvqRTfnKBjzmpP//fzoNCXrSDrpOSvpPjDtW0/uaV7tXE/vb2T98vHzm53oNCTqRDfpOSrvdmv61tP++vr++/r72NXvbmTua2D++/v//OTxeSnpOjbqRTnpOSnykIj+/v/9/v/+///9/P389/j94ZD8vgD1kR7pOyvuaWL///38z077twD9yAf2mgX6zr///Pvp8f7P4PzT4/3S4vzS4fzS4v3T4/zt9P7//vz8xy77ugD7ugT8xRL//en8/f+ewPkvefNBhPQ9gvRAhPSiw/n//fb7xCP7uwD5wiP9/Piiw/o4fvNJifRGh/RGiPREhvRDhfQ1ffOWvPn4uwT/wRD/+uj9//+avvkmc/I5f/M2ffM0fPM8gfRDhvRFh/Sbv/n80E/5uAD/vwTIswzO5sb8/fvW5PymxfquyvqqyPq0zvp6qfc6gPRHiPSwzPr/uACxtikspEtcunv8/vx2pvfV5Pz/+OKJsjknplY1qVcqo0mHzJr9/f+lw/43fvFdl/X9/vyP064loUQ6qlc1qVQpo0pqv4HS7Nn6/fv8/f3f8uKEyJ85h9ZDgv9HiPMze/Npv38koUU5qlc3qVYppEovpk5Os2leunZRtWw0qFQno0U2qFlDk8I0evlxpPb9/v75/Pppvn8joUUyp1E6q1gwpk8spU0vpk82qVU7qlo0qVAjoj9hqrj09v/9/v2a06k7q1kloUYoo0kupU4wplAupk4yp1KJzJv8//Pr9u6l2LNwwoZWt3BMsmhTtW2Z06nf8eT4/Pn7/fz8/v3+//5PFEZOAAAAAWJLR0QAiAUdSAAAAAd0SU1FB+ULEAc5JnRSWN0AAAGVSURBVBjTY2AAAkYmIMHMAiKZWBmggI2BgZ2Dk4ubh5ePH6gEIsjMwCAgKCQsIiomLiQhKQVTKS0jKyevIKqopKCsoqrGoA4UBJojo6GpoKWto6unrSisbwASYWBiMDTSNDYxNTNnsLC0srYBGQgEtnb2Do5OQIazi6ubu6ubi4szkOPh6eXtA9QDZPtCXeDKwODnHxAYxBDsyhASGhYeERkeFRrNwBATGxefkMjAmMSQnJKaBgTpKRkMDJlZcdk5uSDRvPyCwqLiksLSMrDa8orKKqBodU1tXX1DY1N9M9Dolta29g6GTmeGru6e3r7+CRPrJ4HcMHnK1GkMDNOBbmD0ZZhR29QwE+iKWbPnzJ03HyjtsoCBYeGiwobFLgwMSxiWLlu+YuWq1WsY1q5bv2Hjps2TGJJALt6yddv2HTt37d6zd9/+AwcPgX18mOHI0WPHT2w/eer0mbPnzl+46AvyMcMlBobLV65eu37j5sqrt27fASqDqma4e+/+g4ePVj1+wgATBLpjOkjL02dA8vkLkAAAfCh/yEaJBysAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjEtMTEtMTZUMDc6NTc6MzMrMDA6MDAsmbeWAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIxLTExLTE2VDA3OjU3OjMzKzAwOjAwXcQPKgAAAABJRU5ErkJggg==') !important;
      }
    </style>
    <script src="<?= HOST_ASSETS ?>/login_files/api.js.tải xuống" async="" defer=""></script>
    <div class="row h-100 pt-5">

      <div class="col-lg-8 col-md-7 col-12 slide-left">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item">
              <img class="d-block w-100" src="<?= HOST_ASSETS ?>/login_files/slide1.png" alt="">
            </div>
            <div class="carousel-item active">
              <img class="d-block w-100" src="<?= HOST_ASSETS ?>/login_files/slide2.png" alt="">
            </div>
          </div>
          <a class="carousel-control-prev" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>


      <div class="col-lg-4 col-md-5 col-12">
        <div class="logo-top">
          <ul class="d-flex flex-column bd-highlight mb-3 mg-0">
            <li class="p-2 bd-highlight logo-hd">

              <img src="<?= HOST_ASSETS ?>/login_files/eoffice-login.png">

            </li>
            <img src="<?= HOST_ASSETS ?>/login_files/CTT.png">
            <li class="p-2 bd-highlight name-hd">
              <h1>ĐĂNG NHẬP HỆ THỐNG</h1>
            </li>
          </ul>
        </div>

        <form onsubmit="return login();" autocomplete="new-password" class="form-login" data-ajax="true"
          data-ajax-failure="onAjaxFailure" data-ajax-loading="#ajaxLoading" data-ajax-success="onAjaxSuccess"
          id="form-login" method="post"><input name="__RequestVerificationToken" type="hidden"
            value="jKpQyXWmuV0jcGQi2EXXrgh9OW8iQmzWHAI4cyri9ZZF7FePx8FZMfqO3BdYYV_9FzY6Ln8zhxAD5_xSCwRQvLqQYf6m2LEbE6tdYBS0Y2U1"><input
            id="rQuery" name="rQuery" type="hidden" value=""><input id="SSOData" name="SSOData" type="hidden" value="">
          <input asp-for="ReturnUrl" type="hidden">
          <div class="form-group">

            <div class="input-group mb-2">

              <input autocomplete="new-password" class="form-control" data-val="true"
                data-val-length="The field Tên đăng nhập must be a string with a maximum length of 50."
                data-val-length-max="50" data-val-required="Nhập email" name="Email" placeholder="Nhập email"
                required="required" type="email" id="login-email" value="">
            </div>

          </div>
          <div class="form-group">
            <div class="input-group mb-2">

              <input autocomplete="new-password" class="form-control" data-val="true" data-val-required="Nhập mật khẩu"
                name="Password" placeholder="Nhập mật khẩu" required="required" type="password" id="login-pass">
            </div>
          </div>
          <button type="submit" class="btn btn-primary btn-100">Đăng nhập</button>

          <!-- (C2-2) MORE LOGIN -->
          <div class="d-flex justify-content-between">
            <button type="button" id="wa-in" onclick="wa.go()" disabled class="btn btn-primary">
              <i class="ico-sm icon-key"></i> Passwordless
            </button>
            <button type="button" id="nfc-a" onclick="nin.go()" disabled class="btn btn-primary">
              <i class="ico-sm icon-feed"></i> <span id="nfc-b">NFC</span>
            </button>
          </div>




          <!-- (C2-4) FORGOT & NEW ACCOUNT -->
          <div class="text-center text-secondary mt-3">
            <a href="<?= HOST_BASE ?>forgot">Quên mật khẩu</a>
          </div>


          <div class="message-notification">
            <div id="flash-messages" class="alert-message" style="display:none;">
              <div class="img-massage-box">
                <p></p>
              </div>
              <a class="close">
                <img src="<?= HOST_ASSETS ?>/login_files/close.png" title="Close" alt="close">
              </a>
            </div>
          </div>
          <script type="text/javascript">
            $(function () {
              $("#flash-messages").flashMessage();
            });
          </script>
        </form>

      </div>
    </div>

    <script type="text/javascript">
      var _0x2850 = ['click', 'preventDefault', 'submit', 'length', '#msg-login-fail', '<div\x20class=\x22k-callout\x20k-callout-n\x22></div></div>', '#div-errors', 'append', 'toggleClass', 'hide', 'show', 'keypress', 'btnLogin', '/Common/GetPrivateKey', 'get', 'val', 'ajax', 'getElementById', 'e84ad660c4721ae0e84ad660c4721ae0', 'parse', 'Hex', 'enc', 'Utf8', 'CryptographyPMT-EMS', 'mode', 'Pkcs7', 'pad', 'value', 'ciphertext', 'PBKDF2', 'toString', 'Base64', 'ready', '#form-login', 'css', 'border', '1px\x20solid\x20#ccc', '#Password', 'css', '#UserName', '1px\x20solid\x20red', 'UserName', 'function', 'trigger', '#btnLogin']; (function (_0x10e5ab, _0x1325fb) { var _0xcd89cd = function (_0x3e77ff) { while (--_0x3e77ff) { _0x10e5ab['push'](_0x10e5ab['shift']()); } }; _0xcd89cd(++_0x1325fb); }(_0x2850, 0xde)); var _0x50b8 = function (_0x323a59, _0x32df89) { _0x323a59 = _0x323a59 - 0x0; var _0x55aa14 = _0x2850[_0x323a59]; return _0x55aa14; }; function triggerOnEnter(_0x115e37, _0x4f3899, _0x9a95b9) { if (_0x115e37['keyCode'] == 0xd) { if (typeof _0x9a95b9 != _0x50b8('0x0')) { $('#' + _0x4f3899)[_0x50b8('0x1')](_0x9a95b9); } else { _0x9a95b9(); } } } $(_0x50b8('0x2'))[_0x50b8('0x3')](function (_0x32630d) { _0x32630d[_0x50b8('0x4')](); $('#form-login')[_0x50b8('0x5')](); }); function onAjaxFailure(_0x4343b6) { showDefaultErrorMessage(); } function onAjaxSuccess(_0x53be0e) { var _0x2930fa = getErrors(_0x53be0e); if (_0x2930fa[_0x50b8('0x6')] > 0x0) { if ($(_0x50b8('0x7'))[_0x50b8('0x6')] == 0x0) { var _0x3a3db6 = '<div\x20class=\x22k-invalid-msg\x20field-validation-error\x20hide\x22\x20style=\x22display:\x20block;\x22\x20id=\x22msg-login-fail\x22\x20role=\x22alert\x22>\x20' + _0x2930fa + _0x50b8('0x8'); $(_0x50b8('0x9'))[_0x50b8('0xa')](_0x3a3db6); } $(_0x50b8('0x7'))[_0x50b8('0xb')](_0x50b8('0xc'), ![])[_0x50b8('0xd')](); $(_0x50b8('0x7'))['html'](_0x2930fa); } else { location['href'] = ''; } } $('#UserName\x20,\x20#Password')['on'](_0x50b8('0xe'), function (_0x544b45) { if (this['value'] != '') { triggerOnEnter(_0x544b45, _0x50b8('0xf'), 'click'); } }); var _0x6100 = ['', _0x50b8('0x10'), _0x50b8('0x11'), _0x50b8('0x12'), '#', _0x50b8('0x13'), _0x50b8('0x14'), _0x50b8('0x15'), _0x50b8('0x16'), _0x50b8('0x17'), _0x50b8('0x18'), _0x50b8('0x19'), _0x50b8('0x1a'), 'CBC', _0x50b8('0x1b'), _0x50b8('0x1c'), _0x50b8('0x1d'), 'encrypt', 'AES', _0x50b8('0x1e'), _0x50b8('0x1f')]; function GetPrivateKey(_0x1bd14c, _0x340599) { var _0x27f4ba = _0x6100[0x0]; $[_0x6100[0x5]]({ 'url': _0x6100[0x1], 'type': _0x6100[0x2], 'data': { 'salt': $(_0x6100[0x4] + _0x340599)[_0x6100[0x3]]() }, 'success': function (_0xe2d567) { _0x27f4ba = _0xe2d567; }, 'async': ![] }); return _0x27f4ba; } function PMTEncryptData(_0x4bd137, _0x58954) { var _0x4fec52 = $(_0x6100[0x4] + _0x58954)[_0x6100[0x3]](); var _0x32c2a1 = document[_0x6100[0x6]](_0x58954); var _0x167640 = $(_0x6100[0x4] + _0x4bd137)[_0x6100[0x3]](); try { var _0x14014c = CryptoJS[_0x6100[0xa]][_0x6100[0x9]][_0x6100[0x8]](_0x6100[0x7]); var _0x2c9ec6 = CryptoJS[_0x6100[0xa]][_0x6100[0xb]][_0x6100[0x8]](GetPrivateKey(_0x167640, _0x4bd137)); var _0x4d598c = CryptoJS[_0x6100[0xa]][_0x6100[0xb]][_0x6100[0x8]](_0x6100[0xc]); var _0x5638c7 = CryptoJS[_0x50b8('0x20')](_0x2c9ec6[_0x50b8('0x21')](CryptoJS[_0x6100[0xa]][_0x50b8('0x19')]), _0x4d598c, { 'keySize': 0x80 / 0x20, 'iterations': 0x3e8 }); var _0x8d121f = CryptoJS[_0x6100[0x12]][_0x6100[0x11]](_0x4fec52, _0x5638c7, { 'mode': CryptoJS[_0x6100[0xe]][_0x6100[0xd]], 'iv': _0x14014c, 'padding': CryptoJS[_0x6100[0x10]][_0x6100[0xf]] }); _0x32c2a1[_0x6100[0x13]] = _0x8d121f[_0x6100[0x14]][_0x50b8('0x21')](CryptoJS[_0x6100[0xa]][_0x50b8('0x22')]); } catch (_0x2ca10d) { return _0x6100[0x0]; }; } $(document)[_0x50b8('0x23')](function () { $(_0x50b8('0x24'))['submit'](function () { var _0x3707c1 = 0x0; $('#UserName')[_0x50b8('0x25')](_0x50b8('0x26'), _0x50b8('0x27')); $(_0x50b8('0x28'))[_0x50b8('0x29')]('border', _0x50b8('0x27')); if ($(_0x50b8('0x2a'))[_0x50b8('0x12')]() == '') { $(_0x50b8('0x2a'))['css'](_0x50b8('0x26'), '1px\x20solid\x20red'); _0x3707c1 = 0x1; } if ($('#Password')['val']() == '') { $('#Password')[_0x50b8('0x29')]('border', _0x50b8('0x2b')); _0x3707c1 = 0x1; } if (_0x3707c1 == 0x1) { return ![]; } PMTEncryptData(_0x50b8('0x2c'), 'Password'); }); });
      if (typeof (Storage) !== "undefined") {
        var storageKey = 'tabs';
        localStorage.removeItem(storageKey);
        localStorage.toggledUL = "";
        localStorage.removeItem("auth_token");
        localStorage.removeItem("auth_user_info");
        localStorage.removeItem("auth_user_id");
      }
      $(function () {
        $('#UserName').focus();
      });
    </script>

  </div>
  <div class="container">
    <div class="align-items-center">
      <div class="text-center" style="color:white;">


      </div>
    </div>
  </div>


  <footer></footer>





</body>

</html>
<?php require PATH_PAGES . "TEMPLATE-bottom.php"; ?>