var usr = {
  // (A) SHOW ALL USERS
  pg: 1, // current page
  find: "", // current search
  list: (silent) => {
    if (silent !== true) {
      cb.page(1);
    }
    cb.load({
      page: "A/users/list",
      target: "user-list",
      data: {
        page: usr.pg,
        search: usr.find,
      },
    });
  },

  // (B) GO TO PAGE
  //  pg : int, page number
  goToPage: (pg) => {
    if (pg != usr.pg) {
      usr.pg = pg;
      usr.list();
    }
  },

  // (C) SEARCH USER
  search: () => {
    usr.find = document.getElementById("user-search").value;
    usr.pg = 1;
    usr.list();
    return false;
  },

  // (D) SHOW ADD/EDIT DOCKET
  // id : user ID, for edit only
  addEdit: (id) =>
    cb.load({
      page: "A/users/form",
      target: "cb-page-2",
      data: { id: id ? id : "" },
      onload: () => cb.page(2),
    }),

  save: () => {
    // (E1) GET DATA
    var id = document.getElementById("user_id").value;
    var name = document.getElementById("user_name").value;
    var email = document.getElementById("user_email").value;
    var password = document.getElementById("user_password").value;
    var lvl = document.getElementById("user_level").value;
    var mssv = document.getElementById("user_mssv").value;
    var address = document.getElementById("user_address").value;
    var birthdate = document.getElementById("user_birthdate").value;
    var phonenumber = document.getElementById("user_phonenumber").value;
    var user_class = document.getElementById("user_class").value;

    // (E2) CHECK FOR EMPTY FIELDS
    if (
      name === "" ||
      email === "" ||
      lvl === "" ||
      mssv === "" ||
      address === "" ||
      birthdate === "" ||
      phonenumber === "" ||
      user_class === ""
    ) {
      cb.modal("Lỗi", "Vui lòng điền đầy đủ thông tin.");
      return false;
    }

    //VALIDATION HỌ TÊN
    var namePattern =
      /^[A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ][a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*(?:[ ][A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ][a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*)*$/;
    if (!namePattern.test(name)) {
      cb.modal("Lỗi", "Họ tên không hợp lệ! Vui lòng nhập đầy đủ họ tên.");
      return false;
    }
    //VALIDATION MÃ SỐ SINH VIÊN
    var mssvPattern = /^[a-zA-Z0-9]{1,12}$/; // Mã số sinh viên tối đa 12 ký tự (chữ và số)
    if (!mssvPattern.test(mssv)) {
      cb.modal(
        "Lỗi",
        "Mã số sinh viên không hợp lệ. Vui lòng nhập tối đa 12 ký tự và không chứa ký tự đặc biệt."
      );
      return false;
    }

    //VALIDATION LỚP HỌC
    var userClassPattern =
      /^[A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ][a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*(?: [a-zàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]+)*$/;
    if (!userClassPattern.test(user_class) || user_class.length > 50) {
      cb.modal("Lỗi", "Tên lớp không hợp lệ. Vui lòng nhập tối đa 50 ký tự.");
      return false;
    }

    // 5.2 - Kiểm tra ngày sinh hợp lệ
    // (Đặt một ngưỡng tuổi tối thiểu nếu cần)
    var today = new Date();
    var birthDate = new Date(birthdate);
    var minAge = 18; // Tuổi tối thiểu cho phép đăng ký
    var userAge = today.getFullYear() - birthDate.getFullYear();
    var monthDiff = today.getMonth() - birthDate.getMonth();
    if (
      monthDiff < 0 ||
      (monthDiff === 0 && today.getDate() < birthDate.getDate())
    ) {
      userAge--;
    }
    if (userAge < minAge) {
      cb.modal("Lỗi", "Phải đủ " + minAge + " tuổi để đăng ký.");
      return false;
    }

    var phonePattern = /^\d{10}$/; // Số điện thoại có 10 chữ số
    if (!phonePattern.test(phonenumber)) {
      cb.modal(
        "Lỗi",
        "Số điện thoại không hợp lệ. Vui lòng nhập đúng định dạng."
      );
      return false;
    }

    // (E4) EMAIL VALIDATION
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
      cb.modal("Lỗi", "Địa chỉ email không hợp lệ.");
      return false;
    }

  // Only generate a random password if it's a new user
  if (id === "") {
    var randomPassword = Math.random().toString(36).slice(-8); // Tạo chuỗi 8 ký tự
    document.getElementById("user_password").value = randomPassword;
  }

    // (E6) AJAX - SEND DATA IF ALL CHECKS PASSED
    var formData = new FormData();
    formData.append("name", name);
    formData.append("email", email);
    formData.append("password", id === "" ? randomPassword : "");
    formData.append("lvl", lvl);
    formData.append("mssv", mssv);
    formData.append("address", address);
    formData.append("birthdate", birthdate);
    formData.append("phonenumber", phonenumber);
    formData.append("class", user_class);

    // Append file avatar nếu có
    var avatarInput = document.getElementById("user_avatar_input");
    if (avatarInput.files.length > 0) {
      formData.append("user_avatar", avatarInput.files[0]);
    }
    
    if (id != "") {
      formData.append("id", id);
    }

    fetch("http://localhost/quan_ly_diem_danh/api/users/save/", {
      method: "POST",
      body: formData,
  })
      .then((response) => response.json())
      .then((data) => {
          cb.modal("Thông báo", "Lưu thành công.");
          usr.list();
      })
      .catch((error) => {
        cb.modal("Lỗi", "Có lỗi xảy ra. Vui lòng thử lại sau.");
      });

    return false;
  },

  // (F) SUSPEND USER
  //  id : int, user ID
  //  confirm : boolean, confirmed delete
  del: (id) =>
    cb.modal("Xác nhận", "Bạn có chắc chắn muốn xóa người dùng này?", () => {
      cb.api({
        mod: "users",
        act: "del",
        data: { id: id },
        passmsg: "Tài khoản người dùng đã bị xóa.",
        onpass: usr.list,
      });
    }),

  suspend: (id) =>
    cb.modal("Please confirm", "Suspend this user?", () =>
      cb.api({
        mod: "users",
        act: "suspend",
        data: { id: id },
        passmsg: "User Account Suspended",
        onpass: usr.list,
      })
    ),

  previewAvatar: (fileInput) => {
    if (fileInput.files && fileInput.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        document.getElementById("image_preview").src = e.target.result;
      };
      reader.readAsDataURL(fileInput.files[0]);
    }
  },

  // (G) IMPORT USERS
  import: () =>
    im.init({
      name: "NGƯỜI DÙNG",
      at: 2,
      back: 1,
      eg: "dummy-users.csv",
      api: { mod: "users", act: "import" },
      after: () => usr.list(true),
      cols: [
        ["MSSV", "mssv", true],
        ["Họ & tên", "name", true],
        ["Ngày sinh", "birthdate", true],
        ["Số điện thoại", "phonenumber", true],
        ["Email", "email", true],
        ["Địa chỉ", "address", true],
        ["Mậu khẩu", "password", true],
        ["Quyền (A,T,U,S)", "level", true],
      ],
    }),
};

window.addEventListener("load", () => {
  usr.list();
  autocomplete.attach({
    target: document.getElementById("user-search"),
    mod: "autocomplete",
    act: "user",
    onpick: (res) => usr.search(),
  });
});
