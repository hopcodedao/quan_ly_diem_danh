<?php
// (A) GET USER
$edit = isset($_POST["id"]) && $_POST["id"] != "";
if ($edit) {
    $user = $_CORE->autoCall("Users", "get");
}

// (B) USER FORM ?>
<style>
    .container {
        display: flex;
        flex-direction: row;
    }

    #cb-page-2>form>div>div:nth-child(1) {
        width: 70%;
    }

    #cb-page-2>form>div>div.bg-white.border.p-4.my-3.mx-3 {
        width: 30%;
    }

    #cb-page-2>h4 {
        font-weight: bold;
    }

    #cb-page-2>form>div>div:nth-child(1)>button.my-1.btn.btn-danger.d-flex-inline {
        background-color: #8c8c8c;
        border: none;
    }

    #cb-page-2>form>div>div:nth-child(1)>button.my-1.btn.btn-primary.d-flex-inline {
        background-color: #357edd;
        border: none;
    }
</style>

<h4 class="mb-2"><?= $edit ? "CHỈNH SỬA" : "THÊM" ?> THÀNH VIÊN</h4>
<form onsubmit="return usr.save()" enctype="multipart/form-data">
    <div class="container">

        <div class="bg-white border p-4 my-3">
            <input type="hidden" id="user_id" value="<?= isset($user) ? $user["user_id"] : "" ?>">

            <input type="hidden" id="user_password" value="">
            <input type="hidden" id="user_password" name="password">

            <div class="form-floating mb-2">
                <input type="file" class="form-control" id="user_avatar_input" name="user_avatar"
                    onchange="usr.previewAvatar(this)">
                <label>Chọn Avatar</label>
            </div>

            <input type="hidden" id="current_user_avatar" name="current_user_avatar" value="<?= isset($user) ? $user['user_avatar'] : ''?>">

            <img id="user_avatar_preview"
                src="<?= HOST_ASSETS . "uploads/user_avatars/" . (isset($user) && $user['user_avatar'] ? $user['user_avatar'] : 'default_avatar.png') ?>"
                alt="Avatar Preview"
                style="max-width: 100px; max-height: 100px; display: block; margin-bottom: 10px; border-radius: 50%;">

            <div class="form-floating mb-2">
                <input type="text" class="form-control" id="user_name"
                    value="<?= isset($user) ? $user["user_name"] : "" ?>">
                <label>Họ & tên</label>
            </div>

            <div class="form-floating mb-2">
                <input type="text" class="form-control" id="user_mssv"
                    value="<?= isset($user) ? $user["user_mssv"] : "" ?>">
                <label>Mã số</label>
            </div>

            <div class="form-floating mb-2">
                <input type="text" class="form-control" id="user_class"
                    value="<?= isset($user) ? $user["user_class"] : "" ?>">
                <label>Lớp</label>
            </div>

            <div class="form-floating mb-2">
                <input type="date" class="form-control" id="user_birthdate"
                    value="<?= isset($user) ? $user["user_birthdate"] : "" ?>">
                <label>Ngày sinh</label>
            </div>

            <div class="form-floating mb-2">
                <input type="text" class="form-control" id="user_phonenumber"
                    value="<?= isset($user) ? $user["user_phonenumber"] : "" ?>">
                <label>Số điện thoại</label>
            </div>

            <div class="form-floating mb-2">
                <input type="email" class="form-control" id="user_email"
                    value="<?= isset($user) ? $user["user_email"] : "" ?>">
                <label>Email</label>
            </div>

            <div class="form-floating mb-2">
                <input type="text" class="form-control" id="user_address"
                    value="<?= isset($user) ? $user["user_address"] : "" ?>">
                <label>Địa chỉ</label>
            </div>



            <div class="form-floating mb-2">
                <select class="form-select" id="user_level"><?php
                foreach (USR_LVL as $k => $v) {
                    printf(
                        "<option %svalue='%s'>%s</option>",
                        $edit && $user["user_level"] == $k ? "selected " : "",
                        $k,
                        $v
                    );
                }
                ?></select>
                <label>Quyền User</label>
            </div>

            <button type="button" class="my-1 btn btn-danger d-flex-inline" onclick="cb.page(1)">
                <i class="ico-sm icon-undo2"></i> Quay lại
            </button>
            <button type="submit" class="my-1 btn btn-primary d-flex-inline">
                <i class="ico-sm icon-checkmark"></i> Lưu
            </button>
        </div>

        <div class="bg-white border p-4 my-3 mx-3">
            <img id="image_preview" src="" alt="Preview Image"
                style="max-width: 100%; max-height: 500px; display: block; margin: auto; border-radius: 10px;">
        </div>
    </div>

</form>