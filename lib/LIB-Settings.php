<?php
class Settings extends Core {
  // (A) CONSTRUCTOR - LOAD SYSTEM SETTINGS AND SET DEFAULT TIMEZONE
  function __construct ($core) {
    parent::__construct($core);
    date_default_timezone_set('Asia/Ho_Chi_Minh'); // Set the default timezone to Vietnam time
    $this->defineG(1);
  }

  // (B) AUTO DEFINE BY SETTING GROUP
  //  $group : setting group
  function defineG ($group) : void {
    foreach ($this->DB->fetchKV(
      "SELECT * FROM `settings` WHERE `setting_group`=?",
      [$group], "setting_name", "setting_value"
    ) as $k=>$v) { define($k, $v); }
  }

  // (C) AUTO DEFINE BY SETTING NAME
  //  $name : setting name (string or array)
  //  $json : json decode setting value?
  function defineN ($name, $json=false) : void {
    // (C1) SQL & DATA
    $sql = "SELECT * FROM `settings` WHERE `setting_name`";
    if (is_array($name)) {
      $sql .= " IN (";
      foreach ($name as $n) { $sql .= "?,"; }
      $sql = substr($sql,0,-1) . ")";
      $data = $name;
    } else {
      $sql .= "=?";
      $data = [$name];
    }

    // (C2) GET & DEFINE
    foreach ($this->DB->fetchKV(
      $sql, $data, "setting_name", "setting_value"
    ) as $k=>$v) { define($k, ($json?json_decode($v,true):$v)); }
  }

  // (D) GET SETTINGS
  //  $group : setting group
  function getAll ($group=1) {
    return $this->DB->fetchAll("SELECT * FROM `settings` WHERE `setting_group`=?", [$group]);
  }

  // (E) SAVE SETTINGS
  //  $settings : string, json encoded array of settings in key => value
  //  $settings : array, key => value
  function save ($settings) {
    if (!is_array($settings)) {
      $settings = json_decode($settings, true);
    }
    foreach ($settings as $k=>$v) {
      $this->DB->update("settings", ["setting_value"], "`setting_name`=?", [$v, $k]);
    }
    return true;
  }
}