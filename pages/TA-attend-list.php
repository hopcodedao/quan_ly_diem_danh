
<?php
// (A) GET STUDENTS & ATTENDANCE
$students = $_CORE->autoCall("Attend", "getStudents");
$counter = 0; // Biến đếm cho cột STT

// (B) DRAW STUDENTS LIST
if (is_array($students)) {
  echo "<table class='table'>";
  echo "<tr><th>STT</th><th>Tên</th><th>Email</th><th>Ghi Chú</th><th>Trạng Thái</th><th>Thời Gian Điểm Danh</th></tr>";
  foreach ($students as $id=>$s) {
    $counter++; // Tăng biến đếm mỗi khi xuất một hàng mới
    echo "<tr>";
    echo "<td>{$counter}</td>";
    echo "<td><strong>".$s["user_name"]."</strong></td>";
    echo "<td>".$s["user_email"]."</td>";
    echo "<td><input id='att-n".$id."' type='text' class='form-control' placeholder='Ghi chú' value='".($s["a_notes"]?$s["a_notes"]:"")."'></td>";
    
    // Adjusted status button classes based on attendance status
    $statusClass = $s["a_status"]==1 ? "btn-success" : "btn-danger";
    $statusIcon = $s["a_status"]==1 ? "check" : "times";
    
    echo "<td><button id='att-s".$id."' value='".$id."' onclick='attend.toggle(".$id.")' class='btn ".$statusClass."'><i class='fa fa-".$statusIcon."'></i></button></td>";
    echo "<td>".($s["a_date"]?$s["a_date"]:"Chưa có")."</td>"; // Add attendance datetime
    echo "</tr>";
  }
  echo "</table>";
  echo "<button type='button' class='btn btn-primary' onclick='attend.save()'>Lưu điểm danh</button>";
} else {
  echo "No students found.";
}
?>