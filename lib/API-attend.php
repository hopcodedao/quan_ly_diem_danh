<?php
// (A) API ENDPOINTS
$_CORE->autoAPI([
  "save" => ["Attend", "save", ["A", "T"]],
  "attendQR" => ["Attend", "attendQR", "U"],
  "attendUser" => ["Attend", "attendUser"],
  "del" => ["Attend", "del"]
]);

// (B) INVALID REQUEST
$_CORE->respond(0, "Invalid request", null, null, 400);