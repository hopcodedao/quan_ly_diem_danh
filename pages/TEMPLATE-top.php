<!DOCTYPE html>
<html>

<head>
  <!-- (A) HEAD -->
  <!-- (A1) TITLE, DESC, CHARSET, VIEWPORT -->
  <title>Hệ thống quản lý điểm danh CTUT</title>
  <meta charset="utf-8">
  <meta name="description" content="<?= isset($_PMETA["desc"]) ? $_PMETA["desc"] : SITE_NAME ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5">
  <meta name="view-transition" content="same-origin">
  <meta name="robots" content="noindex">

  <!-- (A2) WEB APP & ICONS -->
  <link rel="icon" href="<?= HOST_ASSETS ?>ctut.png" type="image/png">
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="theme-color" content="white">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="<?= SITE_NAME ?>">
  <meta name="msapplication-TileColor" content="#ffffff">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


  <script>

  </script>
  <!-- (A3) WEB APP MANIFEST -->
  <!-- https://web.dev/add-manifest/ -->
  <link rel="manifest" href="<?= HOST_BASE ?>CB-manifest.json">

  <!-- (A4) SERVICE WORKER + HOST -->
  <script>
    if ("serviceWorker" in navigator) { navigator.serviceWorker.register("<?= HOST_BASE ?>CB-worker.js", { scope: "<?= HOST_BASE_PATH ?>" }); }
    var cbhost = { base: "<?= HOST_BASE ?>", basepath: "<?= HOST_BASE_PATH ?>", api: "<?= HOST_API_BASE ?>", assets: "<?= HOST_ASSETS ?>" };
  </script>

  <!-- (A5) LIBRARIES & SCRIPTS -->
  <!-- https://getbootstrap.com/ -->
  <link rel="stylesheet" href="<?= HOST_ASSETS ?>bootstrap.min.css">
  <link rel="stylesheet" href="<?= HOST_ASSETS ?>PAGE-cb.css">
  <script defer src="<?= HOST_ASSETS ?>bootstrap.bundle.min.js"></script>
  <script defer src="<?= HOST_ASSETS ?>PAGE-cb.js"></script>

  <!-- (A6) ADDITIONAL SCRIPTS -->
  <?php if (isset($_PMETA["load"])) {
    foreach ($_PMETA["load"] as $load) {
      if ($load[0] == "s") {
        printf("<script src='%s'%s></script>", $load[1], isset($load[2]) ? " " . $load[2] : "");
      } else {
        printf("<link rel='stylesheet' href='%s'>", $load[1], isset($load[2]) ? " " . $load[2] : "");
      }
    }
  }
  if (isset($_PMETA)) {
    unset($_PMETA);
  } ?>

</head>

<body class="bg-light">
  <!-- (B) COMMON SHARED INTERFACE -->
  <!-- (B1) NOW LOADING -->
  <div id="cb-loading" class="d-flex justify-content-center align-items-center cb-hide">
    <div class="spinner-border text-light" role="status">
      <span class="visually-hidden">Loading...</span>
    </div>
  </div>

  <!-- (B2) TOAST MESSAGE -->
  <div class="position-fixed top-50 start-50 translate-middle" style="z-index:11">
    <div id="cb-toast" class="toast hide" role="alert">
      <div class="toast-header">
        <span id="cb-toast-icon"></span>
        <strong id="cb-toast-head" class="me-auto p-1"></strong>
        <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
      </div>
      <div id="cb-toast-body" class="toast-body bg-light"></div>
    </div>
  </div>

  <!-- (B3) MODAL DIALOG BOX -->
  <div id="cb-modal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 id="cb-modal-head" class="modal-title"></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div id="cb-modal-body" class="modal-body"></div>
        <div id="cb-modal-foot" class="modal-footer">
        </div>
      </div>
    </div>
  </div>

  <!-- (C) MAIN INTERFACE -->
  <div id="cb-body" class="d-flex">
    <?php if (isset($_SESSION["user"])) { ?>
      <!-- (C1) LEFT SIDEBAR -->

      <nav id="cb-side" class="bg-dark text-white p-2">
        <ul class="navbar-nav">
          <?php require PATH_PAGES . "TEMPLATE-" . $_SESSION["user"]["user_level"] . "-menu.php"; ?>
        </ul>
      </nav>

    <?php } ?>

    <!-- (C2) RIGHT CONTENTS -->
    <div class="flex-grow-1">

      <?php if (isset($_SESSION["user"])) { ?>
        <!-- (C2-1) TOP NAV -->
        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #2f638d;">

          <div class="container-fluid">
            <button id="cb-toggle" class="navbar-toggler btn btn-sm text-white ico icon-menu"
              onclick="cb.toggle()"></button>

            <div class="navbar-nav me-auto mb-2 mb-lg-0"></div>

            <div class="d-flex align-items-center">
              <span class="text-white pe-3">Xin chào, <?= $_SESSION["user"]["user_name"] ?></span> <!-- Thêm dòng này -->
              <div class="dropdown">
                <?php if (isset($_SESSION["user"]["user_avatar"]) && $_SESSION["user"]["user_avatar"] != ""): ?>
                  <img src="<?= HOST_ASSETS . "uploads/user_avatars/" . $_SESSION["user"]["user_avatar"] ?>" alt="Avatar"
                    class="rounded-circle" width="40" height="40" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false" style="margin-right: 20px">
                <?php else: ?>
                  <img src="<?= HOST_ASSETS ?>default_avatar.png" alt="Avatar" class="rounded-circle" width="40" height="40"
                    role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <?php endif; ?>

                <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end">
                  <li><a class="dropdown-item" href="<?= HOST_BASE ?>myaccount">
                      <i class="text-secondary ico-sm icon-user"></i> Tài khoản của tôi
                    </a></li>
                  <li><a class="dropdown-item" href="<?= HOST_BASE ?>passwordless">
                      <i class="text-secondary ico-sm icon-key"></i> Passwordless
                    </a></li>
                  <li class="dropdown-item text-warning" onclick="cb.bye()">
                    <i class="ico-sm icon-exit"></i> Đăng xuất
                  </li>
                </ul>
              </div>
            </div>
        </nav>
      <?php } ?>

      <!-- (C2-2) CONTENTS -->
      <div class="p-4">
        <div id="cb-page-1">