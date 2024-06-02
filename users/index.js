document.addEventListener("DOMContentLoaded", () => {
    // Lấy danh sách tất cả các phần tử slide
    const slides = document.querySelectorAll(".divaitq9n57th");
    const dots = document.querySelectorAll(".dot");

    // Khởi tạo chỉ số slide hiện tại và ID interval
    let currentSlide = 0;
    let intervalID;

    // Hàm chuyển đến một slide cụ thể
    const goToSlide = (index) => {
        slides[currentSlide].classList.remove("active"); // Ẩn slide hiện tại
        dots[currentSlide].classList.remove("active"); // Bỏ active của nút hiện tại
        currentSlide = index; // Cập nhật chỉ số slide hiện tại
        slides[currentSlide].classList.add("active"); // Hiển thị slide mới
        dots[currentSlide].classList.add("active"); // Active nút mới
    };

    // Bắt đầu chuyển slide tự động
    const startAutoSlide = () => {
        intervalID = setInterval(() => {
            goToSlide((currentSlide + 1) % slides.length);
        }, 5000);
    };


    // Thêm sự kiện click cho các nút điều hướng
    dots.forEach(dot => {
        dot.addEventListener("click", () => {
            goToSlide(parseInt(dot.getAttribute("data-slide")));
        });
    });

    // Bắt đầu chuyển slide tự động khi DOM được tải xong
    startAutoSlide();
});
