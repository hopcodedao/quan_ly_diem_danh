var attend = {
  // (A) SHOW CLASS ATTENDANCE PAGE
  id: null, // current class id
  show: (id) => {
    attend.id = id;
    cb.page(2);
    cb.load({
      page: "TA/attend",
      target: "cb-page-2",
      data: { id: id },
      onload: () => {
        autocomplete.attach({
          target: document.getElementById("class-user-add"),
          mod: "autocomplete",
          act: "userName",
          onpick: (res) => attend.add(),
        });
        attend.list();
      },
    });
  },

  // (B) SHOW CLASS ATTENDANCE
  list: () =>
    cb.load({
      page: "TA/attend/list",
      target: "attend-list",
      data: { id: attend.id },
    }),

  // (D) ADD USER
  add: () => {
    var field = document.getElementById("class-user-add");
    // (D2) AJAX
    cb.api({
      mod: "attend",
      act: "attendUser",
      data: {
        id: attend.id,
        user_info: field.value,
      },
      passmsg: "Điểm danh thành công",
      onpass: () => {
        field.value = "";
        attend.list();
      },
    });
    return false;
  },

  // (E) DELETE ATTENDANCE RECORD
  del: (aid) =>
    cb.modal("Please confirm", "Xoá điểm danh.", () => {
      cb.api({
        mod: "attend",
        act: "del",
        data: {
          id: attend.id,
          aid: aid,
        },
        passmsg: "Điểm danh đã xoá",
        onpass: attend.list,
      });
    }),

  // (C) TOGGLE ATTENDANCE STATUS
  toggle: (uid) => {
    // (C1) GET BUTTON
    let btn = document.getElementById("att-s" + uid);

    // (C2) TOGGLE STATUS
    if (btn.classList.contains("btn-primary")) {
      btn.classList.remove("btn-primary");
      btn.classList.add("btn-danger");
      btn.classList.remove("icon-checkmark");
      btn.classList.add("icon-cross");
    } else {
      btn.classList.remove("btn-danger");
      btn.classList.add("btn-primary");
      btn.classList.remove("icon-cross");
      btn.classList.add("icon-checkmark");
    }
  },

  // (D) SAVE ATTENDANCE
  save: () => {
    // (D1) GET ALL ATTENDANCE RECORDS
    let all = document.querySelectorAll(".att-i"),
      att = {};
    for (let a of all) {
      let id = a.value;
      att[id] = {
        s: document
          .getElementById("att-s" + id)
          .classList.contains("btn-primary")
          ? "1"
          : "0",
        n: document.getElementById("att-n" + id).value,
      };
    }

    // (D2) SEND!
    cb.api({
      mod: "attend",
      act: "save",
      data: {
        id: attend.id,
        att: JSON.stringify(att),
      },
      passmsg: "Cập nhật thành công",
    });
  },
};
