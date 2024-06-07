-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 07, 2024 lúc 05:41 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nckh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance`
--

CREATE TABLE `attendance` (
  `class_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `a_status` tinyint(1) NOT NULL,
  `a_by` bigint(20) NOT NULL,
  `a_date` datetime NOT NULL DEFAULT current_timestamp(),
  `a_notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `class_id` bigint(20) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `class_date` datetime NOT NULL DEFAULT current_timestamp(),
  `class_name` varchar(255) DEFAULT NULL,
  `class_hash` varchar(32) NOT NULL,
  `class_location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`class_id`, `course_code`, `user_id`, `class_date`, `class_name`, `class_hash`, `class_location`) VALUES
(7, 'HKI', 1, '2024-06-01 00:00:00', 'Tham gia hỗ trợ hoạt động ', 't9hKY4FXt0EK', 'Đông Thắng'),
(8, 'HKI', 2547, '2024-06-01 00:00:00', 'Hỗ trợ gian hàng', 'Js9gqXy2SiuA', 'Trường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courses`
--

CREATE TABLE `courses` (
  `course_code` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_desc` text DEFAULT NULL,
  `course_start` date NOT NULL,
  `course_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `courses`
--

INSERT INTO `courses` (`course_code`, `course_name`, `course_desc`, `course_start`, `course_end`) VALUES
('HKI', 'Học kỳ I', '', '2024-06-01', '2024-10-01'),
('HKII', 'Học kỳ II', '', '2024-07-01', '2025-02-01'),
('HKIII', 'Học kỳ III', '', '2024-06-01', '2024-06-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `courses_users`
--

CREATE TABLE `courses_users` (
  `course_code` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `courses_users`
--

INSERT INTO `courses_users` (`course_code`, `user_id`) VALUES
('HKI', 1),
('HKI', 2547),
('HKI', 2565),
('HKI', 2566),
('HKI', 2567),
('HKII', 1),
('HKII', 2547),
('HKII', 2565),
('HKIII', 1),
('HKIII', 2547),
('HKIII', 2565);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `setting_name` varchar(255) NOT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `setting_value` varchar(255) NOT NULL,
  `setting_group` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`setting_name`, `setting_description`, `setting_value`, `setting_group`) VALUES
('APP_VER', 'Phiên bản ứng dụng', '1', 0),
('DT_LONG', ' Định dạng ngày giờ của MySQL (long)', '%d/%m/%Y %l:%i %p', 1),
('DT_SHORT', 'Định dạng ngày giờ của MySQL (short)', '%d/%m/%Y %H:%i:%S', 1),
('D_LONG', 'Định dạng ngày của MySQL (long)', '%d %M %Y', 1),
('D_SHORT', 'Định dạng ngày của MySQL (short)', '%d/%m/%Y', 1),
('EMAIL_FROM', 'Email gửi từ hệ thống', 'nguyenhoahop1903@gmail.com', 1),
('PAGE_PER', 'Số lượng mục trên mỗi trang', '20', 1),
('SUGGEST_LIMIT', 'Giới hạn gợi ý tự động hoàn thành', '8', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `user_level` varchar(1) NOT NULL DEFAULT 'U',
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_mssv` varchar(50) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_phonenumber` varchar(20) DEFAULT NULL,
  `user_class` varchar(255) DEFAULT NULL,
  `user_avatar` varchar(255) DEFAULT 'default_avatar.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_level`, `user_name`, `user_email`, `user_password`, `user_mssv`, `user_address`, `user_birthdate`, `user_phonenumber`, `user_class`, `user_avatar`) VALUES
(1, 'A', 'Nguyễn Hoà Hợp', 'nguyenhoahop1903@gmail.com', '$2y$10$UBa1mqQQCVApPOycKG1RK.Y4Rj/3ManzvbTnKxAe.1GLvReIsqhEu', 'CNDT2311034', 'Sóc Trăng', '2003-03-19', '0342321142', 'Công nghệ thông tin', NULL),
(2547, 'T', 'Nguyễn Hoà Hợp', 'admin@gmail.com', '$2y$10$UBa1mqQQCVApPOycKG1RK.Y4Rj/3ManzvbTnKxAe.1GLvReIsqhEu', '2101343', 'Sóc Trăng', '2003-06-12', '0334793743', 'Công nghệ thông tin', 'default_avatar.png'),
(2566, 'U', 'Đinh Thị Ngọc Cầm', 'nhhop2101343@student.ctuet.edu.vn', '$2y$10$UBa1mqQQCVApPOycKG1RK.Y4Rj/3ManzvbTnKxAe.1GLvReIsqhEu', 'CNDT2311034', 'Sóc Trăng', '2003-03-19', '0334793743', 'Công nghệ thông tin', '6d7217dbc542ac666c233c4eeeff15b0.jpg'),
(2585, 'U', 'Nguyễn Đăng Khoa', 'halongbro.29@gmail.com', '$2y$10$XVoArs/4QFX9xpkz0v3O5OzNYTMLk6hmIJrkimqsQ9wS1fyCbK.Oa', '2101343', 'Sóc Trăng', '2003-03-19', '0342321142', 'Công nghệ thông tin', '0512c4d56025934c135de20e4bd88b45.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_hash`
--

CREATE TABLE `users_hash` (
  `user_id` bigint(20) NOT NULL,
  `hash_for` varchar(3) NOT NULL,
  `hash_code` text NOT NULL,
  `hash_time` datetime NOT NULL,
  `hash_tries` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users_hash`
--

INSERT INTO `users_hash` (`user_id`, `hash_for`, `hash_code`, `hash_time`, `hash_tries`) VALUES
(1, 'P', 'MsD63RrPanWkGLSj4y4craRH', '2024-04-25 07:26:52', 0),
(1, 'PLC', 'a78a049e287786682c68971e8ded76b9af5456f18fbb5ac4011f0f69ad55528a', '2024-04-25 07:21:25', 0),
(6, 'P', 'aGohtdQLWtEQb5Dy7owlXOPZ', '2024-04-25 08:15:54', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`class_id`,`user_id`),
  ADD KEY `a_status` (`a_status`),
  ADD KEY `a_by` (`a_by`),
  ADD KEY `a_date` (`a_date`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `course_code` (`course_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `class_date` (`class_date`);

--
-- Chỉ mục cho bảng `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_code`),
  ADD KEY `course_name` (`course_name`),
  ADD KEY `course_start` (`course_start`),
  ADD KEY `course_end` (`course_end`);

--
-- Chỉ mục cho bảng `courses_users`
--
ALTER TABLE `courses_users`
  ADD PRIMARY KEY (`course_code`,`user_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_name`),
  ADD KEY `setting_group` (`setting_group`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `user_level` (`user_level`);

--
-- Chỉ mục cho bảng `users_hash`
--
ALTER TABLE `users_hash`
  ADD PRIMARY KEY (`user_id`,`hash_for`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2587;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
