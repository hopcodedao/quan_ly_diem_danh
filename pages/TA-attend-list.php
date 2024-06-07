<?php
// (A) GET STUDENTS & ATTENDANCE
$students = $_CORE->autoCall("Attend", "getStudents");

// (B) DRAW STUDENTS LIST
if (is_array($students)) {
    foreach ($students as $id => $s) {
        if ($s["a_status"] == 1) { // chỉ hiển thị khi sinh viên đã điểm danh
            ?>
            <div class="d-flex align-items-stretch border p-2">
                <div class="flex-grow-1">
                    <strong><?= $s["user_name"] ?> | <?= $s["user_mssv"] ?></strong>
                    <input type="hidden" class="att-i" value="<?= $id ?>">
                    <input id="att-n<?= $id ?>" type="text" class="form-control mt-2" placeholder="Ghi chú (nếu có)"
                        value="<?= $s["a_notes"] ? $s["a_notes"] : "" ?>">
                </div>
                <button type="button" class="btn btn-danger p-3 ico-sm icon-bin2" onclick="attend.del(<?= $id ?>)"></button>
            </div>
        <?php }
    } ?>

<?php } else {
    echo "Không tìm thấy thành viên.";
}
