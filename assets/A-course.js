var course = {
  // (A) SHOW ALL COURSES
  pg: 1, // current page
  find: "", // current search
  list: (silent) => {
    if (silent !== true) {
      cb.page(1);
    }
    cb.load({
      page: "A/course/list",
      target: "course-list",
      data: {
        page: course.pg,
        search: course.find,
      },
    });
  },

  // (B) GO TO PAGE
  //  pg : int, page number
  goToPage: (pg) => {
    if (pg != course.pg) {
      course.pg = pg;
      course.list();
    }
  },

  // (C) SEARCH COURSES
  search: () => {
    course.find = document.getElementById("course-search").value;
    course.pg = 1;
    course.list();
    return false;
  },

  // (D) SHOW ADD/EDIT DOCKET
  //  code : course code, for edit only
  addEdit: (code) =>
    cb.load({
      page: "A/course/form",
      target: "cb-page-2",
      data: { code: code ? code : "" },
      onload: () => cb.page(2),
    }),

  // (E) SAVE COURSE
  save: () => {
    // (E1) GET DATA
    var data = {
      code: document.getElementById("course_code").value,
      name: document.getElementById("course_name").value,
      desc: document.getElementById("course_desc").value,
      start: document.getElementById("course_start").value,
      end: document.getElementById("course_end").value,
    };
    var ocode = document.getElementById("course_ocode").value;
    if (ocode != "") {
      data.ocode = ocode;
    }

    // (E2) VALIDATION
    if (
      data.code === "" ||
      data.name === "" ||
      data.start === "" ||
      data.end === ""
    ) {
      cb.modal("Lỗi", "Vui lòng điền đầy đủ thông tin bắt buộc.");
      return false;
    }

    // Kiểm tra định dạng mã khóa học (ví dụ: chỉ chứa chữ cái và số)
    var codePattern = /^[a-zA-Z0-9]+$/;
    if (!codePattern.test(data.code)) {
      cb.modal("Lỗi", "Mã khóa học không hợp lệ. Chỉ được chứa chữ cái và số.");
      return false;
    }

    // Kiểm tra độ dài tối đa của tên khóa học (ví dụ: tối đa 100 ký tự)
    var namePattern =
      /^[A-ZÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ][\wÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*(?: [\wÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]*)*$/;
    if (!namePattern.test(data.name)) {
      cb.modal(
        "Lỗi",
        "Tên khoá học không hợp lệ."
      );
      return false;
    }
    if (data.name.length > 100) {
      cb.modal("Lỗi", "Vui lòng nhập tên khoá học không quá 100 ký tự.");
      return false;
    }

    // (E3) DATE CHECK
    let start = new Date(data.start),
      end = new Date(data.end);
    if (start > end) {
      cb.modal("Lỗi", "Ngày bắt đầu không thể sau ngày kết thúc.");
      return false;
    }

    // (E4) AJAX
    cb.api({
      mod: "courses",
      act: "save",
      data: data,
      passmsg: "Course Saved",
      onpass: course.list,
    });
    return false;
  },

  // (F) DELETE COURSE
  //  code : course code
  del: (code) =>
    cb.modal(
      "Please confirm",
      "All course data and attendance will be lost!",
      () =>
        cb.api({
          mod: "courses",
          act: "del",
          data: { code: code },
          passmsg: "Course Deleted",
          onpass: course.list,
        })
    ),

  // (G) IMPORT COURSES
  import: () =>
    im.init({
      name: "COURSES",
      at: 2,
      back: 1,
      eg: "dummy-courses.csv",
      api: { mod: "courses", act: "import" },
      after: () => course.list(true),
      cols: [
        ["Course Code", "code", true],
        ["Course Name", "name", true],
        ["Description (if any)", "desc"],
        ["Start Date (YYYY-MM-DD)", "start", true],
        ["End Date (YYYY-MM-DD)", "end", true],
      ],
    }),
};

window.addEventListener("load", () => {
  course.list();
  autocomplete.attach({
    target: document.getElementById("course-search"),
    mod: "autocomplete",
    act: "course",
    onpick: (res) => course.search(),
  });
});
