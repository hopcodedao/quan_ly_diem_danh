-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 06, 2024 lúc 09:03 AM
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
  `class_desc` text DEFAULT NULL,
  `class_hash` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`class_id`, `course_code`, `user_id`, `class_date`, `class_desc`, `class_hash`) VALUES
(4, 'DMSTVKN', 2541, '2024-01-10 00:00:00', 'CNTT0121', 'zkaq0mWmXIaO'),
(5, 'HTVCNW', 2541, '2024-01-12 00:00:00', 'CNTT0121', 'zYqVdtTt8ATP'),
(6, 'HTVCNW', 2541, '2024-01-01 00:00:00', 'CNTT0121', 'uHLLUodq4xsB');

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
('DMSTVKN', 'Đổi mới sáng tạo và khởi nghiệp', '', '2024-01-01', '2024-06-01'),
('HTVCNW', 'Hệ thống và công nghệ Web', '', '2024-01-01', '2024-06-01'),
('MNM01', 'Phần mềm mã nguồn mở', '', '2024-01-01', '2024-06-01'),
('MVTTDL', 'Mạng và truyền thông dữ liệu', '', '2024-01-01', '2024-06-01'),
('QTVBTHT', 'Quản trị và bảo trì hệ thống', '', '2024-01-01', '2024-06-01'),
('TTNT01', 'Trí tuệ nhân tạo', '', '2024-01-01', '2024-06-01');

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
('DMSTVKN', 2165),
('DMSTVKN', 2166),
('DMSTVKN', 2167),
('DMSTVKN', 2168),
('DMSTVKN', 2169),
('DMSTVKN', 2170),
('DMSTVKN', 2171),
('DMSTVKN', 2172),
('DMSTVKN', 2173),
('DMSTVKN', 2174),
('DMSTVKN', 2175),
('DMSTVKN', 2176),
('DMSTVKN', 2177),
('DMSTVKN', 2178),
('DMSTVKN', 2179),
('DMSTVKN', 2180),
('DMSTVKN', 2181),
('DMSTVKN', 2182),
('DMSTVKN', 2183),
('DMSTVKN', 2184),
('DMSTVKN', 2185),
('DMSTVKN', 2186),
('DMSTVKN', 2187),
('DMSTVKN', 2188),
('DMSTVKN', 2189),
('DMSTVKN', 2190),
('DMSTVKN', 2191),
('DMSTVKN', 2192),
('DMSTVKN', 2193),
('DMSTVKN', 2194),
('DMSTVKN', 2195),
('DMSTVKN', 2196),
('DMSTVKN', 2197),
('DMSTVKN', 2198),
('DMSTVKN', 2199),
('DMSTVKN', 2200),
('DMSTVKN', 2201),
('DMSTVKN', 2202),
('DMSTVKN', 2203),
('DMSTVKN', 2204),
('DMSTVKN', 2205),
('DMSTVKN', 2206),
('DMSTVKN', 2207),
('DMSTVKN', 2208),
('DMSTVKN', 2209),
('DMSTVKN', 2210),
('DMSTVKN', 2211),
('DMSTVKN', 2212),
('DMSTVKN', 2213),
('DMSTVKN', 2214),
('DMSTVKN', 2215),
('DMSTVKN', 2216),
('DMSTVKN', 2217),
('DMSTVKN', 2218),
('DMSTVKN', 2219),
('DMSTVKN', 2220),
('DMSTVKN', 2221),
('DMSTVKN', 2222),
('DMSTVKN', 2223),
('DMSTVKN', 2224),
('DMSTVKN', 2225),
('DMSTVKN', 2226),
('DMSTVKN', 2227),
('DMSTVKN', 2228),
('DMSTVKN', 2229),
('DMSTVKN', 2230),
('DMSTVKN', 2231),
('DMSTVKN', 2232),
('DMSTVKN', 2233),
('DMSTVKN', 2234),
('DMSTVKN', 2235),
('DMSTVKN', 2236),
('DMSTVKN', 2237),
('DMSTVKN', 2238),
('DMSTVKN', 2239),
('DMSTVKN', 2240),
('DMSTVKN', 2241),
('DMSTVKN', 2242),
('DMSTVKN', 2243),
('DMSTVKN', 2244),
('DMSTVKN', 2540),
('DMSTVKN', 2541),
('DMSTVKN', 2542),
('HTVCNW', 2245),
('HTVCNW', 2246),
('HTVCNW', 2247),
('HTVCNW', 2248),
('HTVCNW', 2249),
('HTVCNW', 2250),
('HTVCNW', 2251),
('HTVCNW', 2252),
('HTVCNW', 2253),
('HTVCNW', 2254),
('HTVCNW', 2255),
('HTVCNW', 2256),
('HTVCNW', 2257),
('HTVCNW', 2258),
('HTVCNW', 2259),
('HTVCNW', 2260),
('HTVCNW', 2261),
('HTVCNW', 2262),
('HTVCNW', 2263),
('HTVCNW', 2264),
('HTVCNW', 2265),
('HTVCNW', 2266),
('HTVCNW', 2267),
('HTVCNW', 2268),
('HTVCNW', 2269),
('HTVCNW', 2270),
('HTVCNW', 2271),
('HTVCNW', 2272),
('HTVCNW', 2273),
('HTVCNW', 2274),
('HTVCNW', 2275),
('HTVCNW', 2276),
('HTVCNW', 2277),
('HTVCNW', 2278),
('HTVCNW', 2279),
('HTVCNW', 2280),
('HTVCNW', 2281),
('HTVCNW', 2282),
('HTVCNW', 2283),
('HTVCNW', 2284),
('HTVCNW', 2285),
('HTVCNW', 2286),
('HTVCNW', 2287),
('HTVCNW', 2288),
('HTVCNW', 2289),
('HTVCNW', 2290),
('HTVCNW', 2291),
('HTVCNW', 2292),
('HTVCNW', 2293),
('HTVCNW', 2294),
('HTVCNW', 2295),
('HTVCNW', 2296),
('HTVCNW', 2297),
('HTVCNW', 2298),
('HTVCNW', 2299),
('HTVCNW', 2300),
('HTVCNW', 2301),
('HTVCNW', 2302),
('HTVCNW', 2303),
('HTVCNW', 2304),
('HTVCNW', 2305),
('HTVCNW', 2306),
('HTVCNW', 2307),
('HTVCNW', 2308),
('HTVCNW', 2309),
('HTVCNW', 2310),
('HTVCNW', 2311),
('HTVCNW', 2312),
('HTVCNW', 2313),
('HTVCNW', 2314),
('HTVCNW', 2315),
('HTVCNW', 2316),
('HTVCNW', 2317),
('HTVCNW', 2318),
('HTVCNW', 2319),
('HTVCNW', 2320),
('HTVCNW', 2321),
('HTVCNW', 2322),
('HTVCNW', 2323),
('HTVCNW', 2324),
('HTVCNW', 2540),
('HTVCNW', 2541),
('HTVCNW', 2542);

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
('DT_LONG', ' Định dạng ngày giờ của MySQL (long)', '%e %M %Y %l:%i:%S %p', 1),
('DT_SHORT', 'Định dạng ngày giờ của MySQL (short)', '%Y-%m-%d %H:%i:%S', 1),
('D_LONG', 'Định dạng ngày của MySQL (long)', '%e %M %Y', 1),
('D_SHORT', 'Định dạng ngày của MySQL (short)', '%Y-%m-%d', 1),
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
  `user_phonenumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_level`, `user_name`, `user_email`, `user_password`, `user_mssv`, `user_address`, `user_birthdate`, `user_phonenumber`) VALUES
