<?php
// (A) GET COURSE
$course = $_CORE->autoCall("Courses", "get"); ?>

<style>
#cb-page-2 > div.d-flex.align-items-center.mb-3 > div > h4{
  font-weight: bold;
}

#cb-page-2 > form > button{
  white-space: nowrap;
}

#cb-page-2 > form > button.btn.btn-primary.p-3.mx-1.ico-sm.icon-plus{
  margin-right: 20px;
}


#cb-page-2 > form > button:nth-child(2){
  margin-right: 5px;
  background-color: #1f9e44;
  border: none;
}

#cb-page-2 > form > button:nth-child(3){
  background-color: #28b2e1;
  border: none;
}

</style>

<!-- (B) NAVIGATION -->
<div class="d-flex align-items-center mb-3">
  <div class="flex-grow-1">
    <h4 class="mb-2">DANH SÁCH THÀNH VIÊN</h4>
    <h6 class="fw-bold">
      [<?=$course["course_code"]?>] <?=$course["course_name"]?>
    </h6>
  </div>
  <!-- <button type="button" class="btn btn-danger p-3 ico-sm icon-undo2" onclick="cb.page(1)"></button> -->
</div>
<!-- (C) ADD USER TO COURSE -->
<form class="d-flex align-items-stretch head border mb-3 p-2" onsubmit="return cuser.add()">
  
  <input type="text" id="course-user-add" placeholder="Nhập Tên / MSSV" class="form-control form-control-sm">

  <button type="submit" class="btn btn-primary p-3 white-icon">
      <i class="text-secondary ico-sm icon-plus"></i> THÊM
    </button>

    <button type="button" id="add-all-users-button" class="btn btn-primary p-3 white-icon" onclick="cuser.addAllUsers()">
        <i class="text-secondary ico-sm icon-plus"></i> Thêm tất cả
    </button>
    
  <button class="btn btn-primary p-3 white-icon" type="button" onclick="cuser.import()">
      <i class="text-secondary ico-sm icon-upload3"></i> Tải tệp CSV
    </button>


</form>

<!-- (D) USERS LIST -->
<div id="course-user-list" class="zebra my-4"></div>