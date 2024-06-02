<?php
// (A) ADMIN + TEACHER ONLY
$_CORE->ucheck(["A", "T"]);

// (B) GET CLASS
$_CORE->load("Classes");
$class = $_CORE->Classes->get($_GET["c"]);
if (!is_array($class)) {
  exit("Yêu cầu không hợp lệ");
}

// (C) HTML PAGE ?>
<!DOCTYPE html>
<html>

<head>
  <title>QR Code</title>
  <style>
    * {
      font-family: Arial, sans-serif;
      box-sizing: border-box;
    }

    body,
    html {
      height: 100%;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #qrcode > img{
      margin: 0 auto;
    }

    #qrwrap {
      text-align: center;
      width: 500px;
      height: 500px;
      padding: 20px;
      border: 1px solid #e1e1e1;
    }

    #qrcourse {
      margin-top: 20px;
      color: #f00;
      font-size: 1em;
    }

    #qrtime {
      margin-top: 5px;
      text-transform: uppercase;
      font-size: 1em;
    }
  </style>
  <script src="<?= HOST_ASSETS ?>qrcode.min.js"></script>
  <script>
    window.onload = () => {
      new QRCode("qrcode", {
        text: '<?= json_encode([
          "i" => $class["class_id"],
          "h" => $class["class_hash"]
        ]) ?>',
        width: 400, height: 400,
        colorDark: "#000000",
        colorLight: "#ffffff",
        correctLevel: QRCode.CorrectLevel.H
      });
    };
  </script>
</head>

<body>
  <div id="qrwrap">
    <div id="qrcode"></div>
    <div id="qrcourse">[<?= $class["course_code"] ?>] <?= $class["course_name"] ?></div>
    <div id="qrtime"><?= $class["cd"] ?></div>
  </div>
</body>

</html>