(1, 'A', 'Nguyễn Hoà Hợp', 'nguyenhoahop1903@gmail.com', '$2y$10$AH.FMf2FzeXZeMB7zc8HvekzvPHZAnAslernhGzgKdyrDnk9cDow6', NULL, NULL, NULL, NULL),
(2165, 'U', 'Trần Minh Nghĩa', 'minhnghia112k2@gmail.com', '$2y$10$ccY345n0AZYnAIZ1lnARS.MAnhujr13SWA8VvfAQTURlmoKOz1JZC', '2001202', 'Cần Thơ', '0000-00-00', '907876046'),
(2166, 'U', 'Phạm Thị Hồng Khanh', 'pthkhanh2101373@student.ctuet.edu.vn', '$2y$10$gOtKt3dF9gfpHaZN7YoDoODIzqzAJED4rbbp2tmYIgVdlBY6o4ps6', '2101373', 'Cần Thơ', '0000-00-00', '332321142'),
(2167, 'U', 'Bùi Hoàng Nhất', 'bhnhatktpm2211044@student.ctuet.edu.vn', '$2y$10$RtiQlWfM.qOjbhayH625beUKBnpQI8ATuuRI/5pBQCEU1Y5gnqvG6', 'KTPM2211044', 'Cần Thơ', '0000-00-00', '828164955'),
(2168, 'U', 'Bùi Nguyễn Hoàng Khang', 'bnhkhang2101297@student.ctuet.edu.vn', '$2y$10$bECFgjRHu54vMrX/16FByeLEDjvAdqTiO6cPcIpr/T4uzx0lvsSny', '2101297', 'Cần Thơ', '0000-00-00', '859369677'),
(2169, 'U', 'Bùi Nguyễn Thanh Phượng', 'buip1414@gmail.com', '$2y$10$OQT/6IJPwp/NuPHiu/yDn.1lWTNefyXX2d5BA9iN8u8Xw94PxNHSW', 'LQCC2211075', 'Cần Thơ', '0000-00-00', '916859914'),
(2170, 'U', 'Bùi Thị Kiều Duyên', 'btkduyen2100949@student.ctuet.edu.vn', '$2y$10$FFEF4wmwWi5VSyHo08PnQekMcB0wvriwYj4PCiRhgd//I8Cj0k43.', '2100949', 'Cần Thơ', '0000-00-00', '932923543'),
(2171, 'U', 'Bùi Thị Kim Ngân', 'btkngan2101058@student.ctuet.edu.vn', '$2y$10$4Am/5G9YK.KiN6g8ticrfeakS3hBu4ta/6NHYjn/1uXWF1n4jQaTm', '2101058', 'Cần Thơ', '0000-00-00', '347215127'),
(2172, 'U', 'Bùi Thị Kim Quyên', 'kimquyen2113@gmail.com', '$2y$10$Oz7CcO.dmuglrf664ofr8ulj/JKj2pYSJu6FR6fU8Z9BxDvpDHqFW', 'TCNH2211033', 'Cần Thơ', '0000-00-00', '907447309'),
(2173, 'U', 'Cao Hoài Thương', 'chthuong2101069@student.ctuet.edu.vn', '$2y$10$PfT9UwttvYNvoqxoQHKz7On4.nk26HhD45/WZOqGCXmWo2W614OhW', '2101069', 'Cần Thơ', '0000-00-00', '916824522'),
(2174, 'U', 'Châu Đỗ Ngân Giang', 'giangchau2003@gmail.com', '$2y$10$UKz5vf5QFLhzKwYflS7OROhc5v439mcJDdST7Zs0s0GOa/xT48IgS', '2100125', 'Cần Thơ', '0000-00-00', '368315830'),
(2175, 'U', 'Châu Thị Bích Trâm', 'bicht7776@gmail.com', '$2y$10$Hi8p9XT250Ld4JCTnwSHCOVDTbZBkRSLlwB7AEvylzUHk5LAO1pxK', '2101400', 'Cần Thơ', '0000-00-00', '373143747'),
(2176, 'U', 'Châu Trung Tường', 'cctuong2100528@student.ctuet.edu.vn', '$2y$10$v08IYFNHxWXEbhmHDtVsT.oNV02kT4SEf8gRMNRGTRR2kUXlM39Q6', '2100528', 'Cần Thơ', '0000-00-00', '966846334'),
(2177, 'U', 'Dương Hoàng Tuấn', 'hoangtuan6126@gmail.com', '$2y$10$uqn1drvYwaplY5PTQxEp4uAwyXk3VbTE2pZyi7/j3LcIDFm1KaaP6', 'CNTP2211024', 'Cần Thơ', '0000-00-00', '365766126'),
(2178, 'U', 'Dương Ngọc Hà', 'dnhaktpm2211028@student.ctuet.edu.vn', '$2y$10$.Iwj5ft.1mvTo44eaJtX0um7R7dt0SHCchA6aXjXKWQVzbgMzl62a', 'KTPM2211028', 'Cần Thơ', '0000-00-00', '918882320'),
(2179, 'U', 'Đặng Hồng Đẹp', 'Hongdep139@gmail.com', '$2y$10$mdJ1PslFdbyoEs1QW15fIe6wmiovtav.Ulo8eJmR/eE7gSaG2IcDm', '2101006', 'Cần Thơ', '0000-00-00', '378225594'),
(2180, 'U', 'Đặng Hồng Thu', 'hthu11710@gmail.com', '$2y$10$hMbLikrIXdtoDB92MMqoNu3PHfJTCupe9x0gN1qifZbXqkGkYX2T.', 'LUAT2211022', 'Cần Thơ', '0000-00-00', '945700553'),
(2181, 'U', 'Đặng Mỹ Huyền', 'myhuyen2812004@gmail.com', '$2y$10$HOzXZ35pvJsAIyESL2Alieun7nPgSR92hBvexSLlw.2lMpvyqjINy', 'CNTT2211038', 'Cần Thơ', '0000-00-00', '939837176'),
(2182, 'U', 'Đặng Phan Nhật Hằng', 'dangphannhathang03@gmail.com', '$2y$10$N66qQIzYwpfVummMeXaf9ef1ABAjn4M1i4wU7vs5vxp35HnxzQ3Dm', '2100029', 'Cần Thơ', '0000-00-00', '346071043'),
(2183, 'U', 'Đặng rui bi', 'ruibi2204@gmail.com', '$2y$10$jg/ywAIRZM9uw0WQu3MQIetW4/tKrY/SwPNKFQcB.hH3ex4RARikO', 'CNCD2211024', 'Cần Thơ', '0000-00-00', '837243250'),
(2184, 'U', 'Đặng Văn Hậu', 'dvhau2101424@student.ctuet.edu.vn', '$2y$10$BvHwTC5Y9J9omZtvfh4O2Ojqast0waBndNcwxkY9mxWXzXNjps5i.', '2101424', 'Cần Thơ', '0000-00-00', '787864974'),
(2185, 'U', 'Đinh Ngọc Ánh', 'anhdinh21019804@gmail.com', '$2y$10$oWatsEweDTRKN9dUXHjct.1Dat8iOtkpdZyBi6bPAK9ExUhCpGG3y', 'QLCN2211061', 'Cần Thơ', '0000-00-00', '856983437'),
(2186, 'U', 'Đinh Thị Huỳnh Như', 'nhuchimte33@gmail.com', '$2y$10$WhwB4CowMUZ1WVixh9zu7u44mj4A1MYl1cQw6B0QViKc/0tAWhltq', '2000894', 'Cần Thơ', '0000-00-00', '772190650'),
(2187, 'U', 'Đinh Thị Ngọc Cầm', 'dtncam2100458@student.ctuet.edu.vn', '$2y$10$gpYtcuukcnuC8nSAw/ALWeEyUcdxdhkstWNb/j43jfS9ZL1vQ8ThG', '2100458', 'Cần Thơ', '0000-00-00', '328804416'),
(2188, 'U', 'Đinh Thị Tú Ngân', 'dinhthitungan@gmail.com', '$2y$10$7PrigPz1FDHhvfuMk22zs.mciGqzOcM7HBWD7B5.1x.ppXjbR2gWi', '2101504', 'Cần Thơ', '0000-00-00', '707484997'),
(2189, 'U', 'Đoàn Phước Hiền', 'www.doanhien0519@gmail.com', '$2y$10$iZXoaLyJgNP6m9ql8VK6dOf8PVVe4f50/7fdGuL8VxTz4UaJZUwZG', 'QTKD2211088', 'Cần Thơ', '0000-00-00', '706992497'),
(2190, 'U', 'Đoàn Phương Thảo', 'dpthao2101353@student.ctuet.edu.vn', '$2y$10$Z4CskKzcHih/ZMegCZqGJunS5dNoYJRMEbrzTFjkpWOBWEACwbyB6', '2101353', 'Cần Thơ', '0000-00-00', '859300378'),
(2191, 'U', 'ĐOÀN TÂN TIẾN', 'doantantien040320004@gmail.com', '$2y$10$MP8rj.NYY0Ez7o0Kvo.co.7XAvpV.HveKxn5EDFrf1YWJG6oRxmzq', 'CNDT2211003', 'Cần Thơ', '0000-00-00', '704913012'),
(2192, 'U', 'Đỗ Đăng Khoa', 'dodangkhoa099@gamil.com', '$2y$10$i8nWZLIRWgI3XudXM.WNPOuQ5uPtUTyo6zzEgbUlszXBehNPa8Yc2', '2101566', 'Cần Thơ', '0000-00-00', '941079099'),
(2193, 'U', 'Đổ Kim Chúc', 'dkchuc2101287@student.ctuet.edu.vn', '$2y$10$1ZVGjHBBpcMAw5k1Ovk2z.r5zvJf7U64RPa2zrnjeC4NKH48IWe0G', '2101287', 'Cần Thơ', '0000-00-00', '358532506'),
(2194, 'U', 'Đỗ Ngọc Như Quỳnh', 'doquynh16082004@gmail.com', '$2y$10$dDUFgtwneMqqzV01BkEhte4zEYhWO8PCashwk2mluxE/S.Qu9ozre', 'QTKD2211062', 'Cần Thơ', '0000-00-00', '776504114'),
(2195, 'U', 'Đỗ Thị Kim Ngân', 'ngannkim78@gmail.com', '$2y$10$c5/y35UjM1fj7tE.qQ.0juvlHSjEoQGMKztAhUWmyTmNTSg6HBA7a', 'CNTP2211009', 'Cần Thơ', '0000-00-00', '787955008'),
(2196, 'U', 'Đỗ Thị Minh Thư', 'Thucutephomaique51@gmail.com', '$2y$10$G9Il4/JNVjqzj3q49Ed29u5ZqYYU3EVkY8hymVayJGmwSGidH8kva', '2101010', 'Cần Thơ', '0000-00-00', '907627366'),
(2197, 'U', 'Đỗ Thị Mỹ Liên', 'dtmlien214@gmail.com', '$2y$10$yfqTnO85GhECghTdBuXRkejT2B.54JJxNT1kB4qq8HKARQUehsrZW', '2100804', 'Cần Thơ', '0000-00-00', '915970695'),
(2198, 'U', 'Đồng Văn Thuận', 'dvthuan2100129@student.ctuet.edu.vn', '$2y$10$IB.OFqn/MrMKD5PK/EAtLeWNyGZXSJoMOqOl0uCka66u2K.xyS/fe', '2100129', 'Cần Thơ', '0000-00-00', '399453767'),
(2199, 'U', 'HÀ GIA BẢO', 'Hgbao1301@gmail.com', '$2y$10$17msdJr1eJJla.ZJKKtwIe8vAO3fQSC/oSOGYw6kq9G.7CvcXyXcu', 'CNTT2211011', 'Cần Thơ', '0000-00-00', '963850348'),
(2200, 'U', 'Hà Phúc Hậu', 'phuchau090121@gmail.com', '$2y$10$a.WBjD/InGOsdq7CboqGMO5h3J0vhIbcfFCRhnllf5w.yRQ4pAh/W', 'CNCD2211044', 'Cần Thơ', '0000-00-00', '352423350'),
(2201, 'U', 'Hà Tấn Minh', 'htminhktpm2211078@student.ctuet.edu.vn', '$2y$10$Hpn/FE/rg6dS/E0J0.I.NuB5W6MiU4XyadxmpIN3MOWdXqku2w0PO', 'KTPM2211078', 'Cần Thơ', '0000-00-00', '345334311'),
(2202, 'U', 'Hồ Huỳnh Hân', 'han921405@gmail.com', '$2y$10$X.FGMftniYZpKSlfBz1ixeKmf0J6zOkJTK6Rr9hSnBBaWQWnj4Iom', '2100838', 'Cần Thơ', '0000-00-00', '907369178'),
(2203, 'U', 'Hồ Thị Thảo Vy', 'httvy2000572@student.ctuet.edu.vn', '$2y$10$lAB9wVJHwFRs1owvLbYlmehNIdWl5pREvxnZXd.UpFkM9g72BjVrm', '2000572', 'Cần Thơ', '0000-00-00', '786884720'),
(2204, 'U', 'Huỳnh An Tim', 'huynhantim.st.2019@gmail.com', '$2y$10$9QGDqrxUmwgVr98m73W.pupdwXqBujbUFsQFBg8sd2/WfcuApgKGu', 'QTKD2211043', 'Cần Thơ', '0000-00-00', '336856784'),
(2205, 'U', 'Huỳnh Hoa Thủy Tiên', 'htien6021@gmail.com', '$2y$10$9asRHDOjsEF3J0KlMpvlB.ZUa0uwd6Ce1gzMybr0/FjMzjFSKHnf.', 'QTKD2211025', 'Cần Thơ', '0000-00-00', '901248423'),
(2206, 'U', 'Huỳnh Kim Dung', 'Kimdung.96171@gmail.com', '$2y$10$38u.57yaVJFbjJnJ9.BPPORV9/X/hho/SZIiKROlW3OO9A.AqdY1e', '2101275', 'Cần Thơ', '0000-00-00', '796996171'),
(2207, 'U', 'Huỳnh Minh Nhựt', 'hmnhutktpm2211039@student.ctuet.edu.vn', '$2y$10$a/Y.llzipOlGyEbJU7zO8O4UPA93E1f8xnd2ZFdXUP1rLj/auF2GS', 'KTPM2211039', 'Cần Thơ', '0000-00-00', '917406583'),
(2208, 'U', 'Huỳnh Minh Pháp', 'phaphuynh0809@gmail.com', '$2y$10$vqULUWtU.ZiKNO.uhBRbOuTf5PL5wF3ZKj8DKtQ4xL/L.HYtfM5wq', 'CNTT2211063', 'Cần Thơ', '0000-00-00', '344134726'),
(2209, 'U', 'Huỳnh Ngọc Hân', 'Hngochan2004@gmail.com', '$2y$10$YHmjcUcX/9djnzu/BbGgSeeSF/x6Xjnc3t8kyWliGq3.WooIWytfC', 'TCNH2211002', 'Cần Thơ', '0000-00-00', '904420225'),
(2210, 'U', 'Huỳnh ngọc ngân', 'Hnngan140204@gmail.com', '$2y$10$v4JCfvOlRMUHrW6G39UvUumDa.4BFsXxuSpSayXG7QrkXw9xX4iUK', 'CNTP2211046', 'Cần Thơ', '0000-00-00', '338836743'),
(2211, 'U', 'HUỲNH NHƯ Ý', 'hnyhttt2211015@student.ctuet.edu.vn', '$2y$10$OloNIRXPCOX0bGAbc5uCWu/tWnMmkC7TX1Pp6.5UPdg4OnEME1Gmi', 'HTTT2211015', 'Cần Thơ', '0000-00-00', '982147252'),
(2212, 'U', 'HUỲNH QUỐC DƯƠNG EM', 'huynhem.002197003193@gmail.com', '$2y$10$d13pQQT/ZPypDdBk5w9VgufRZSMV6ruMGbaAAA2TBxl6UWP/bZ6uG', 'CNTP2211023', 'Cần Thơ', '0000-00-00', '363736224'),
(2213, 'U', 'Huỳnh Tấn Lộc', 'huynhtanloc432004@gmail.com', '$2y$10$WjNFQ9U95iY1FAQVsjDgQOc9wQKYjthJPsCsGsrDOSdyRJpb9NDEm', 'KTPM2211008', 'Cần Thơ', '0000-00-00', '931891832'),
(2214, 'U', 'Huỳnh Thảo Nguyên', 'htnguyen2101012@student.ctuet.edu.vn', '$2y$10$FqMcqQY/SGHjwwh2EUk4wOZXiXY0s1S249Z0.IrsYePWyO8u.MQlm', '2101012', 'Cần Thơ', '0000-00-00', '898233718'),
(2215, 'U', 'Huỳnh Thị Anh Đào', 'Huynhdao0806@gmail.com', '$2y$10$Sz8QPS5kGoErBgvRkvXaOuKh2O77GIqyx9OrU6P1VrC7azO4cGY7e', '2100156', 'Cần Thơ', '0000-00-00', '706934099'),
(2216, 'U', 'Huỳnh Thị Cẩm Đào', 'h.t.camdaoA2@gmail.com', '$2y$10$sHto.Xcg7Y1nCab..GCYteTJO4wrfKRw4xpjDtKmLUFIPW1VyAVPC', '2101564', 'Cần Thơ', '0000-00-00', '919941261'),
(2217, 'U', 'HUỲNH THỊ MỸ DUNG', 'mydunn123456@gmail.com', '$2y$10$cOPB3W6T8uORh01grGyaXOvtvoJVt8Sp4d17pije4Y8ddlM2iEo72', 'LUAT2211020', 'Cần Thơ', '0000-00-00', '327021892'),
(2218, 'U', 'Huỳnh Thị Mỹ Trinh', 'huynhthimytrinhnnst@gmail.com 0', '$2y$10$6G9D04sF3c04boEvMu7dHevIRVTJ5DRIiIePpOb3OshWL4Wy7Pesa', 'CNTP2211003', 'Cần Thơ', '0000-00-00', '327112664'),
(2219, 'U', 'Hứa Phúc Khang', 'huaphuckhang11@gmail.com', '$2y$10$v18IGxrZWVPdi4SkzkaQyOBvqlLje.G.LeG19B8Kegdl.8Y7Hqpzy', '2100288', 'Cần Thơ', '0000-00-00', '368882972'),
(2220, 'U', 'Khưu Vĩnh Huy', 'k.v.huy7122004@gmail.com', '$2y$10$fXme2AqrSSSzFI5ucjxEXOJ8JgJOWFQodHyuiaunvQgQWeSDeExTG', 'CNCĐ2211038', 'Cần Thơ', '0000-00-00', '924857072'),
(2221, 'U', 'La Thị Diễm My', 'ltdmy2101451@student.ctuet.edu.vn', '$2y$10$VW57DZk5q1roqeYOZNly4OT4b3liqoG0huTjUQupSqWWPlhOdgMUK', '2101451', 'Cần Thơ', '0000-00-00', '987730663'),
(2222, 'U', 'La Thị Mỹ Nữ', 'lathimynu2002@gmail.com', '$2y$10$3lSy3tNGGnfGjOCeK56opeeS.OMnltkCpdUbjYFmXkzHwgnlgZXGu', '2101033', 'Cần Thơ', '0000-00-00', '976875730'),
(2223, 'U', 'Lâm Quốc Hiển', 'lamhien467@gmail.com', '$2y$10$QoBAmn2e/pOgq644SFPU8.OOqHbXToDgL5KaaN3MOuJU5mZanHK02', 'CNCĐ2211005', 'Cần Thơ', '0000-00-00', '343122177'),
(2224, 'U', 'Lâm Thị Mỹ Anh', 'myanhlam03@gmail.com', '$2y$10$uTPdufgHV5tRojbL3FESO./I9G8PPyJgiPtxZ.Q3dxpC4QbNcayKi', '2101391', 'Cần Thơ', '0000-00-00', '837092790'),
(2225, 'U', 'Lê Âu Cơ', 'colee3829@gmail.com', '$2y$10$X6VIMaYwwml2PGwK47q1eezKWiVDNyMu4iaK8QsP8OZWU5jaVyaJO', 'KETO2211076', 'Cần Thơ', '0000-00-00', '944613709'),
(2226, 'U', 'Lê Bảo Trúc Ngân', 'Trucngan999999@gmail.com', '$2y$10$8602diaXUWm2h0nCQ4pgXOGKty0x0qu.JPJY1DF2fBPn3s4wwMU8S', '2000737', 'Cần Thơ', '0000-00-00', '362330097'),
(2227, 'U', 'Lê Bích Hộp', 'bichhop2106nd@gmail.com', '$2y$10$KEzjFshwxW5VGvbFpsDHW.FRe2YZU3tAy.h3zJtzpuLeazh9/OlDC', 'CNTP2211051', 'Cần Thơ', '0000-00-00', '379063108'),
(2228, 'U', 'Lê Đặng Quỳnh Như', 'quynhnhuct2003@gmail.com', '$2y$10$fxfHNaUydygYS/TaS31HluuFbrz8tTClBjmX41PhCN10qXR8PXFPq', '2101404', 'Cần Thơ', '0000-00-00', '934386205'),
(2229, 'U', 'Lê Hoàng An An', 'lhaan2101317@student.ctuet.edu.vn', '$2y$10$Ng5PdqK7qGQPgQymls/KyOT6t5WC3KUyLlJAab7dFMTzc2Lg6slwC', '2101317', 'Cần Thơ', '0000-00-00', '765802196'),
(2230, 'U', 'Lê Hoàng Sang', 'lhsang2000523@student.ctuet.edu.vn', '$2y$10$fGVjP4WjlwAMXKJQLlvWw.ujf8U37Pte9yUq.jcSUuj/5gZcw.tE.', '2000523', 'Cần Thơ', '0000-00-00', '375615431'),
(2231, 'U', 'Lê Hồng Phúc', 'phucl4420@gmail.com', '$2y$10$btHpZYeLjhqiJ171fqtKye35zsSr3p2s21MgMBrG.3n2/Ih12vgQW', '2100207', 'Cần Thơ', '0000-00-00', '386865822'),
(2232, 'U', 'Lê Huỳnh Tuyết Ngân', 'lengan122004@gmail.com', '$2y$10$Xuv9cN8xf618IHyMGRShm.n1n.WIYrv0PIOq.c12J3u7PRyROvf16', 'CNTP2211047', 'Cần Thơ', '0000-00-00', '944167790'),
(2233, 'U', 'Lê hữu hiệp', 'Huuhiep120@gmail.com', '$2y$10$FqUERegx3cSD9SgEcF/yAOf1g27etDjrSRQctgTPjYgb.CamKa6K6', '2101363', 'Cần Thơ', '0000-00-00', '919437714'),
(2234, 'U', 'LÊ MINH HIẾU PHỤNG', 'leminhhieuphung2802@gmail.com', '$2y$10$Vw7XAlQyELgp28EKnKN3reaMWy/Tx5m600gEQIXdVEHl8uy6rxQca', 'CNTP2211039', 'Cần Thơ', '0000-00-00', '343781002'),
(2235, 'U', 'Lê Minh Nghĩa', 'lmnghia2100169@student.ctuet.edu.vn', '$2y$10$eT2svXiBWLD0ar5rEC12ue3YOtNkzHXlP.8Hb7stCL6qUv1vgst16', '2100169', 'Cần Thơ', '0000-00-00', '949323630'),
(2236, 'U', 'Lê Minh Nhựt', 'lmnhut2101497@student.ctuet.edu.vn', '$2y$10$A.LNcaLq479SU/.VxYsTq.yemDoihl02Bb6A/hurmIJKecE5Auo7i', '2101497', 'Cần Thơ', '0000-00-00', '965406728'),
(2237, 'U', 'Lê Minh Tâm', 'lmtamhttt2211063@student.ctuet.edu.vn', '$2y$10$.Vxw0C2j3IP0Xl1/YpyzoOfU33pKzZsAfxTAo5aIqesJ9rpQxiL52', 'HTTT2211063', 'Cần Thơ', '0000-00-00', '327598599'),
(2238, 'U', 'Lê Minh Trí', 'lmtri2101514@student.ctuet.edu.vn', '$2y$10$s00UXV6aDW.Au49TZU0XQOqvWb.zXgyF41XokMcAbMGJvIwO1GS3i', '2101514', 'Cần Thơ', '0000-00-00', '966445406'),
(2239, 'U', 'Lê Ngọc Trân', 'lntran2101418@student.ctuet.edu.vn', '$2y$10$NrsnvbJOosU6D5HWujmYMOgG/6bAfSeqq0DqndwhXyAsQPB9dVixG', '2101418', 'Cần Thơ', '0000-00-00', '706736350'),
(2240, 'U', 'Lê Nguyễn Bình', 'lnbinhngna2211040@student.ctuet.edu.vn', '$2y$10$5i2OERR4RsgwWvX3gf/VTumFBnBH/TseIfFmEWdXl7iFxl0xVMNaq', 'NGNA2211040', 'Cần Thơ', '0000-00-00', '357244207'),
(2241, 'U', 'Lê Nguyễn Khôi Nguyên', 'lnknguyen2101201@student.ctuet.edu.vn', '$2y$10$Xxh1RuhtXn/T3Q19gFRFV.Y82jbuTa6kM8Qy076D.lStvRLnH5cUG', '2101201', 'Cần Thơ', '0000-00-00', '384953536'),
(2242, 'U', 'Lê Nguyễn Lan Anh', 'tn2318928@gmail.com', '$2y$10$aIXsmoAnz5IKQe5td3tJ6.GDnlKYYlBwOaSXjVGfxMofLdthX70eO', 'LUAT2211035', 'Cần Thơ', '0000-00-00', '939821159'),
(2243, 'U', 'Lê Nhật Anh', 'lnanhcntt2211016@student.ctuet.edu.vn', '$2y$10$lkmlUOpJEVEJEHkOigXG9OyLs7wirKtEKQHQ9T5G1Ob/gUOpM87zq', 'CNTT2211016', 'Cần Thơ', '0000-00-00', '907894299'),
(2244, 'U', 'Lê Nhỉ Khang', 'nhikhang92nd@gmail.com', '$2y$10$.Qw/jglV0rsKF3EvbpEewuc67moMM7rU/m9y2CmHsmZi1XQvW.wtG', 'CNDD2211050', 'Cần Thơ', '0000-00-00', '775830440'),
(2245, 'U', 'Lê Phú Qưới', 'lephuquoi8005@gmail.com', '$2y$10$qksxpQNJie72rxo12u1uvevlTn9yZ/M8Vk1QHyOpv60pAdz.gNerC', '2001037', 'Cần Thơ', '0000-00-00', '357848005'),
(2246, 'U', 'Lê Quốc Đại', 'lequocdai1082004@gmail.com', '$2y$10$ysYbwoi/Qwy45ErGV96yMuEBXi7tYFR.UPj.C1IhJCtOGrjMCPkdW', 'CNTT2211047', 'Cần Thơ', '0000-00-00', '766968178'),
(2247, 'U', 'Lê Tuyết Lan', 'ltlan2101211@student.ctuet.edu.vn', '$2y$10$dsQG4icZfPdvgQ3bFEMTCuVJDDemT3F7p021X9FDIjS4CIbFHm2R2', '2101211', 'Cần Thơ', '0000-00-00', '868953950'),
(2248, 'U', 'Lê Tuyết Nhi', 'lenhi19102004@gmail.com', '$2y$10$U0yMUzgg3s5wrBth9xx/guL0PHVZOGihgJSsZMKDJIBy2HADpDDWe', 'KETO2211019', 'Cần Thơ', '0000-00-00', '941970232'),
(2249, 'U', 'Lê Thành Phát', 'ltphat2101517@student.ctuet.edu.vn', '$2y$10$lO1TYcvYN.KCjh8QOyw5..AsJ.3GkhoTrvvnLfaXCKFEXiUI2vXk2', '2101517', 'Cần Thơ', '0000-00-00', '898815921'),
(2250, 'U', 'Lê Thị Ánh Như', 'anhu07204@gmail.com', '$2y$10$MER0Evg17DNu02sEP2GsdOjZB4NUBRMDA5oOxyhQ9YkNUPoUczH2q', 'CNTP2211074', 'Cần Thơ', '0000-00-00', '329105456'),
(2251, 'U', 'Lê Thị Ánh Thư', 'ltathu2101576@student.ctuet.edu.vn', '$2y$10$QkY4BFC2/PntHtYnpcAszefR40UQng.ErbtWQ84wiQwB0Nm5j6lhW', '2101576', 'Cần Thơ', '0000-00-00', '828945007'),
(2252, 'U', 'Lê Thị Huyền Trân', 'quyebtran090904@gmail.com', '$2y$10$5iq18AvJXlh/qlatAuKl6.jqMxvh2.H627JNau5Wf48qqPIIyZ86K', 'QLCN2211036', 'Cần Thơ', '0000-00-00', '775664974'),
(2253, 'U', 'Lê Thị Ngọc Trúc', 'ltntruccntp2211030@student.ctuet.edu.vn', '$2y$10$8IyaEu1DaviNuqAa5p0H8.pGJTkDF5fZpHZpOBieu5jrNxo8pfyeW', 'CNTP2211030', 'Cần Thơ', '0000-00-00', '388580843'),
(2254, 'U', 'Lê Thị Phương Anh', 'umon0710@gmail.com', '$2y$10$FqqNGYNoxkm6Wg0ao8bc.ON35dBihSAzzhu1WLGfg83olYXoDrEPm', '2100275', 'Cần Thơ', '0000-00-00', '852681817'),
(2255, 'U', 'Lê Thị Tuyết Mai', 'lttmai2100964@student.ctuet.edu.vn', '$2y$10$AzZ9otJjqLwcZeXSPwLhbOxSS6SpR.wAeJ/FgfS9rHkdKJiO2r9Aq', '2100964', 'Cần Thơ', '0000-00-00', '981282395'),
(2256, 'U', 'LÊ THỊ THANH THẢO', 'lttt240503@gmail.com', '$2y$10$.eeFDHpCnNTDas7cii1wuugkWvyGgZQBF5NsgiBMwRQeuqMl01tH.', '2101326', 'Cần Thơ', '0000-00-00', '945612826'),
(2257, 'U', 'Lê Thị Thanh Thảo', 'lttthao2001066@student.ctuet.edu.vn', '$2y$10$0Ro1mXM8DpExKHi.DGBn1eXIq7c2YQ1Zvoc6OAuD6lc2erJBlTKlm', '2001066', 'Cần Thơ', '0000-00-00', '373009497'),
(2258, 'U', 'LÊ THỊ XUYÊN', 'xuyenle1102@gmail.com', '$2y$10$yvGmPXgN5HMyyhCdZE4D7eH72V6RHUnUUbffqZKF6WqmzBJ1z3ZQ6', 'CNTP2211041', 'Cần Thơ', '0000-00-00', '974424001'),
(2259, 'U', 'LÊ THỊ YẾN NHƯ', 'ltynhuqlcn2211010@student.ctuet.edu.vn', '$2y$10$WDrHaLs1M.q59GTzNhll9enzEzgOwuZ9bj8TL/PZE3j4y/DQIEP9a', 'QLCN2211010', 'Cần Thơ', '0000-00-00', '386004849'),
(2260, 'U', 'Lê Trần Thế Gia', 'thgia266@gmail.com', '$2y$10$k7.0v81iUGrgDGpGmfwAeOmavFSjABeqxVhfL6B75Wp6dcH0VnuGq', '2100812', 'Cần Thơ', '0000-00-00', '399747626'),
(2261, 'U', 'Lê Văn Chọn', 'lvchon2000897@student.ctuet.edu.vn', '$2y$10$rIv7uU8ZBjg0cgAwO2b0qutx5Tpc.x9UlbUYbSV7xI6Rg8IBgcmcy', '2000897', 'Cần Thơ', '0000-00-00', '943017848'),
(2262, 'U', 'Lê Văn Dinh', 'lVĐinhktpm2211053@student.ctuet.edu.vn', '$2y$10$lU6pxqGH9EOy3ZnWKXnpzOEh8AF.//YYHG9QXoJKiYXl1gmUwcUaa', 'KTPM2211053', 'Cần Thơ', '0000-00-00', '365858443'),
(2263, 'U', 'Lê Văn Lý', 'levanly0772885509@gmail.com', '$2y$10$8Ax.x517v2i0iNmR45ppKeuVta8auGlA8RJKZQOw6lsgHg8sSTuSq', 'CNCD2211006', 'Cần Thơ', '0000-00-00', '772885509'),
(2264, 'U', 'Lê Xuân Phát', 'phatlexuan2k4@gmail.com', '$2y$10$WUzCuI/KLCgWJ67FlxmAqOJYgX/6Pt1pxl6/YWUj42P4gS0IMgQxa', '2211042', 'Cần Thơ', '0000-00-00', '941172024'),
(2265, 'U', 'Lương Minh Trí', 'luongminhtri72@gmail.com', '$2y$10$doZoF5u7xFs6t38p.msabOMm07qm1mHWvc2Bt6OZJatAnpxeVkegK', 'CNCD2211057', 'Cần Thơ', '0000-00-00', '778146581'),
(2266, 'U', 'Lương Thị Diệu Hiền', 'lhien8331@gmail.com', '$2y$10$jMIyVQmmgx3SgzBFYk09leIxHb0wM1wbxHkZh2Qc2XW8XImokvp26', 'QLCN2211064', 'Cần Thơ', '0000-00-00', '326230629'),
(2267, 'U', 'Lương Văn Hậu', 'luonghau.com@gmail.com', '$2y$10$7pf.QYg44Q96X9bwfk22mOcWgFkyt/yy5qxZsrz3uTpSRHLYhHCZK', '2100622', 'Cần Thơ', '0000-00-00', '706407944'),
(2268, 'U', 'Lưu Thiện Phát', 'phatluu264@gmail.com', '$2y$10$7S1OCg.8qhGOl67iTdFjwumgauCeNE9a8KRL0E3urZjqxuNjlxIAm', 'CNTP2211072', 'Cần Thơ', '0000-00-00', '793954037'),
(2269, 'U', 'Lý Hoàng Minh', 'lhminh2000111@student.ctuet.edu.vn', '$2y$10$cseiBEEfnoy2qJ6l36uH8O1WNQ18CAGVxt25Q0.OyFpSIBJqQ7cTu', '2000111', 'Cần Thơ', '0000-00-00', '362645737'),
(2270, 'U', 'Lý Kim Hoàng', 'lkhoang2100115@student.ctuet.edu.vn', '$2y$10$UZ./MqvuMPyy0VFnToHoh.ek4x2bd2VV2ZGOPWei5/ii04TfUM9Ra', '2100115', 'Cần Thơ', '0000-00-00', '818334566'),
(2271, 'U', 'Lý Kim Ngân', 'lknganluat2211033@student.ctuet.edu.vn', '$2y$10$jc5pUurVIz8oqPIyfVMN7e3Te79SH.5O1Qzw/yeroSsV0Dnkftlfu', 'LUAT2211033', 'Cần Thơ', '0000-00-00', '776528176'),
(2272, 'U', 'Lý Thị Minh Châu', 'minhchautp948@gmail.com', '$2y$10$iHpM3iPnF1JCz4UeFkdRUOM20IRC7Wbq18HJ0//MKmFsRI3D9Mk7y', 'QLCN2211031', 'Cần Thơ', '0000-00-00', '326891237'),
(2273, 'U', 'Lý Thụy Mỹ Ngọc', 'lythuymyngoc310@gmail.com', '$2y$10$O36PHzIqZ.uSNfuQFbRa4.KDi9KTHCfldJwBDCfLqpS671i4YuNMW', 'HTTT2211049', 'Cần Thơ', '0000-00-00', '866907310'),
(2274, 'U', 'Mã Thị Mỹ Xuyên', 'mathimyxuyen5918@gmail.com', '$2y$10$g52ID1NHuF7pcSuRr7y0Ke68hXfxRx2.uq8bl71FsME263qRHyS62', 'LUAT2211031', 'Cần Thơ', '0000-00-00', '829067363'),
(2275, 'U', 'Ngô Minh Nhựt', 'nmnhut2001113@student.ctuet.edu.vn', '$2y$10$sW/6gUxRFEEmltWpZStVGuxG.A3ROeCJZn/okMr5yW8/0ySvb5imW', '2001113', 'Cần Thơ', '0000-00-00', '372834404'),
(2276, 'U', 'NGÔ THỊ DIỄM NGỌC', 'ngodiemngoc07022004@gmail.com', '$2y$10$C8XpRP.0csJtXubSAiDfr.T8BRsL.7okkSc41eVCx1Zh/gWbPr93u', 'CNDD2211006', 'Cần Thơ', '0000-00-00', '832847010'),
(2277, 'U', 'Nguyễn Cát Chiêu Anh', 'Chieuanh3010@gmail.com', '$2y$10$PfvslXaluY9wl/z8WBv9u.G/zD7VHSrITqiUIzVHig8Ge1qhpn7Oe', '2100228', 'Cần Thơ', '0000-00-00', '383080381'),
(2278, 'U', 'Nguyễn Công Thức', 'thuctk04@gmail.com', '$2y$10$TKrBHK3s2AYPrG4QaWGukOIvnPQKU9RDr6.v0gXwXZEMs5FTcTaL2', 'KTPM2211025', 'Cần Thơ', '0000-00-00', '396293916'),
(2279, 'U', 'Nguyễn Duy Cương', 'ndcuongcncd2211036@student.ctuet.edu.vn', '$2y$10$LPIOgm.1bzoLDqHZedFMzeI18I1fbb1RXxrEM71Nt8N3b4W38e0fO', 'CNCD2211036', 'Cần Thơ', '0000-00-00', '367844971'),
(2280, 'U', 'Nguyễn Duy Linh', 'ndlinh2100117@student.ctuet.edu.vn', '$2y$10$0spgofl4aripi50I1UY1OO8fxwlniFsSPmWJWQKY.zWOl9xPhvRwm', '2100117', 'Cần Thơ', '0000-00-00', '855009256'),
(2281, 'U', 'Nguyễn Duy Nam', 'ndnam2000143@student.ctuet.edu.vn', '$2y$10$CHVbH1oVwIo4CKWjnkTVAe2li4DZityIK4pO09YcLJZ7EWxfZo64a', '2000143', 'Cần Thơ', '0000-00-00', '866450767'),
(2282, 'U', 'Nguyễn Hải Tường', 'nhtuong2100320@student.ctuet.edu.vn', '$2y$10$TC/Jj91Q6HrixgwrloLsZe6GfJ8QmCT198vcRAtQOjpCviKyIW1.q', '2100320', 'Cần Thơ', '0000-00-00', '766896979'),
(2283, 'U', 'Nguyễn Hạnh Quyên', 'titimom203@gmail.com', '$2y$10$RAq9j9bRlE7RkFW5ewxRXep2OaNr6W.PLS5gh/x9NFrR3VxJtYzeG', '2100132', 'Cần Thơ', '0000-00-00', '387018720'),
(2284, 'U', 'Nguyễn Hoà Hợp', 'nhhop2101343@student.ctuet.edu.vn', '$2y$10$QpTKIcvZfXcTw1VPR6CBHuywdby5jYq3lfGBt4FkXx8kIB3TG9/K6', '2101343', 'Cần Thơ', '0000-00-00', '334793743'),
(2285, 'U', 'Nguyễn Hoàng Anh', 'hoanganh27112002@gmail.com', '$2y$10$BpEBzPL72syf8EHm5sNDK.r1DojizBnBAb2tdKc/IQemyQ0pxu6DO', '2000022', 'Cần Thơ', '0000-00-00', '839758806'),
(2286, 'U', 'Nguyễn Hoàng Bảo Châu', 'chau49382@gmail.com', '$2y$10$6Uf.0Phnn31kU9yT7hYr3.9Z.5VWQkCfRk.T80PcZFNuZ5QQfv8Jy', 'CNHH2211032', 'Cần Thơ', '0000-00-00', '907287617'),
(2287, 'U', 'NGUYỄN HOÀNG PHÚC', 'nhphuc2101291@student.ctuet.edu.vn', '$2y$10$LmDIFi2sUdODkDqn2wedI.pC4Qgz2uqn4hGmD/HkH0UIJLSsT8C4i', '2101291', 'Cần Thơ', '0000-00-00', '327881804'),
(2288, 'U', 'Nguyễn Hoàng Thủy Tiên', 'nhttien2100023@student.ctuet.edu.vn', '$2y$10$LjWvVt5apFU9DiwwZQ.R0O6F95IQ8.Kg1eBNtiBw3FRK0fzCDG2VC', '2100023', 'Cần Thơ', '0000-00-00', '927196016'),
(2289, 'U', 'Nguyễn Huỳnh Ngọc Hân', 'nhnhan2100578@student.ctuet.edu.vn', '$2y$10$rWq8Ya5KF1PVeRxpuBsxU.HLWDjPCZGM1dOTliwRskImpRceESQn2', '2100578', 'Cần Thơ', '0000-00-00', '706070465'),
(2290, 'U', 'Nguyễn Hữu Tài', 'Nhtai2000154@ctuet.edu.vn', '$2y$10$RK92xhK6Muws8tOAUsixI.cxAjhVfM7Qf3xy9Atg9IZH1C6CtT6Ri', '2000154', 'Cần Thơ', '0000-00-00', '394663396'),
(2291, 'U', 'Nguyễn Kim Phụng', 'kimphungg0106@gmail.com', '$2y$10$ck9ItH2OC5LQkxDFt973x.JDo7DQX9c.JpspmFFAR3LnjJwjwOjJu', 'CNTT2211048', 'Cần Thơ', '0000-00-00', '364269800'),
(2292, 'U', 'Nguyễn Khả Ái', 'nguyenkhaai20062003@gmail.com', '$2y$10$EioY/AO3LYGlM6Z6Z0/m7Ox/aMDL3XvCtPouVowwzy8hK4cCO8hmK', '2100870', 'Cần Thơ', '0000-00-00', '987945913'),
(2293, 'U', 'Nguyễn khánh duy', 'nguyenkhanhduycm2020@gmail.com', '$2y$10$lCcGlup6R8Qtd8nWNpKkWe1kuxFYDN7Ut/bom3.fF33TyiHtf3Piu', 'CNCD2211039', 'Cần Thơ', '0000-00-00', '949277725'),
(2294, 'U', 'Nguyễn Lê Nhã Anh', 'nlnanh123456@gmail.com', '$2y$10$y4l9XgwYYn3Vspln7im/f.tUKcpr7mhY4sikLvXBx/hdIGss5C5/6', 'KTPM2211001', 'Cần Thơ', '0000-00-00', '767973555'),
(2295, 'U', 'Nguyễn Lê Xuân Trang', 'xuantrang.nguyenle1234@gmail.com', '$2y$10$d6VY4R3Sfj.HEAoy3OVunuUsl5wmb0yPxfWz02dI6ocnQS2M5mPha', '2100482', 'Cần Thơ', '0000-00-00', '343007372'),
(2296, 'U', 'Nguyễn Mai Thu Hương', 'nmthuong2100099@student.ctuet.edu.vn', '$2y$10$RIK2BuJUBUsvzuM3nuV.Zu0EzuLT6psDsUlBFf69TmwV3YRA4zjmi', '2100099', 'Cần Thơ', '0000-00-00', '978728845'),
(2297, 'U', 'NGUYỄN MINH KHANG', 'nmkhangcntp2211010@student.ctuet.edu.vn', '$2y$10$Q0zanJMUNaG5v.fx8fQP3uKAXpfdSx5ZvCdbMGrdeW2q8na57Ms1S', 'CNTP2211010', 'Cần Thơ', '0000-00-00', '376797405'),
(2298, 'U', 'Nguyễn Minh khoa', 'khoathosan123@gmail.com', '$2y$10$sF4oSYijIiR837M6n3kRkuWxmk8FIJS7umcVrSEVDTPoegzdG0PHq', 'CNCD2211035', 'Cần Thơ', '0000-00-00', '365626694'),
(2299, 'U', 'Nguyễn Minh Nghề', 'nmnghe2100170@student.ctuet.edu.vn', '$2y$10$GCYy785x6laXD8XNysFPj.lGCM0bqX/08MohIuxP5AwaIOh12nSzK', '2100170', 'Cần Thơ', '0000-00-00', '345524560'),
(2300, 'U', 'Nguyễn Minh Thông', 'nnthong8921@gmail.com', '$2y$10$4oDna.XToLO2mJKUfTmO1Om3A0f6wDGskR3s/yLaxEEkKfVzrXt36', '2100201', 'Cần Thơ', '0000-00-00', '836604015'),
(2301, 'U', 'Nguyễn Minh Thuận', 'nmthuan2001152@student.ctuet.edu.vn', '$2y$10$T1aQk72X.nHAjUqbXL6D3uiNo5SvkkoX8xgmG8Zb94sZpDJY.eS5C', '2001152', 'Cần Thơ', '0000-00-00', '924823147'),
(2302, 'U', 'Nguyễn Minh Thư', 'thumih111@gmail.com', '$2y$10$oPQ8yekzup.2/13O9EmU..0josO.ux1T/SzRm/CyOmBDUdRfxFhVC', 'KTHC2211032', 'Cần Thơ', '0000-00-00', '706740710'),
(2303, 'U', 'Nguyễn Minh Trí', 'minjii13104@gmail.com', '$2y$10$zpnG5Kpin67KE61bMK.WP.oaIjtylx1K/kmAWNSOELsx/A4esHFAC', 'LUAT2211056', 'Cần Thơ', '0000-00-00', '774939182'),
(2304, 'U', 'Nguyễn Ngân Quỳnh', 'nganquynh151004@gmail.com', '$2y$10$8GEVFT3MlVR7XsrHNuMHFebWRFMhoCFdXUBnTpdMgA99N6fFz1hq2', 'TCNH2211004', 'Cần Thơ', '0000-00-00', '947420321'),
(2305, 'U', 'Nguyễn Ngọc Ánh Nhi', 'nnahi2101208@student.ctuet.edu.vn', '$2y$10$n11O4yT7lMYxlR5m3jpsOu.bXNpkaS0GhiMf..no.osyxaV3aIpWm', '2101208', 'Cần Thơ', '0000-00-00', '912169353'),
(2306, 'U', 'Nguyễn Ngọc Duy', 'dy16012004@gmail.com', '$2y$10$ijDBzuJIBBhierfnsv4d/.iWdZnsM06sl1ZAlZh.EjE/t99IUhweK', 'CNCD2211016', 'Cần Thơ', '0000-00-00', '389290049'),
(2307, 'U', 'Nguyễn Ngọc Huỳnh Như', 'nhu86859@gmail.com', '$2y$10$eVuOhOy70nCyis8fnlWnA.oR5fQhhAshfLCX2ucdHJnbA/p5ZhSLS', 'QLCN2211013', 'Cần Thơ', '0000-00-00', '907043653'),
(2308, 'U', 'Nguyễn Ngọc Khiêm', 'nnkhiemcncd2211023@student.ctuet.edu.vn', '$2y$10$HJT0ygr/X57oC8W1W/p4fuhmuHEh1oCk9p7Upf7YquRfsNmX9mVvO', 'CNCD221023', 'Cần Thơ', '0000-00-00', '794243542'),
(2309, 'U', 'Nguyễn Ngọc Linh Thu', 'nnlthu2100954@student.edu.vn', '$2y$10$d7ewxPaoZKe3Rtx/Gek6Xu..7wWu8q624NsRsq4opny7ZZ6RHbYCq', '2100954', 'Cần Thơ', '0000-00-00', '764804635'),
(2310, 'U', 'Nguyễn Ngọc Trinh', 'nntrinhlqcc2211154@student.ctuet.edu.vn', '$2y$10$kugDhDW.jPy3ox8qiYHAgublACimww2nTk77ADQec.wc.AFcWWq0W', 'LQCC2211006', 'Cần Thơ', '0000-00-00', '838890415'),
(2311, 'U', 'Nguyễn Ngô Khả Thi', 'nguyenngokhathi.lop12a7@gmail.com', '$2y$10$MxcaIBRCWb0BK5FxHccow.DVoZORoqCyP48DfViNaVPmdzLuVnS2m', 'LQCC2211051', 'Cần Thơ', '0000-00-00', '776544255'),
(2312, 'U', 'Nguyễn Như Ý', 'nnycntp2211001@student.ctuet.edu.vn', '$2y$10$y/tkr4.7FAxNTOiKkO9qkuWNvmL71KA/r6tATHXafxu7lZ.fMY.lW', 'CNTP2211001', 'Cần Thơ', '0000-00-00', '869931153'),
(2313, 'U', 'Nguyễn Phạm Hồng Đoan', 'doannguyen07032003@gmail.com', '$2y$10$4SegHi8swrSnMu2J9oLLeeVYOyAiMavAhJLfJXBgokoKAb8TQrB7C', '2101464', 'Cần Thơ', '0000-00-00', '374522692'),
(2314, 'U', 'Nguyễn Phượng Nhi', 'nhinguyenk82@gmail.com', '$2y$10$7ia88.t/bVC8h83fcYwEd.HvU7heKXpp8h9cqkmzVVyheVzyPfFqa', 'NGNA2211021', 'Cần Thơ', '0000-00-00', '907609210'),
(2315, 'U', 'Nguyễn Phương Thùy', 'nguyenphuongthuy.a5@gmail.com', '$2y$10$CR2P.pHZHtaHKA9F0C/Gx.6dOJNR3XCgs5zS9bzyDj8MbpYnSBmxm', 'LQCC2211009', 'Cần Thơ', '0000-00-00', '782862174'),
(2316, 'U', 'Nguyễn Quốc Anh', 'nqanh2000024@student.ctuet.edu.vn', '$2y$10$1S1bAetcuc17earr7E7uleVR4aurQ13D4OmIen7.a/2EIV9wwdlnK', '2000024', 'Cần Thơ', '0000-00-00', '386035561'),
(2317, 'U', 'Nguyễn Quốc Bảo', 'baon70722@gmail.com', '$2y$10$BGnpUeHJJhQOWbG0jGR7I.36sEWpN59cC5Tol7BHuIvLOu.OjI85a', 'KTPM2211047', 'Cần Thơ', '0000-00-00', '911509712'),
(2318, 'U', 'Nguyễn Quốc Cường', 'cuong0898224665@gmail.com', '$2y$10$DQT61E.qH6P3aDmOb0pfzebm25tSUUjbMFEmXkbZWfTwffaFT/iou', '2101242', 'Cần Thơ', '0000-00-00', '898224665'),
(2319, 'U', 'Nguyễn Quốc Thịnh', 'thinhpekka319@gmail.com', '$2y$10$GTb92efnQBfi/zJUnJr5hekTM5IndjxqLob7FfQCp1yETlGLmvpPK', 'TCNH2211040', 'Cần Thơ', '0000-00-00', '336965319'),
(2320, 'U', 'Nguyễn Quỳnh Như', 'nguyenquynhnhu270303@gmail.com', '$2y$10$DIgRp22rt1FNCXDzvws90e2zfbI4Kz94WfC4sTUisQJYo9an9XWcW', 'KTPM2211060', 'Cần Thơ', '0000-00-00', '787965125'),
(2321, 'U', 'Nguyễn Tạ Khánh Hân', 'ntkhan2100241@student.ctuet.edu.vn', '$2y$10$7yDF2bExbNJQXQjhR63LEu5XQYQSG5kM.jVDlqhabWMaVdQReMQEC', '2100241', 'Cần Thơ', '0000-00-00', '913110469'),
(2322, 'U', 'NGUYỄN TUẤN CƯỜNG', 'ntcuongqlcn2211043@student.ctuet.edu.vn', '$2y$10$ysfQ6R..jJtUFpiodr5TgODjB8yuc6c6PoO.kZnZYFkr8d0.r5jju', 'QLCN2211043', 'Cần Thơ', '0000-00-00', '946349849'),
(2323, 'U', 'Nguyễn Thị Anh Thư', 'anhthu161718@gmail.com', '$2y$10$XALsLY.rtyx5akwFWjKquuypVrhXa13zC7HTBJuRNbT/OJMyhJoV.', 'KTHC2211052', 'Cần Thơ', '0000-00-00', '702873507'),
(2324, 'U', 'Nguyễn Thị Bích Ngọc', 'ntbngoc2100999@student.ctuet.edu.vn', '$2y$10$cMMHdwNavgazu7WxcaWLtOCj76jDjRFhOYsqGV2fDF5sWnevgIDp.', '2100999', 'Cần Thơ', '0000-00-00', '397372717'),
(2325, 'U', 'Nguyễn Thị Bích Như', 'nguyenbichnhu24088@gmail.com', '$2y$10$lyB8l5ollzlu5wejyA.kf.h4yx1qXLdTv.ZJcqqdA9lA1UuxVi8zq', '2100161', 'Cần Thơ', '0000-00-00', '918005790'),
(2326, 'U', 'Nguyễn Thị Bích Phượng', 'ntbphuong2100127@student.ctuet.edu.vn', '$2y$10$hPNG7YHCNbesKRNdEWfS8Oaw.8CYlO1qc.4yBrZ6mwBhpZ/Zz9tA2', '2100127', 'Cần Thơ', '0000-00-00', '777610790'),
(2327, 'U', 'Nguyễn Thị Bích Trâm', 'trambich918@gmail.com', '$2y$10$/6gk6xxhKEM1Mo/g0r./x.4QT1AS0qNvaVi1QToL4qCKmJs/PZkkG', 'QLCN2211009', 'Cần Thơ', '0000-00-00', '986537316'),
(2328, 'U', 'Nguyễn Thị Bích Trân', 'Ntbtran2000766@student.ctuet.edu.vn', '$2y$10$oTvbspFGi0r/VkskKuYpGeN0Zr3roiX.jFRSCKeoy9FBgvIRG20Qy', '2000766', 'Cần Thơ', '0000-00-00', '795410210'),
(2329, 'U', 'Nguyễn Thị Cát Tường', 'tuongcat080304@gmail.com', '$2y$10$yhw/nbQzJC41kNPTSE6B0uN41qXeypDLgfI1B6VKawqaHxRj03.im', 'KTPM2211030', 'Cần Thơ', '0000-00-00', '962270083'),
(2330, 'U', 'Nguyễn Thị Cẩm Vân', 'vannguyen7943@gmail.com', '$2y$10$14Y7MJq65RqeizQLs8NEFevnxzWPGFgCzx8Dp8ER0Ae955oPKotAq', 'LQCC2211047', 'Cần Thơ', '0000-00-00', '379717943'),
(2331, 'U', 'Nguyễn Thị Hằng Ni', 'Nthni2000335@student.ctuet.edu.vn', '$2y$10$Dv1K3mz7VBDBcJTGX75RSeodsj4oVVQ1/oJ8bGwUicgE5INZglT7C', '2000335', 'Cần Thơ', '0000-00-00', '939260321'),
(2332, 'U', 'Nguyễn Thị Hoàng Oanh', 'nguyenthihoangoanh872003@gmail.com', '$2y$10$VpRZyF.VXLFbdNDUK6fsIeJsLyjk9FVjEU1U8DkayxXOBQg3f0PsK', '2101190', 'Cần Thơ', '0000-00-00', '357263029'),
(2333, 'U', 'Nguyễn Thị Hồng Gấm', 'nthgam2101549@student.ctuet.edu.vn', '$2y$10$Hji0QXMFD6iuGLWymvggtuqhicwZ2/qzd0YK3NcgDd.wEkRIvU/2m', '2101549', 'Cần Thơ', '0000-00-00', '936195134'),
(2334, 'U', 'Nguyễn Thị Hồng Quyên', 'nguyenthquyen1@gmail.com', '$2y$10$CfshGYX2ed/VlrCXFLF8dej85H/XPTIp0ZtSQ5YkHqm20UBwgxcKq', 'QTKD2211032', 'Cần Thơ', '0000-00-00', '987279631'),
(2335, 'U', 'Nguyễn Thị Hồng Tươi', 'nthtuoi2101395@student.ctuet.edu.vn', '$2y$10$Pj363e3XnuSEz6twFttUHeAz3ov9F5DO8PNqV6PWi/q60/hLD77di', '2101395', 'Cần Thơ', '0000-00-00', '765663903'),
(2336, 'U', 'Nguyễn Thị Hồng Thắm', 'nthongtham300703@gmail.com', '$2y$10$CJea.KRdgtFf4GJqdCglBuHEDt6tVTJS.ceEMcQWQ6x7vL5Lwh7oq', 'KETO2211018', 'Cần Thơ', '0000-00-00', '386577548'),
(2337, 'U', 'Nguyễn Thị Huệ Nhung', 'Huenhung0106@gmail.com', '$2y$10$0a6ZVbPLXz6LDbOvLl0F2unqTyH3BkMQUmvC6oEwSUxOorgtjx3yq', 'QLCN2211042', 'Cần Thơ', '0000-00-00', '346869525'),
(2338, 'U', 'Nguyễn Thị Huỳnh Như', 'huynhnhunguyen02022002@gmail.com', '$2y$10$MnQbgPFCAZpL6s1ggb3vUuXRtaq7yH5JGZ5O1WyQdfPbSaRbuuJSK', '2001028', 'Cần Thơ', '0000-00-00', '886207427'),
(2339, 'U', 'NGUYỄN THỊ KIỀU CHI', 'ntkchi2100235@student.ctuet.edu.vn', '$2y$10$5dkIQRfXfpsFPTG8udjBc.MjOG8BVgCU748C/Sm5SBH3D9y9ESN6e', '2100235', 'Cần Thơ', '0000-00-00', '961551448'),
(2340, 'U', 'Nguyễn Thị Kim Chi', 'chi681093@gmail.com', '$2y$10$udWFx8CEnr2uJ.88tYTTrOetg.itp4GgYFHwLVZWXnyeVTBQ9vY42', 'CNHH2211001', 'Cần Thơ', '0000-00-00', '365570244'),
(2341, 'U', 'Nguyễn Thị Kim Hoa', 'kimhoa13102004@gmail.com', '$2y$10$XYMR98GWv/O7ivC53I8.1udtlMmFdfl1dev2AyVMXDLTQSVFXQCuS', 'QTKD2211015', 'Cần Thơ', '0000-00-00', '898759436'),
(2342, 'U', 'Nguyễn Thị Linh Huệ', 'nguyenthilinhhue6503@gmail.com', '$2y$10$oJGNWedhuTLb2sm/Chq.KurkkiEFtFZp72iOJpTfokP/QCrMMf5e2', 'QLCN2211015', 'Cần Thơ', '0000-00-00', '934206503'),
(2343, 'U', 'Nguyễn Thị Mộng Nghi', 'nguyennghii2603@gmail', '$2y$10$zb3ykO0X2P/DXL9mhH3y7OtabxMK9nym3NTMo6/50xPFIWhBUISDW', 'QLCN2211016', 'Cần Thơ', '0000-00-00', '904547248'),
(2344, 'U', 'Nguyễn Thị Mộng Nhi', 'mongnhi8900@gmail.com', '$2y$10$0kw3ZsewmIBfSmHcURGtuOjcc9SgRX0jPaHFyMMufdi3CH64WwkBK', '2101542', 'Cần Thơ', '0000-00-00', '845119052'),
(2345, 'U', 'Nguyễn Thị Mỹ Dung', 'dn5584475@gmail.com', '$2y$10$yUc1NMxS9LNIMHPJt7xSteoUuMXYutDKVSYnJqDlZdSmAJZceEv.y', '2101438', 'Cần Thơ', '0000-00-00', '926234907'),
(2346, 'U', 'Nguyễn Thị Mỹ Hằng', 'nguyenthimyhang20004@gmail.com', '$2y$10$yozIbHmOOJpBu4FUaOo2nuF0W/t0ueYQ1dHynOHN49jMf4IBIX8mG', 'KTPM2211036', 'Cần Thơ', '0000-00-00', '397388613'),
(2347, 'U', 'Nguyễn Thị Mỹ Quyền', 'ntmquyen2101276@student.ctuet.edu..vn', '$2y$10$ClOezLZkH.bv.1hKTLPeOO3WippklQ0yUHTaJO3UvdR.GhxuDOUHW', '2101276', 'Cần Thơ', '0000-00-00', '915746601'),
(2348, 'U', 'Nguyễn Thị Mỹ Thanh', 'ntmthanh2101332@student.ctuet.edu.vn', '$2y$10$18Nyg4.rxAZtajP7ntka6e8kAGVFKminis1lyx2cdZh4IRFQwYV0S', '2101332', 'Cần Thơ', '0000-00-00', '703063249'),
(2349, 'U', 'Nguyễn Thị Mỹ Thanh', 'ntmvankthc2211033@student.ctuet.edu.vn', '$2y$10$5dwYEWW5U7zG.qmSyf/s9eGMGPc6klHkOIpAuPes9TRwAi/jar/PK', 'KTHC2211033', 'Cần Thơ', '0000-00-00', '768098158'),
(2350, 'U', 'Nguyễn Thị Ngọc', 'ntngoc2100875@student.ctuet.edu.vn', '$2y$10$WYi3FxuCzSpwXyvgoxpnm.12TrOnHcJ9sWQZLuBs9qd3edDPe0xBy', '2100875', 'Cần Thơ', '0000-00-00', '353789503'),
(2351, 'U', 'Nguyễn Thị Ngọc Anh', 'nguyenvanbi.st0101@gmail.com', '$2y$10$gMzwI.6GBk.rg9.BDq9GKu5y7ZJLAxOltlNESv1xUmZxzlhMoq1FC', 'QLCN2211041', 'Cần Thơ', '0000-00-00', '916850920'),
(2352, 'U', 'Nguyễn Thị Ngọc Điền', 'ntndien2101107@student.ctuet.edu.vn', '$2y$10$tb01gzEb0PosZN8I8ae9Ce6JBKGOVitNNRe0tg6sceia9DxjvPvNG', '2101107', 'Cần Thơ', '0000-00-00', '369894920'),
(2353, 'U', 'Nguyễn Thị Ngọc Lượng', 'nguyenthingocluong04@gmail.com', '$2y$10$A8029XNpmLcvNsW0pdP9jutACHHki2/zBCMUv00zTbDoeIyMJM8yy', 'CNTP2211069', 'Cần Thơ', '0000-00-00', '354433245'),
(2354, 'U', 'Nguyễn Thị Ngọc Trâm', 'Nguyenthingoctram.803@gmail.com', '$2y$10$5OHj8ciDIk29.gI/JDVKluPiCFXWsneo/FfQiQdy5kM0Fr959ltvm', '2100898', 'Cần Thơ', '0000-00-00', '398385499'),
(2355, 'U', 'NGUYỄN THỊ NGỌC Ý', 'ngocy99999@gmail.com', '$2y$10$0jh/rRgSe2OoEhL0Pl6X0.ZI82OkdwKvm6oyYAewoMmNHAsvPOImW', '2101425', 'Cần Thơ', '0000-00-00', '913517046'),
(2356, 'U', 'Nguyễn Thị Như Ý', 'han362018@gmail.com', '$2y$10$Oy3dhi04W.3WKQo9fw5lSuMQs.Xv.snWfrIwcVxs1ToOwr6vb52TG', '2101271', 'Cần Thơ', '0000-00-00', '702940953'),
(2357, 'U', 'Nguyễn Thị Phước Mỹ', 'ntpmy2100924@student.ctuet.edu.vn', '$2y$10$Bjy7RJlzUYEwcb2sH5Ss0.SfGP4XIBEIOoosW2D7Sxni.1kFwUx7W', '2100924', 'Cần Thơ', '0000-00-00', '789515656'),
(2358, 'U', 'Nguyễn Thị Quế Anh', 'queanhtbvl@gmail.com', '$2y$10$SdIEFFmS0w/ySITB84PWkOhUCjx4/JKtF.KBmUaU/XImyEFhJRpR.', '2100445', 'Cần Thơ', '0000-00-00', '342130559'),
(2359, 'U', 'Nguyễn Thị Quế Trân', 'quetran21012003@gmail.com', '$2y$10$fKV8qUNi4Vxd0FGLkkH4YuUc2mqYa9h3gSPm1AIwHgeIkKNlcqJz.', '2100972', 'Cần Thơ', '0000-00-00', '706552570'),
(2360, 'U', 'Nguyễn Thị Quỳnh Như', 'nguyenthihai5388@gmail.com', '$2y$10$hHwWZ5mIVoRpqbUaGQbGKerRz3gyrOzR.NYvFGhl.X051Z/R5tmWC', 'QTKD2211001', 'Cần Thơ', '0000-00-00', '379027791'),
(2361, 'U', 'Nguyễn Thị Quỳnh Như', 'ntqnhu2000317@student.ctuet.edu.vn', '$2y$10$xz17Awdi/04EJCnfpkBe3eRhzvHzvfwmox/aiVlpVdRviaJIqdSVm', '2000317', 'Cần Thơ', '0000-00-00', '782826623'),
(2362, 'U', 'Nguyễn Thị Tiểu Du', 'nguyentieudu@gmail.com', '$2y$10$nxuHYLbNLB0wkTk7IXZH..56f34Us.uLMvybRIEGmScLt42Fn/KZ2', 'TCNH2211026', 'Cần Thơ', '0000-00-00', '788765074'),
(2363, 'U', 'Nguyễn Thị Thiên Nhi', 'nguyenthithiennhi2004mt@gmail.com', '$2y$10$dfT/o5BXcKFGFTwOBerih.OqY8rZUwNBeVzm2dfgq5tJS4j9N877W', 'LQCC2211019', 'Cần Thơ', '0000-00-00', '706892609'),
(2364, 'U', 'Nguyễn Thị Thúy An', 'nttan182@gmail.com', '$2y$10$Oelmg2o7J3hbyG/ihpR51.LcbavmA1yAzRsdmuZio6DKWB9VX.yGC', '2100973', 'Cần Thơ', '0000-00-00', '372724340'),
(2365, 'U', 'NGUYỄN THỊ THUÝ OANH', 'nttoanhketo2211007@student.ctuet.edu.vn', '$2y$10$nOoA5bQ8tIhlxN6Sm65ZZ.hNKM1agzof1na7.N26HxYm6YMFEWLNK', 'KETO2211007', 'Cần Thơ', '0000-00-00', '815530307'),
(2366, 'U', 'Nguyễn Thị Thư', 'nguyenthu.hnvta@gmail.com', '$2y$10$vC2O9EJ1wcNXRd5hk9wQx.gz52U2NCIJv7PsK05rgB8afdKxJvjdO', '2101222', 'Cần Thơ', '0000-00-00', '347755343'),
(2367, 'U', 'NGUYỄN THỊ TRÚC', 'nttruc2100295@student.ctuet.edu.vn', '$2y$10$d8Y6ixCeX5kzIVjJNEOcuuA8kEZkALgQ.Qt4olNFarlGarBGDc7Sm', '2100295', 'Cần Thơ', '0000-00-00', '392633534'),
(2368, 'U', 'Nguyễn Thị Trúc Ly', 'lyo24236@gmail.com', '$2y$10$8yVZKCOseSQO/Uf0Z.YKBe0h33pvZn.xeEvR1xHLo0qNeNPGU2MTO', 'NGNA2211038', 'Cần Thơ', '0000-00-00', '915113260'),
(2369, 'U', 'NGUYỄN THIÊN ÁNH NGỌC', 'ntangoc2101405@student.ctuet.edu.vn', '$2y$10$96EZTbZi8btPR/coU5SDDeG0T/P.iCMhchYLRdHkCsjvrFkeTZkVC', '2101405', 'Cần Thơ', '0000-00-00', '907183433'),
(2370, 'U', 'Nguyễn Thiên Trang', 'nttrang2100256@student.ctuet.edu.vn', '$2y$10$B9c9USsyLtSeA6YlQXpK/OfF8Pen4rpOB68koQYRvu1rJnze54dwS', '2100256', 'Cần Thơ', '0000-00-00', '949024665'),
(2371, 'U', 'NGUYỄN THÚY HUỲNH', 'Nguyenhuynh5526@gmail.com', '$2y$10$Jfq8Hy6WRZI28ON3w0MvkOFSo.8hPEIX8752JfLeLciyHK5WJmpAm', 'NGNA2211013', 'Cần Thơ', '0000-00-00', '706411526'),
(2372, 'U', 'Nguyễn Trung Tín', 'trungtin456vhhn@gmail.com', '$2y$10$bm9anC0zx3Gog1r0OdDuiu4RnDwQKVyd5IW/ZlZ5RUXle0nsnK4J6', 'KTPM2211017', 'Cần Thơ', '0000-00-00', '852924499'),
(2373, 'U', 'Nguyễn Văn Hoài Thương', 'nvhthuong2101243@student.ctuet.edu.vn', '$2y$10$EjZQ5lHnHTYkxQJiORQF4uff.65A1Wev1YGKXv7oRxPjougx1t4Ny', '2101243', 'Cần Thơ', '0000-00-00', '308219444'),
(2374, 'U', 'Nguyễn Văn Phát', 'nguyenphatssj0612@gmail.com', '$2y$10$8LGC.7GdOfSqJ8ZF3huYfeKVzIk4VNh8jnbW38kSWYpaoKpPtB2ti', '2101281', 'Cần Thơ', '0000-00-00', '382909902'),
(2375, 'U', 'Nguyễn Văn Sự', 'nguyenvansu2004@gmail.com', '$2y$10$w7.8nKzxNYJMmiynnG4dIuBQ5hHEaQXLnOcQsu2OqHldzSWg3KSjG', 'CNCD2211053', 'Cần Thơ', '0000-00-00', '772171882'),
(2376, 'U', 'Nguyễn Văn Ý', 'nvy2101226@student.ctuet.edu.vn', '$2y$10$Ucyh.49Z/XDmZ9IKyHMX/.1XX.W1mO7IHOenih74mpVBb.z0poQ7e', '2101226', 'Cần Thơ', '0000-00-00', '584211349'),
(2377, 'U', 'NGUYỄN VIỆT KHƯƠNG', 'biiquy9999@gmail.com', '$2y$10$yY2vwMO1cwCD3OUwsp2yf.wexeM96Kp3fvV4KapY6XzFlZWw8iZoS', '2100552', 'Cần Thơ', '0000-00-00', '786921831'),
(2378, 'U', 'Nguyễn Võ Minh Anh', 'nguyenanh09072003@gmail.com', '$2y$10$nGaP8s8amiEFjmo975Hp1.TkiFk9scyg0RZAmTxw8cXc8M5Qe6qwq', '2101361', 'Cần Thơ', '0000-00-00', '969434544'),
(2379, 'U', 'Nguyễn Xuân Thanh Phong', 'thanhphongtaetae3012@gmail.com', '$2y$10$u2CEVdZ5M92A20a9AvRnmOi/WABimv2XZZz2iHL393NzgeBRL1cYG', 'KTPM2211038', 'Cần Thơ', '0000-00-00', '977259072'),
(2380, 'U', 'Nguyễn Yến Vy', 'vy483035@gmail.com', '$2y$10$eQXX2VnfCbY86AAxxpnaUuD18AhJ9iawIf2b51OW556sv59/W/u1q', 'NGNA2211031', 'Cần Thơ', '0000-00-00', '939177948'),
(2381, 'U', 'Ong Thị Mỹ Phướng', 'my786219@gmail.com', '$2y$10$8ZI5vQ3O2Xd0q1HIsLkFWenw/mYZ/5tO9mvhCY.QDcfzaKHg.ixwS', '2101507', 'Cần Thơ', '0000-00-00', '966146642'),
(2382, 'U', 'Ông thành', 'dathungdu007@gmail.com', '$2y$10$PUIvPQtOen07exLwRfuF2ec5uHqMsIFZJo3e.pFsE4.rQ46HDZIIm', '2000728', 'Cần Thơ', '0000-00-00', '868073390'),
(2383, 'U', 'Phạm Anh Thư', 'anhthupham291@gmail.com', '$2y$10$C9aedHWNSTFyNM3QD7DqvuqEJlkIMNX3SBkUAdllvgP8YMVo/E7BK', '2100380', 'Cần Thơ', '0000-00-00', '706376807'),
(2384, 'U', 'Phạm Gia Mỹ', 'pgmy2101526@student.ctuet.edu.vn', '$2y$10$eL5LwuiXDOkw3BNAPsmS5.xsLRVyGbpcQAMwEB.eGyeBcoqEmvfFy', '2101526', 'Cần Thơ', '0000-00-00', '899467122'),
(2385, 'U', 'Phạm Huỳnh Như', 'phnhu2101262@student.ctuet.edu.vn', '$2y$10$9RSWIUHMMK3y7g1DeIx4Auug714UqKQqAazUJx559VJggSofAdKjm', '2101262', 'Cần Thơ', '0000-00-00', '365452554'),
(2386, 'U', 'Phạm Hữu Luân', 'phamhuuluanth18072003@gmai.con', '$2y$10$X9BY6wnbo38wh9iuLHT1nOJFKphDN8oteFfds8nw4IpuukmccGdgS', '2100923', 'Cần Thơ', '0000-00-00', '796956248'),
(2387, 'U', 'Phạm Hữu Nghĩa', 'kg2020.phamnghia@gmail.com', '$2y$10$hmLYqGxcbc1rnxdFi1K/2eKLXYYiUyNXzVDIlwIPvLeRXfvpOGh3a', 'NGNA2211067', 'Cần Thơ', '0000-00-00', '369056974'),
(2388, 'U', 'Phạm Hữu Thái', 'phthaicntt2211035@student.ctuet.edu.vn', '$2y$10$69hSBD75ERyykbAfPbK2ruieMJCMMRKzhQE.xHAlVVI17giI5qzIy', 'CNTT2211035', 'Cần Thơ', '0000-00-00', '359846960'),
(2389, 'U', 'Phạm Khánh Ngọc', 'ngockp900@gmail.com', '$2y$10$sg6MYjZBra0/LwCbE2C4hOAS0YtpJEM6cKoDdP2gUGORfQS.Fgr9q', 'CNTT2211025', 'Cần Thơ', '0000-00-00', '766525900'),
(2390, 'U', 'Phạm Lê Nguyên', 'Phamlenguyen2004@gmail.com', '$2y$10$Yeq4mDhk75aMDkOXhrqquOkjFn575p.PAGXqTdZ6meLncTsTp4hJK', 'TCNH2211009', 'Cần Thơ', '0000-00-00', '949426995'),
(2391, 'U', 'Phạm Ngọc Liên', 'pnlien2100939@gmail.com', '$2y$10$6SVBvHSgk4eJ5VPmN6GcReLW7xDr6lZneFEZdPpRv4yL9wcdK4aBa', '2100939', 'Cần Thơ', '0000-00-00', '978169459'),
(2392, 'U', 'Phạm Nguyễn Bá Nghiệp', 'Banghiep2003@gmail.com', '$2y$10$BmSm.qIa73.qta.LIyxBYet/LksURI9eYGq7t3m2elH7.WVzjhqjG', '2100501', 'Cần Thơ', '0000-00-00', '327336619'),
(2393, 'U', 'Phạm Nguyễn Phúc Lộc', 'phamnguyenphucloc2004@gmail.com', '$2y$10$Mc55nea.9usN/B3G1S3/muIVjxeR5n2B.DdFoHt0LYP0H8kO0WyD2', 'CNCD2211008', 'Cần Thơ', '0000-00-00', '383280792'),
(2394, 'U', 'Phạm Nguyễn Yến Nhi', 'yennhi407505@gmail.com', '$2y$10$Thn3h4RvWfLgsFKQjtUmpO4ZlP4EuaBeyZz6Hgt7YtBpYeQJl6Jma', 'KHDL2211030', 'Cần Thơ', '0000-00-00', '334407305'),
(2395, 'U', 'Phạm Như Ý', 'phamy240901@gmail.com', '$2y$10$2ekk5KZQrT6tN2KvJ2S6aepvHTx5YdYUtu7ooWQVIvshLZbsZdfRO', '2100810', 'Cần Thơ', '0000-00-00', '835222309'),
(2396, 'U', 'Phạm Phúc Đạt', 'phamphucdattp@gmail.com', '$2y$10$3vqoNiNb1lR477OwHsR...P4Sir4Y1./yFoSZDXqSzJ3yCaiAeQmS', '2101399', 'Cần Thơ', '0000-00-00', '868660545'),
(2397, 'U', 'Phạm Thị Hồng Ngân', 'hongngan0002003@gmail.com', '$2y$10$z/F5Z.vR/9K2gPf61L1uzeoeZ4m5vt1obNRFMfOk6GOKCF86T/EFO', '2101554', 'Cần Thơ', '0000-00-00', '857041409'),
(2398, 'U', 'Phạm Thị Hồng Nhung', 'hongnhungpham1901@gmail.com', '$2y$10$NnVTbVrFDlPo/2A/b3XmI.XSWu6U.YxdysCQZouR.rFKANILEIaA2', 'LQCC2211030', 'Cần Thơ', '0000-00-00', '911310215'),
(2399, 'U', 'PHẠM THỊ MỸ NGÂN', 'ptmngan2101413@student.ctuet.edu.vn', '$2y$10$PMrMsPlXlNU.TJ/NULLosubtf4q7vnLiEz82Dax.3.tAsAsxXm6aG', '2101413', 'Cần Thơ', '0000-00-00', '388263647'),
(2400, 'U', 'Phạm Thị Ngọc Trúc', 'phamtruc02072019@gmail.com', '$2y$10$9V9bZdEWhzQ7yl.RVeg6NeW7VJrvjai3uRY8Kc9tfGeKXrUtAH7wq', 'LUAT2211018', 'Cần Thơ', '0000-00-00', '945598230'),
(2401, 'U', 'Phạm Thị Quỳnh Như', 'quynhnhupham214@gmail.com', '$2y$10$buI.O3hs8rf4DTPD.er.DeaThIojtjF.vi6xel3pSWJUmUEtLllCi', '2101214', 'Cần Thơ', '0000-00-00', '394487127'),
(2402, 'U', 'Phạm Trần Thuý Ngân', 'phamtranthuyngan311@gmail.com', '$2y$10$DRmO625saO7T3Rg8pcdJLeppZvRjvlV4sjBma7AU2nWzQsdE0JCRO', '2101545', 'Cần Thơ', '0000-00-00', '779804539'),
(2403, 'U', 'Phạm Văn Hiếu', 'hieu02617@gmail.com', '$2y$10$6at6H1Aa64w4lKk553vkl.FWclfIHiuYA5jNWbgH1i/VdM32RtaM6', 'CNTT2211018', 'Cần Thơ', '0000-00-00', '783847637'),
(2404, 'U', 'Phan Dỉ Khang', 'phandykhnghg@gmail.com', '$2y$10$CxSVi591aVYFMECJ8yM67ug7xP1sYCemu71XmQEwXM8Qr3/pL5e7q', 'CNCD2211028', 'Cần Thơ', '0000-00-00', '782877601'),
(2405, 'U', 'Phan Kim Nguyên', 'phankimnguyen280@gmail.con', '$2y$10$bot2WUUdFBjHYN5igmUhju.6TRqCyEzE1r2zVxOGjpigjHEqmyTi.', '2101083', 'Cần Thơ', '0000-00-00', '328709968'),
(2406, 'U', 'Phan Liên Hữu Tình', 'Phanlienhuutinh@gmail.com', '$2y$10$fnOn3ExkiwoXh1G6tpKb8ulaAZusyFik9vrDZIyXDYXw///j7fFxG', '2100259', 'Cần Thơ', '0000-00-00', '848951003'),
(2407, 'U', 'Phan Nguyễn Huỳnh Như', 'nhunhankg@gmail.com', '$2y$10$3D7fNX4b36R05CKdF.GdiOo.stbKw8Rzts/5lhZqrBE06UC3QwBle', 'KTPM2211015', 'Cần Thơ', '0000-00-00', '975485106'),
(2408, 'U', 'PHAN THẢO NGUYÊN', 'Breadthaonguyen@gmail.com', '$2y$10$kfo8qYzd7SOyj5xokdzWVunRZULAfoEI.6HjT5domlXnqU6i60vS6', 'NGNA2211011', 'Cần Thơ', '0000-00-00', '978535551'),
(2409, 'U', 'Phan Thị Bảo Anh', 'ptbanh2100163@student.ctuet.edu.vn', '$2y$10$jhuDOMNCKCUpfw6ZccvyXeemmGdSHl2OfFgynz2sXuj1LrxW8U/tu', '2100163', 'Cần Thơ', '0000-00-00', '374950361'),
(2410, 'U', 'Phan Thị Diễm Trinh', 'phanthidiemtrinh2503@gmail.com', '$2y$10$G3pEDUTkH8udnDjmXLFDfO.v0UFgEz7.VpvyX3gAXs8m.wwnsCwHW', '2101204', 'Cần Thơ', '0000-00-00', '776552622'),
(2411, 'U', 'Phan Thị Như Quỳnh', 'Nhuquynh06122003q@gmail.com', '$2y$10$hA55dEz9AwiZOjNPRk2bAuK6AZQSGCgtj.o3ftBFXT.UJeWY1NPDq', '2101059', 'Cần Thơ', '0000-00-00', '948123930'),
(2412, 'U', 'Quách Tuấn Thành', 'qtthanh2101284@student.ctuet.edu.vn', '$2y$10$/Rbc7z37NIvQ2Bdvg3MC7OKWXfI.so66DBxh0UF2yckkMi0bWkOle', '2101284', 'Cần Thơ', '0000-00-00', '845567860'),
(2413, 'U', 'Sơn Thị Bảo Châu', 'stbchau05@gmail.com', '$2y$10$gVzzIDmO07xGPztUOzHitufbI2VqErZgDf1GA5gbXqs0bmRJDCP5K', 'CNTP2211071', 'Cần Thơ', '0000-00-00', '328353041'),
(2414, 'U', 'Sơn Thị Thùy Hương', 'stth4774@gmail.com', '$2y$10$n9YLlxvPH1aF.ybpZHnpa.eJP7r.NX0guFKPKFzdCYGTbHo6ykwQm', '2000549', 'Cần Thơ', '0000-00-00', '939335912'),
(2415, 'U', 'Tô Gia Trang', 'trang2101hkt@gmail.com', '$2y$10$Yv3z2jscy4J4HPPVK1IxdeCl4qRGmyhMGTha4aGk2TdpbigjJd5.S', 'NGNA2211010', 'Cần Thơ', '0000-00-00', '389720791'),
(2416, 'U', 'Tô Phúc Lợi', 'phucloi0123789@gmail.com', '$2y$10$BWUTtV3dHfKUdA74/9OXw.aHJz3lV8pCG..asosQ41tIpGWosqcTW', '2101258', 'Cần Thơ', '0000-00-00', '816904570'),
(2417, 'U', 'Tôn Thị Thùy Dương', 'tonthithuyduong20032019@gmail.com', '$2y$10$bWPlDI76PtI9SGycS5dpleLIABAmvLQIlzZSgIRpMYn6VCfqia8se', '2101645', 'Cần Thơ', '0000-00-00', '769351374'),
(2418, 'U', 'Tống Thị Kim Ngân', 'ttkngan2000871@student.ctuet.edu.vn', '$2y$10$AuHd5xE14t0OQ84pK1qG1ehHSrRAUuba5RgyoRaYmh1fZDZWTIrkm', '2000871', 'Cần Thơ', '0000-00-00', '855504527'),
(2419, 'U', 'Thái Sầm Thanh Xuân', 'stxuan120103@gmail.com', '$2y$10$4PLHVnAEqhYEzMXXlXED1u/1yj/efVza0LFN2rLakrR5sIr1JhC6a', '2100202', 'Cần Thơ', '0000-00-00', '369397895'),
(2420, 'U', 'THÁI TRƯƠNG NGỌC MAI', 'thaitruongngocmai@gmail.com', '$2y$10$ZZfjK599PuBbiTkYfKeAUufxLw/SeN4.e3wHzWYngOokm0j6DFG9S', 'QTKD2211003', 'Cần Thơ', '0000-00-00', '989462071'),
(2421, 'U', 'Thái Văn Phát', 'phat45021@gmail.com', '$2y$10$CT6pVz51PI0fKUJAma36YucX1VohBbl8DBOYecXOGmIK40P0Zdrgm', 'CNTP2211008', 'Cần Thơ', '0000-00-00', '374813148'),
(2422, 'U', 'Thị Kim Chi', 'tkchi2100913@student.ctuet.edu.vn', '$2y$10$mSEiv.mt51zB/eOEYXjIC.UrSCf5N80Yvva9.F6Meah8FAvx1DyQW', '2100913', 'Cần Thơ', '0000-00-00', '939693784'),
(2423, 'U', 'Trà Văn Quyến', 'travanquyen02022003@gmail.com', '$2y$10$NrGelXn5bGC5eX3J4isjf.ArWPGSW2ps.LvRg.ASgCWI1YsOArPaO', '2100455', 'Cần Thơ', '0000-00-00', '948769677'),
(2424, 'U', 'Trần Đoàn Duy Tấn', 'tddtanqlcn2211038@student.ctuet.edu.vn', '$2y$10$WH2Tn3hA3CoL7A9HzCMPZ.ACjaU3dbb6W5.nX7xiKoIHI4pu0Oo0G', 'QLCN2211038', 'Cần Thơ', '0000-00-00', '774872166'),
(2425, 'U', 'Trần Hải Yến', 'yentran6813@gmail.com', '$2y$10$XqaqeoNdHKImaucMlZMy7.76kDp5nTnCNwexOr/Q63xi2sKHiWPoi', 'NGNA2211005', 'Cần Thơ', '0000-00-00', '923503389'),
(2426, 'U', 'Trần Hồng Thư', 'tranthu2003cm@gmail.com', '$2y$10$LJTdb8qUBbkNecJoysCDSeRFj89XJ22Csow.iiGavRD3b.b31IuT6', 'CNTP2211079', 'Cần Thơ', '0000-00-00', '829926209'),
(2427, 'U', 'Trần Huỳnh Bảo Trân', 'baotrann1609@gmail.com', '$2y$10$54q0cGcnF/vXD70QNjKvYO58PnIlDOOaITuYa6tyVJLxnjzljlcIO', 'LUAT2211044', 'Cần Thơ', '0000-00-00', '815700556'),
(2428, 'U', 'Trần Huỳnh Thảo Như', 'thaonhu151203@gmail.com', '$2y$10$BUFDoNGgD7HqfI6P67aTfOlSc/qxRO580GAC21rLMuORJ74El77Nu', 'CNSH2211037', 'Cần Thơ', '0000-00-00', '939108873'),
(2429, 'U', 'Trần Kim Thi', 'trankimthi345@gmail.com', '$2y$10$w15BmRnRm.AF76RqpyfSveAtSBV7PgbP2fh8QUFh91w2vFVbjiRfu', '2100728', 'Cần Thơ', '0000-00-00', '867866734'),
(2430, 'U', 'Trần Khôi Nguyên', 'trankhoinguyen010190@gmail.com', '$2y$10$vzet/bz8WuFQqZjfKeT7bOUlYu/p6V4WFYzQqL6.QTh3J.vbmDny2', 'QTKD2211078', 'Cần Thơ', '0000-00-00', '971173296'),
(2431, 'U', 'Trần Lê Hoàng Trinh', 'tlhtrinh2101452@student.ctuet.edu.vn', '$2y$10$/MmSiy8PGe6wihiijB/XRuxOEwtL2nPPB4mGMsVJV3BdjrXsOGNb2', '2101452', 'Cần Thơ', '0000-00-00', '938363547'),
(2432, 'U', 'Trần Lê Nhựt Hào', 'Haotran2004thzz@gmail.com', '$2y$10$Nexw0IUERKeSfx0ycKUK6OXIJBzHRh9VhfJaGWNMDGYbew0i8JGeu', 'KTNL2211057', 'Cần Thơ', '0000-00-00', '984467815'),
(2433, 'U', 'Trần Minh Phương Ngọc', 'tmpngoc1908@gmail.com', '$2y$10$GBY5Zn9suItqpUbvVm7GEeOj5OuVsI2o8HXEQnOwwfyCZR9NMo3z6', '2101616', 'Cần Thơ', '0000-00-00', '779891003'),
(2434, 'U', 'Trần Nguyễn Hồng Như', 'hongnhu2002nc@gmail.com', '$2y$10$NnXqQH9RpqPhxEhQ0i7wPOG.MWCSXUXTu4mAeprMuT8nw6nCHME1K', '2100308', 'Cần Thơ', '0000-00-00', '357412454'),
(2435, 'U', 'Trần Nhã Linh', 'Trannhaling53@gmail.com', '$2y$10$5frxZKIJdfeMCIiroIJUV.ATSIZ9kGaVYwu2jKYP0xUYeLUBMgb0i', '2101260', 'Cần Thơ', '0000-00-00', '865995709'),
(2436, 'U', 'Trần Phan Chí Dỉnh', 'chidinh944@gmail.com', '$2y$10$nhXOGnk86n7GPAbHENm78Ok4BCuD6uOLuPvIjZoXUaUvwstuVfRl6', '2100184', 'Cần Thơ', '0000-00-00', '343040263'),
(2437, 'U', 'Trần Quốc Phong', 'tqphongqtkd2211058@student.ctuet.edu.vn', '$2y$10$gFaXiR9X1w90rmEu.fZLSOjroiS4Aoj8KCGIJ6lwnuWHfkYXSRdEO', 'QTKD2211058', 'Cần Thơ', '0000-00-00', '917816925'),
(2438, 'U', 'Trần Thanh Hiếu', 'hieutranthanhhieu52@gmail.com', '$2y$10$qDMhHzv1SNGUIgl.ok8xE.TTHVEEWokeWIpDXNHGV0nr1hOhMxF2i', 'CNCD2211052', 'Cần Thơ', '0000-00-00', '912130971'),
(2439, 'U', 'Trần Thanh Mừng', 'ttmung2101256@student.ctuet.edu.vn', '$2y$10$OobNJGMLRa3ePIub905dOu.IYDNSZo8WSabJwTLBZ8bb.qTvwSj1S', '2101256', 'Cần Thơ', '0000-00-00', '974136202'),
(2440, 'U', 'Trần Thanh Thảo', 'ttthao2101397@student.ctuet.edu.vn', '$2y$10$x9P7dXlle/IqnSC8S3Li3emTF.O0IsETrXGtDdsqZucirnBZxOVFi', '2101397', 'Cần Thơ', '0000-00-00', '814599284'),
(2441, 'U', 'Trần Thị Bé Bân', 'ttbb1658@gmail.com', '$2y$10$ASwkmIgurzUcpv.LXbSSnOr.dmh.vSww3z5pkfIBMUeMTAm5GHspa', '2100101', 'Cần Thơ', '0000-00-00', '769313021'),
(2442, 'U', 'Trần Thị Huỳnh Như', 'tthnhuqlcn2211037@student.ctuet.edu.vn', '$2y$10$U2PHA64JGTFpI52owG30ZuOie7jlstSm2br19CoVq14NjEs4sig4q', 'QLCN2211037', 'Cần Thơ', '0000-00-00', '796869058'),
(2443, 'U', 'Trần Thị Kim Đừng', 'ttkdung0808@gmail.com', '$2y$10$Hjh6iTnf2unwiUs8beFTvunYVCQqt3zEC8dZmnQBK1XUAdPiRy1bC', 'QLCN2211025', 'Cần Thơ', '0000-00-00', '368385981'),
(2444, 'U', 'Trần Thị Ngọc Diệu', 'Jennymyname022@gmail.com', '$2y$10$fX.B2C/h4OK2YSHvDLmLI.obkv8jc8/Wf3hvlfP08sPuIbygmPo.K', '2000178', 'Cần Thơ', '0000-00-00', '706508977');
INSERT INTO `users` (`user_id`, `user_level`, `user_name`, `user_email`, `user_password`, `user_mssv`, `user_address`, `user_birthdate`, `user_phonenumber`) VALUES
(2445, 'U', 'Trần Thị Ngọc Lựu', 'ttnluu2100452@student.ctuet.edu.vn', '$2y$10$D2C/nSxEm6iFyfvtwdwGYu1ysP31ds5QoQI9V2ZTxiUq6eBHNzFSC', '2100452', 'Cần Thơ', '0000-00-00', '769948774'),
(2446, 'U', 'Trần Thị Ngọc Trâm', 'ttntram2000457@student.ctuet.edu.vn', '$2y$10$9/6iwPm7La/Q9ErGjir3P.4G4QeHs.kt/hSDw/7Zo07f6dKVz8o6i', '2000457', 'Cần Thơ', '0000-00-00', '346538463'),
(2447, 'U', 'Trần Thị Như Ngọc', 'ttngoc2101496@student.ctuet.edu.vn', '$2y$10$QPiMKv8lY666wwIuRiWWXukgEIyPyvZXW9YlNBMyECbmCa8Tsdi9m', '2101496', 'Cần Thơ', '0000-00-00', '373303199'),
(2448, 'U', 'Trần Thị Như Ý', 'nhuy43686@gmail.com', '$2y$10$Fij/Ge7srcWpqCxWdW6kPOhiCsyO7GxxrDhZZxdO6v8xPJiovazlC', 'KTHC2211038', 'Cần Thơ', '0000-00-00', '948059531'),
(2449, 'U', 'Trần Thị Như Ý', 'ttnyngna2211004@student.ctuet.edu.vn', '$2y$10$gS9yyEtOFSKH3eLxrZ9vVesQXyNaIO8CV1e2R2s.bL.dpWmCFsDUS', 'NGNA2211004', 'Cần Thơ', '0000-00-00', '968627155'),
(2450, 'U', 'Trần Thị Thúy Kiều', 'tttkieucntt2211013@student.ctuet.edu.vn', '$2y$10$v8j87bcg1fnnp1CY3FJxm.297osF3W.ieQbbSLvKBfGga4wznLcV6', 'CNTT2211013', 'Cần Thơ', '0000-00-00', '899069754'),
(2451, 'U', 'Trần Thị Thuỳ Trang', 'Trantrangpipi2018@gmail.com', '$2y$10$SOrugN3gdfwXdUQhv3TNH.QZPCsPaGfkvcAa6rGpgROxMT3iwNe26', '2100825', 'Cần Thơ', '0000-00-00', '779856798'),
(2452, 'U', 'Trần Thị Ý Nhi', 'nhitran0829@gmail.com', '$2y$10$x58tIH6cLxMmwRFMRCNqderH9k5XF9W6yxH4/DlSP6aZket2rqtpm', 'QLCN2211062', 'Cần Thơ', '0000-00-00', '829932237'),
(2453, 'U', 'Trần Trí Nguyên', 'ttnguyen2101314@student.ctuet.edu.vn', '$2y$10$MGX5hJl525KZob3IAaadweHrhgBqSbdOJQfgnTccFPg0du9piSnha', '2101314', 'Cần Thơ', '0000-00-00', '939473788'),
(2454, 'U', 'Trần Trung Quân', 'trungquan1311@gmai.com', '$2y$10$0VQ51x66OP/M6gWl4LPUbOQJQfng0aVV8gOeTRHiZr3tTzPAfuqfW', '2000461', 'Cần Thơ', '0000-00-00', '939289964'),
(2455, 'U', 'Trần Văn Khánh', 'trankhanh284414@gmail.com', '$2y$10$jh99pQmfU3cHeR6Kslgha.4Gdo3e/XVFuFPbRXM/8UbVbc.ii84ta', '2101417', 'Cần Thơ', '0000-00-00', '921132402'),
(2456, 'U', 'Trần Văn Trọng', 'Vantrongk4@gmail.com', '$2y$10$TLQvXdLZ8mFa1JUURr7wf.dxmxoUDHhlZA1V8poQydQ2yllyo8Myy', 'HTTT2211023', 'Cần Thơ', '0000-00-00', '372039512'),
(2457, 'U', 'Trần Vũ Luân', 'tluan9810@gmail.com', '$2y$10$snuLQn9QlMaLmNfI67ckjebcebjyO6H3Eg6hIxB.DcC83RjiWlVT6', '2101121', 'Cần Thơ', '0000-00-00', '372223760'),
(2458, 'U', 'Trương Đặng Đình Kiệt', 'truongk688@gmail.com', '$2y$10$O/mo3aFDoP//TSK0Iuh7JumlVBa6Z.CD.S485im5qHMt.c2hrvo1O', 'KTNL2211033', 'Cần Thơ', '0000-00-00', '707563796'),
(2459, 'U', 'Trương Đình Khả', 'tdkhacncd2211032student.ctuet.edu.vn', '$2y$10$zu5ml5NKl3YSb/OfpsPaL.zRitOt9z71/6Jr7ZuhNV5KvUnEnYJTG', 'CNCD2211032', 'Cần Thơ', '0000-00-00', '772800348'),
(2460, 'U', 'TRƯƠNG HẢI ĐĂNG', 'Truonghaidang15102022@gmail.com', '$2y$10$TkFgXCcYqyV8xlLnv3ffbu1PraqaEkQTrcTaK6A68XfBH/WZurjRi', 'CNCD2211031', 'Cần Thơ', '0000-00-00', '339642809'),
(2461, 'U', 'Trương Huỳnh Anh', 'thanh2100069@student.ctuet.edu.vn', '$2y$10$O.WrRkHhlPdP07Roev81lOqze6S1jaCE2JHfGU/m8rJULo6N5jmya', '2100069', 'Cần Thơ', '0000-00-00', '766984758'),
(2462, 'U', 'Trương Thanh Nghị', 'nghitruong200104@gmail.com', '$2y$10$/UTFKIl42Zah2pETxW7Lme1WIBvD0qiNSymHEowViAs2OZWgwctQ2', 'CNCD2211055', 'Cần Thơ', '0000-00-00', '843500543'),
(2463, 'U', 'Trương Thanh Nhựt', 'truongthanhnhut019@gmail.com', '$2y$10$deJuQfRKozrgxZQOKK1aTuKaq7JZuz36Kzsv676iss5.08vLjqoq.', '2101503', 'Cần Thơ', '0000-00-00', '853588019'),
(2464, 'U', 'Trương Thanh Thảo', 'ttthao2100246@student.ctuet.edu.vn', '$2y$10$UJRmcdS50d5RPt.FuupedOMTyKLPhCyidAnonoRHZZeOaT7LeDMxq', '2100246', 'Cần Thơ', '0000-00-00', '342276549'),
(2465, 'U', 'Trương Thị Hồng Ái', 'Truongthihongaist02@gmail.com', '$2y$10$GGdBbRCBeVW2jcGdfhe4cuZqYy6YePhDrYu.yThn32jZBvvTHWIVe', '2101261', 'Cần Thơ', '0000-00-00', '836407083'),
(2466, 'U', 'Trương Thị Mộng Hân', 'Monghan04062004@gmail.com', '$2y$10$TfkLHbIb6Pz/7FrgnPHz1.Zrb8avdo/JlRERnm9w.YP/D.j5g7Tg2', 'NGNA2211033', 'Cần Thơ', '0000-00-00', '764323109'),
(2467, 'U', 'Trương Thị Ngọc', 'ttngoc2101264@studen.ctuet.edu.vn', '$2y$10$MCjrIYXj.lwVlyGs0/.gd.gYwXK99w7NuwzYcDlzyfd6mZzknhU5C', '2101264', 'Cần Thơ', '0000-00-00', '349685272'),
(2468, 'U', 'Trương Thị Như Yến', 'truongthinhuyen23062002@gmail.com', '$2y$10$FwcPatHZjlN.cxaberYNVuifl9Rh.U59jun2/aOMejkYuUQL51rz2', '2000840', 'Cần Thơ', '0000-00-00', '793852939'),
(2469, 'U', 'Trương Thị Thúy Oanh', 'tttoanh2101427@student.ctuet.edu.vn', '$2y$10$wDBw/dYn72EXZFd9p5DAVuvrtxMv//eqEqrWTpmVqBgnyeVwrQiHG', '2101427', 'Cần Thơ', '0000-00-00', '352858312'),
(2470, 'U', 'TRƯƠNG THIEN KIM', 'truongthienkim154@gmail.com', '$2y$10$Y90FDDJTw/FyGoKKGweXbeNfpCUyq9efbkAXjlXBmmRCwUmrpov2q', 'CNTP2211060', 'Cần Thơ', '0000-00-00', '867970711'),
(2471, 'U', 'Văn Ngọc Huỳnh Như', 'vanhuynhnhu17@gmail.com', '$2y$10$DGI5cdk0c54gykUpTS8zUez.Ag8oNdkEeiScthYlzU4i6SyeeGSI.', 'NGNA2211049', 'Cần Thơ', '0000-00-00', '854996027'),
(2472, 'U', 'Vi Thanh Ngà', 'vtnga2100488@student.ctuet.edu.vn', '$2y$10$xPXvlNQryX6csLX6kNLtiewOPKlMN0t3x8XWhxKRLey1KBNET8UFy', '2100488', 'Cần Thơ', '0000-00-00', '395517801'),
(2473, 'U', 'Võ hoài lâm', 'Vhlam2100490@studnet.ctuet.edu.vn', '$2y$10$R6HKbph9kwq7YdyA/7yxYeqP0qV/02xO.tfaX4iESUzUQm3RJYEJG', '2100490', 'Cần Thơ', '0000-00-00', '359448913'),
(2474, 'U', 'Võ Hồng Thái', 'vhthaicncd2211020@student.ctuet.edu.vn', '$2y$10$3noRZLQFOq0STEDbbQ0r4urRYyD1.rWYfxAfeXeOTh4I8bO8bQKju', 'CNCĐ2211020', 'Cần Thơ', '0000-00-00', '329359771'),
(2475, 'U', 'Võ Minh Thùy', 'vmthuy2100708@student.ctuet.edu.vn', '$2y$10$ZWuKic.k0Mrt5E4CMkucW.QiGdaQ63wJXPn6.WtUG1l8jpzFXqwZC', '2100708', 'Cần Thơ', '0000-00-00', '917679172'),
(2476, 'U', 'Võ Ngọc Anh Thư', 'vnathu2004@gmail.com', '$2y$10$coKQFrnNCUQWAulrIXCJmeB10JewHmOpde2fsLxu1j6oedaYSbQZK', 'HTTT2211030', 'Cần Thơ', '0000-00-00', '357133171'),
(2477, 'U', 'Võ Phước Diện', 'vophuocdien2004@gmail.com', '$2y$10$tbnY82Ce9ZAo5BCWWghR0epmwQVg2b7fj3Yy97qAKyHdpvMLfE.ra', 'QLCN2211012', 'Cần Thơ', '0000-00-00', '397160837'),
(2478, 'U', 'Võ Phương Huỳnh', 'vphuynh2100837@student.ctuet.edu.vn', '$2y$10$bK9GPg2N8nkvqw6Z1fZepOwhdLDt11ZPNbcoUZPgeo7slhTIwvqAi', '2100837', 'Cần Thơ', '0000-00-00', '857133930'),
(2479, 'U', 'VÕ THÀNH PHÚ', 'vothanhphu.hgi1167@gmail.com', '$2y$10$bX.Y2KREP3/.t.E0DO2w2.Rkfurc9KFr8AxMenidSqpbH8PxwtUta', 'KHMT2211008', 'Cần Thơ', '0000-00-00', '353849037'),
(2480, 'U', 'Võ Thị Hai', 'vothimyduyen.hgi1167@gmail.com', '$2y$10$O2qzbgHX3MznlyF8X1LOl.IyOIOaD5ifOsNQB9qlahpD8SVYVjVkS', 'KTPM2211024', 'Cần Thơ', '0000-00-00', '393563643'),
(2481, 'U', 'Võ Thị Tú My', 'Vothitumy2004tvc@gmail.com', '$2y$10$yIUMR6lQlN5ufYWkejirsOMLDEDGQKLaEq.aNcWpxaxdA32m/0Me2', 'CNTP2211067', 'Cần Thơ', '0000-00-00', '342530907'),
(2482, 'U', 'Võ Thị Yến Nhi', 'vtynhi2100615@student.ctuet.edu.vn', '$2y$10$TrulGQ74Ic/.Iltxr4edu.tAAlsMXdiokbbCdtpVUlFA8ulDmSh9G', '2100615', 'Cần Thơ', '0000-00-00', '353444371'),
(2483, 'U', 'Huỳnh Mình Anh', 'minhanhsieusieuom@gmail.com', '$2y$10$G3Ei4lNML/HrIGxuTZiq1OYIpeYUpjT1xNvV/xmm16yvxhtj2b04u', '2100515', 'Cần Thơ', '0000-00-00', '949419013'),
(2484, 'U', 'Nguyễn Thanh Duy', 'ntduy2100571@student.ctuet.edu.vn', '$2y$10$3d0LEyyZRBEeymp9i6Xbpez/R2v6wxrpqIdt.9KCVm7BrrTN1aZZW', '2100571', 'Cần Thơ', '0000-00-00', '782960811'),
(2485, 'U', 'Võ Thị Anh Thư', 'vothu5785@gmail.com', '$2y$10$bObk/WH9PSo6XOUuuHK4UuI9MlIh3RCK6D7sonuu4uCPyejTfv6fS', 'KTPM2211065', 'Cần Thơ', '0000-00-00', '326601572'),
(2486, 'U', 'Trịnh Lê Bảo Ngọc', 'Trinhlebaongoc.2004@gmail.com', '$2y$10$tpveYk6KVI8Ps2T/3Bur1uh39zYs5S8.LyKeSDFt6mtLzLcB7ToGa', 'TCNH2211080', 'Cần Thơ', '0000-00-00', '795831622'),
(2487, 'U', 'Lâm Phương Nhã', 'nha20092004@gmail.com', '$2y$10$2DTp7MNlM52k/iYnXctqm.BqVVnUquOT5KGp/fmrmgBUBXkGaFwTe', 'TCNH2211055', 'Cần Thơ', '0000-00-00', '859405119'),
(2488, 'U', 'NGUYỄN TẤN PHÁT', 'nguyentanphat090801@gmail.com', '$2y$10$bAZfwo0CLpwaM9gUCtkJOOwLAH6Tr/wQq2EcwIFPE79oLTqXyD3M2', '2001209', 'Cần Thơ', '0000-00-00', '964617404'),
(2489, 'U', 'Nguyễn Minh Anh', 'slimecutejum@gmail.com', '$2y$10$f55wG1U5HK/ewF4RkikRPuawWQAwxxMLXlEh4H591WLOo9whUFSa2', '2101339', 'Cần Thơ', '0000-00-00', '978265950'),
(2490, 'U', 'Lê Thành Đạt', 'Ltdat2000135@student.ctuet.edu.vn', '$2y$10$/SofoKbvOyyvZdCyUJmS0u2y8f69eDxaK6vZ.v5IBBTiJzHxJOu6K', '2000135', 'Cần Thơ', '0000-00-00', '945329846'),
(2491, 'U', 'Phạm Anh Thư', 'tp267330@gmail.com', '$2y$10$YOAckOuo5JAbxWZL6nzpe.wq7HznFyVnoOVFJVj5HK9CbM3.A7NtK', '2100721', 'Cần Thơ', '0000-00-00', '943752405'),
(2492, 'U', 'Lê Hồng Phú', 'lhphu2000964@student.ctuet.edu.vn', '$2y$10$Y471crFsQ3x5GhVHbXEMzukq6UKWo5YQ4AzJrspRKMZaWmOga/kNm', '2000964', 'Cần Thơ', '0000-00-00', '382603446'),
(2493, 'U', 'Trần Văn Ngọc Thạch', 'tvnthach2000194@student.ctuet.edu.vn', '$2y$10$AaXEr9ajxdFB61av178Z6OPq9FzxMs5EZUKKX9gqzzV5RtaytmaA.', '2000194', 'Cần Thơ', '0000-00-00', '766854319'),
(2494, 'U', 'Trương Thị Kiều Phương', 'ttkphuong2001094@student.ctuet.edu.vn', '$2y$10$JyjPF3z7QAMyWNsNtIq2Ou/7UNVIegJm3Wy426BkUx1GKTbeR62k6', '2001094', 'Cần Thơ', '0000-00-00', '365851284'),
(2495, 'U', 'Nguyễn Quang Ái', 'nqai2000002@student.ctuet.edu.vn', '$2y$10$WcL6eC1qQcXeT/x9G2RCg.5UXhdsk0AbbS9nyyqDmaZzId2Pb.foG', '2000002', 'Cần Thơ', '0000-00-00', '384901900'),
(2496, 'U', 'Trần Thị Bảo Trâm', 'ttbtram2000611@student.ctuet.edu.vn', '$2y$10$oCnrlSzMo3QunHY.YQMC5elsEsIfdJrtTGbKYQmcqjt2oJMmIoEY.', '2000611', 'Cần Thơ', '0000-00-00', '971205242'),
(2497, 'U', 'Trần Tường Vi', 'ttvi2000518@student.ctuet.edu.vn', '$2y$10$dsplrlHDjX54.Syo9rK2MOhHzHfhoX0T/0qHuYr.mZnkm15q67OV6', '2000518', 'Cần Thơ', '0000-00-00', '369400065'),
(2498, 'U', 'Trần Hiếu Vi', 'thvi2000515@student.ctuet.edu.vn', '$2y$10$PkAmjb2JNzGDUza1A/PZ0uG1L/IVbDn.Vn5EesKTcHgEHwYFAQ3CS', '2000515', 'Cần Thơ', '0000-00-00', '888845035'),
(2499, 'U', 'Nguyễn Tấn Phát', 'ntphat2001209@student.ctuet.edu.vn', '$2y$10$m7QySLfqvPG6FOmkqNbGT.qHuasERW.kIAWAfaI4d4ReXGKhx3czC', '2001209', 'Cần Thơ', '0000-00-00', '964617404'),
(2500, 'U', 'Võ Văn Toàn', 'votoan160119@gmail.com', '$2y$10$37/lc25BFle.tnc1Xs7/Q.FnzafKYuoH951NQ9EdCBO0Ecer0BEFm', '2100331', 'Cần Thơ', '0000-00-00', '916674542'),
(2501, 'U', 'Nguyễn Minh Anh', 'nmanh2101339@student.ctuet.edu.vn', '$2y$10$BtJpR4QJqyaLipR.wr47iu4klL38AQAaONER5hGDkskrxKC2EQ3HO', '2101339', 'Cần Thơ', '0000-00-00', '978265950'),
(2502, 'U', 'Lâm Mỹ Duyên', 'lmduyen2101546@student.ctuet.edu.vn', '$2y$10$xCop9i41P3tU2eefsHYUDeOOIw3VvaP3J3pwZ7VBa4xTptaC3SDjC', '2101546', 'Cần Thơ', '0000-00-00', '783759345'),
(2503, 'U', 'Huỳnh Bảo Trân', 'hbtran2101439@student.ctuet.edu.vn', '$2y$10$vWvTKwP.ukOkAejYEVvb1eQ7/LX9IRd9gixK.UVYV4WJJMU3lc5g.', '2101439', 'Cần Thơ', '0000-00-00', '912474810'),
(2504, 'U', 'Nguyễn Thị Hương Lan', 'nthlan2100421@student.ctuet.edu.vn', '$2y$10$hczSyLVa1YO7tM1HftaFH.38pTic3nw4xFbNixqVi8wrIwH1g84HG', '2100421', 'Cần Thơ', '0000-00-00', '899161506'),
(2505, 'U', 'Huỳnh Ngọc Quí', 'hnqui2100763@student.ctuet.edu.vn', '$2y$10$PCznjZCZ1PElay6OH3Gh5.LhO4IxSsG/kAR3p5YjTiHYOp3qs9Jne', '2100763', 'Cần Thơ', '0000-00-00', '944855217'),
(2506, 'U', 'Lê Thị Kim Nguyên', 'ltknguyen2100740@student.ctuet.edu.vn', '$2y$10$.JD0NYaDTX1bzIf3Ob4Dzuf8PlkaZTPiLdSMEnsGuytXte6URPGu.', '2100740', 'Cần Thơ', '0000-00-00', '917800737'),
(2507, 'U', 'Lê Hoàng Sơn', 'lhson2000545@studen.ctuet.edu.vn', '$2y$10$PurIao9AUK9UpERv9iH3GOQq/PHFAug/7QbiubJBQfbvfZ0OKCNWy', '2000545', 'Cần Thơ', '0000-00-00', '945524856'),
(2508, 'U', 'Phạm Thị Tuyết Anh', 'ptta2101123@student.ctuet.edu.vn', '$2y$10$HYdPyi7KrNn8FpDyrEdZkOO1fwyAKd6FlTEY3kmq812wxDzP810xm', '2101123', 'Cần Thơ', '0000-00-00', '788782684'),
(2509, 'U', 'Nguyễn Lê Yến Nhi', 'nlynhi2000274@student.ctuet.edu.vn', '$2y$10$ihPgNCpcFSshq2k99LX0TOY8BrboMeejzdz9K5Vc73axeSSyUHRqC', '2000274', 'Cần Thơ', '0000-00-00', '984610807'),
(2510, 'U', 'Phạm Nguyễn Minh Luận', 'pnmluan2101385@student.ctuet.edu.vn', '$2y$10$OMiXRwo1xRV7GTUBEz8T5eutBvqgWoyARJw5lE4EsvhAa3diTnlfu', '2101385', 'Cần Thơ', '0000-00-00', '328347554'),
(2511, 'U', 'Võ Nguyễn Yến Nhi', 'vnynhi2100100@student.ctuet.edu.vn', '$2y$10$49KGCvCa216R.25hcGRTiOTxg2bzrLQQO5bxk7/5jCWRCn03Rsj1O', '2100100', 'Cần Thơ', '0000-00-00', '778734667'),
(2512, 'U', 'Ngô Hoàng Ánh Vy', 'nhavy2100788@student.ctuet.edu.vn', '$2y$10$aUpDc2oOKWtTxsiLRqOUSemJL9fkr5rqFjYMeeaAmz4PwvXv2ybRW', '2100788', 'Cần Thơ', '0000-00-00', '783820626'),
(2513, 'U', 'Quách Thị Tuyết Trân', 'qtttran2100130@student.ctuet.edu.vn', '$2y$10$PyEpvZusIa2XPJaDpdbeXex.tlqpI024ibpnp8hCbHnm/lV9X9dcm', '2100130', 'Cần Thơ', '0000-00-00', '868631354'),
(2514, 'U', 'Lê Thị Ngọc Hương', 'ltnhuong2100164@student.ctuet.edu.vn', '$2y$10$Xy.f.QloTbkqH307XWZoyu6kaOQAkgpnurYLQdm9JgKPzEo/EdvIO', '2100164', 'Cần Thơ', '0000-00-00', '376954204'),
(2515, 'U', 'Phạm Châu Tuyết Nhi', 'pctnhi2100590@student.ctuet.edu.vn', '$2y$10$nt2z1b3huXAe5.CNsCOx8ePf1SjWb2bazGaPNTnAmK7T8l0p7u6s2', '2100590', 'Cần Thơ', '0000-00-00', '912419809'),
(2516, 'U', 'Trần Phước Hoàng Khang', 'tphkhang2101509@student.ctuet.edu.vn', '$2y$10$t3PLNViZyjzJPwOHWtzK4uwoGZoo7Jk8XYU7nMd9dNpc/Er810G5C', '2101509', 'Cần Thơ', '0000-00-00', '799547381'),
(2517, 'U', 'Nguyễn Trần Thảo Nhi', 'nttnhi2100412@student.ctuet.edu.vn', '$2y$10$Dm9mLlvUTBAbb6ONoYfWruk5GGPbp5jaq.HFougeX939XUHbzI8o.', '2100412', 'Cần Thơ', '0000-00-00', '387383247'),
(2518, 'U', 'Nguyễn Văn Tuấn Kiệt', 'nvtkiet2100926@student.ctuet.edu.vn', '$2y$10$SIRpIXYj.Ob4r/YtdVO95OiTMTZ.TntZEMdOWvls3AcT.Kbou8fce', '2100926', 'Cần Thơ', '0000-00-00', '868289403'),
(2519, 'U', 'Trần Ngọc Châu', 'tnchau2100206@student.ctuet.edu.vn', '$2y$10$NCz6oqOEaKYTNISHWy3B9uz2qtZ0.LSAV0QNVe6AYQLUS0.RPcoUC', '2100206', 'Cần Thơ', '0000-00-00', '706345056'),
(2520, 'U', 'Đỗ Thị Thuý Huỳnh', 'dtthuynh2101453@student.ctuet.edu.vn', '$2y$10$abUZ2/RcZ/c2lYTBRk0zCekzU35WHEVOlxVhOHUkoolFMHyqN3Pr2', '2101453', 'Cần Thơ', '0000-00-00', '939647163'),
(2521, 'U', 'Nguyễn Thị Tuyết Mai', 'nttmai2101094@student.ctute.edu.vn', '$2y$10$V9KECS57EsNefC65eC.T9O6bqwBn5U5goyPOxWVG0ldJQtifpB1hC', '2101094', 'Cần Thơ', '0000-00-00', '706351863'),
(2522, 'U', 'Trần Vĩnh Bảo Nhi', 'tvbnhi2100657@student.ctuet.edu.vn', '$2y$10$AswFoPXOp4UByIJ7cgbtF.44B5rBiJNVK4PEkZcuCxCmgckgZd6RK', '2100657', 'Cần Thơ', '0000-00-00', '767538144'),
(2523, 'U', 'Phạm Phước Vinh', 'ppvinh2100881@student.ctuet.edu.vn', '$2y$10$yRumysaZxwiQsd5iRGYnMOt.dFQsFy3BSRyFmpRZBo5MG.K6WDDpC', '2100881', 'Cần Thơ', '0000-00-00', '799654583'),
(2524, 'U', 'Dương Thị Tường Vi', 'dttvi2100977@student.ctuet.edu.vn', '$2y$10$2xgj/JbGqOsgGJkqDMP/LeaimURdHA4xj.Qoxt1N8cw05SW67JYjm', '2100977', 'Cần Thơ', '0000-00-00', '919406821'),
(2525, 'U', 'Nguyễn Thanh Thuận', 'ntthuan2100581@student.ctuet.edu.vn', '$2y$10$5sp99WU.SMKFOzyWKOWj9OGO3hvdqb6lrcPxPI8bayug16J55MMEW', '2100581', 'Cần Thơ', '0000-00-00', '702923876'),
(2526, 'U', 'Đinh Công Nguyên', 'dcnguyen2100866@student.ctuet.edu.vn', '$2y$10$gBKrk8OVXbn8COxh/kZYau34TlUs6erYoL5bF15uPR59t9RQZSxgy', '2100866', 'Cần Thơ', '0000-00-00', '584809528'),
(2527, 'U', 'Thái Thị Thanh Xuân', 'tttxuan2100194@student.ctuet.edu.vn', '$2y$10$L2ATg4Q0AWKCB79skF2B6.ytTwc9GKC7mu4JTOZGi.PhJdnDEd2mi', '2100194', 'Cần Thơ', '0000-00-00', '326250315'),
(2528, 'U', 'Nguyễn Đình Duy', 'munkonangel@gmail.com', '$2y$10$I1wdw7qMpLp8/naefmo/0eTmdYQR5o9z2MRhncWkm5ih6ixKx1c0K', '2000258', 'Cần Thơ', '0000-00-00', '372074484'),
(2529, 'U', 'Nguyễn Quốc Vinh', 'nqvinh2100658@student.ctuet.edu.vn', '$2y$10$vao120JOG0qwew5HucZ6f.i9RHlHoIPvvnQUips5DSvNSfXKjayIC', '2100658', 'Cần Thơ', '0000-00-00', '932822027'),
(2530, 'U', 'Nguyễn Thị Mỹ Ngà', 'ntmnga2100289@student.ctuet.edu.vn', '$2y$10$0fDtpGmoQIR1KOb8ydQDse8N24Vcs.MgDYQvsiuzsP.R.kfykT4fy', '2100289', 'Cần Thơ', '0000-00-00', '763900511'),
(2531, 'U', 'Phạm Văn Được', 'phamvanduoc0677@gmail.com', '$2y$10$OcxUDNIF6hvd3..YsZ5S3uxintvpgx4X17veZWIVI44q65Ct6Fiz.', '2100217', 'Cần Thơ', '0000-00-00', '367630677'),
(2532, 'U', 'LÊ NGUYỄN HỒNG ANH', 'lnhanh2100002@student.ctuet.edu.vn', '$2y$10$Hal4LDCRKRJX3vfR0jdOw.Wxq6eDBo3ONB.j.8sxh9/QmMyZPj6.e', '2100002', 'Cần Thơ', '0000-00-00', '355203490'),
(2533, 'U', 'Lê Diễm Ngọc', 'ldngoc2100324@student.ctuet.edu.com', '$2y$10$.skCH1Up2rIQOqTixPPrpeXnQBS4AND4hV4eToWewsZBPFs/si8X.', '2100324', 'Cần Thơ', '0000-00-00', '339712560'),
(2534, 'U', 'Lê Thúy Quỳnh', 'ltquynh2100122@student.ctuet.edu.vn', '$2y$10$cBmps4NV4ZjdoinT1e8egOZKOFgnYHGcYHo78Chha0iKJGsVD28Nq', '2100122', 'Cần Thơ', '0000-00-00', '945592731'),
(2535, 'U', 'Huỳnh Công Hiếu', 'hchieu2101249@student.ctuet.edu.vn', '$2y$10$avkLPKlVK3KWhctK.VdJT.GL2rE9fuqpKGpXtVxmlqFaUIkvBuwc.', '2101249', 'Cần Thơ', '0000-00-00', '835587599'),
(2536, 'U', 'Huỳnh Minh Anh', 'hmanh2100515@student.ctuet.edu.vn', '$2y$10$ubFCfSvrGO40jaYQ4N1SuuJLdfZ0cLtOn2nmZEHPB94WrIVwSUbzW', '2100515', 'Cần Thơ', '0000-00-00', '949419013'),
(2537, 'U', 'Phạm Khánh Duy', 'phamkhanhduyqq123@gmai.com', '$2y$10$Qccp8m/dQ7HUPDYYyF2rXu1zlkviPkySlqpLzboP/j6i87EZM3ynm', '2000823', 'Cần Thơ', '0000-00-00', '704161224'),
(2538, 'U', 'Nguyễn Trí Khang', 'Vbui011@gamil.com', '$2y$10$9vfYYY6kFVsZTD/0RjRLwOBxPSsoSa8YG3G/nu5nPIdi1tf0u1MY2', '2000831', 'Cần Thơ', '0000-00-00', '355420828'),
(2539, 'T', 'ThS. Hà Lê Ngọc Dung', 'hlndung@ctuet.edu.vn', '$2y$10$sHROpMzLidElOA5Db8M6sOiphKBl0IGz9qUyVxBBZ/2LDRaH1hYgG', 'KHMT01', 'Cần Thơ', '1990-01-01', '0987654321'),
(2540, 'T', 'Lâm Thanh Toản', 'lamthanhtoan@gmail.com', '$2y$10$N3UuKihQTwDNSGNj9VkX4OUqrV3P9kFGnUZb.0zuSpGoKrhpoP2uW', 'KHMT01', 'Cần Thơ', '1990-01-01', '09876543321'),
(2541, 'T', 'Hồng Thanh Luận', 'hongthanhluan@gmail.com', '$2y$10$igCvqnPjxzA2taBuqMOwFeSIPm.P2OjqxDC.P9Qgxr0Ii7ARlaKgq', 'CNTT01', 'Cần Thơ', '1990-01-01', '0987654321'),
(2542, 'T', 'Lê Thị Thảo', 'lethithao@gmail.com', '$2y$10$kftu4YDiYbMTdKkTcwRW/.2xITrEMA6u2vsnKN.gJinVFRUU0LPCi', 'QLKH01', 'Cần Thơ', '1990-01-01', '0987654321');

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
  MODIFY `class_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2543;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
