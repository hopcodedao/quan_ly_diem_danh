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
    var name = document.getElementById("user_name").value;
    var email = document.getElementById("user_email").value;
    var password = document.getElementById("user_password").value;
    var lvl = document.getElementById("user_level").value;
    var mssv = document.getElementById("user_mssv").value;
    var address = document.getElementById("user_address").value;
    var birthdate = document.getElementById("user_birthdate").value;
    var phonenumber = document.getElementById("user_phonenumber").value;

    // (E2) CHECK FOR EMPTY FIELDS
    if (
      name === "" ||
      email === "" ||
      password === "" ||
      lvl === "" ||
      mssv === "" ||
      address === "" ||
      birthdate === "" ||
      phonenumber === ""
    ) {
      cb.modal("Error", "Vui lòng điền đầy đủ thông tin.");
      return false;
    }

    var phonePattern = /^\d{10}$/; // Số điện thoại có 10 chữ số
    if (!phonePattern.test(phonenumber)) {
      cb.modal(
        "Error",
        "Số điện thoại không hợp lệ. Vui lòng nhập đúng định dạng."
      );
      return false;
    }
    // (E3) PASSWORD STRENGTH
    if (!cb.checker(password)) {
      cb.modal("Error", "Mật khẩu phải có ít nhất 8 ký tự chữ và số.");
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
      cb.modal("Error", "Bạn phải đủ " + minAge + " tuổi để đăng ký.");
      return false;
    }

    // (E4) EMAIL VALIDATION
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
      cb.modal("Error", "Địa chỉ email không hợp lệ.");
      return false;
    }

    // (E5) OTHER VALIDATIONS...

    // (E6) AJAX - SEND DATA IF ALL CHECKS PASSED
    var data = {
      name: name,
      email: email,
      password: password,
      lvl: lvl,
      mssv: mssv,
      address: address,
      birthdate: birthdate,
      phonenumber: phonenumber,
    };

    var id = document.getElementById("user_id").value;
    if (id !== "") {
      data.id = id;
    }

    cb.api({
      mod: "users",
      act: "save",
      data: data,
      passmsg: "Thêm thành công",
      onpass: usr.list,
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
