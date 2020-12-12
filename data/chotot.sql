-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2020 at 07:52 PM
-- Server version: 10.4.13-MariaDB-log
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chotot`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner_images`
--

CREATE TABLE `banner_images` (
  `id_banner` int(11) NOT NULL,
  `chucnang` int(1) NOT NULL,
  `link` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banner_images`
--

INSERT INTO `banner_images` (`id_banner`, `chucnang`, `link`) VALUES
(1, 1, 'https://static.chotot.com.vn/storage/admin-centre/buyer_collection_y_homepage_banner/buyer_collection_y_homepage_banner_1603934186952.jpg'),
(2, 2, 'https://static.chotot.com.vn/storage/admin-centre/buyer_collection_y_homepage_banner/buyer_collection_y_homepage_banner_1603251858399.jpg'),
(3, 1, 'https://static.chotot.com.vn/storage/admin-centre/buyer_collection_y_homepage_banner/buyer_collection_y_homepage_banner_1603336859115.jpg'),
(4, 1, 'https://static.chotot.com.vn/storage/admin-centre/buyer_collection_y_homepage_banner/buyer_collection_y_homepage_banner_1601881795854.jpg'),
(5, 1, 'https://static.chotot.com.vn/storage/admin-centre/buyer_collection_y_homepage_banner/buyer_collection_y_homepage_banner_1603934186952.jpg'),
(6, 1, 'https://static.chotot.com.vn/storage/admin-centre/buyer_collection_y_homepage_banner/buyer_collection_y_homepage_banner_1600743091481.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `danhmuctin`
--

CREATE TABLE `danhmuctin` (
  `id` int(11) NOT NULL,
  `tendanhmuc` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `danhmuctin`
--

INSERT INTO `danhmuctin` (`id`, `tendanhmuc`, `description`, `image`) VALUES
(1, 'Bất động sản', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/1000.png'),
(8, 'Cho tặng miễn phí', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/cho-tang-mien-phi.png'),
(7, 'Du lịch, Dịch vụ', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/6000.png'),
(4, 'Đồ ăn, thực phẩm', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/7000.png'),
(13, 'Đồ dùng văn phòng', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/8000.png'),
(3, 'Đồ điện tử', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/5000.png'),
(10, 'Đồ gia dụng, nội thất', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/14000.png'),
(5, 'Giải trí, thể thao', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/4000.png'),
(6, 'Mẹ và bé', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/11000.png'),
(14, 'Tất cả danh mục', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/tat-ca-danh-muc.png'),
(12, 'Thời trang', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/3000.png'),
(9, 'Thú cưng', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/12000.png'),
(11, 'Tủ lạnh, máy giặt', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/9000.png'),
(15, 'Việc làm', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/13000.png'),
(2, 'Xe cộ', ' ', 'https://static.chotot.com/storage/chapy-pro/newcats/v8/2000.png');

-- --------------------------------------------------------

--
-- Table structure for table `hinhanh`
--

CREATE TABLE `hinhanh` (
  `id_anh` int(11) NOT NULL,
  `id_tindang` int(11) NOT NULL,
  `link` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `id_nguoibaocao` int(11) NOT NULL,
  `id_tindang` int(11) NOT NULL,
  `content` text NOT NULL,
  `createAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tindaluu`
--

CREATE TABLE `tindaluu` (
  `id` int(11) NOT NULL,
  `id_tindang` int(11) NOT NULL,
  `id_nguoiluutin` int(11) NOT NULL,
  `createAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tindaluu`
--

INSERT INTO `tindaluu` (`id`, `id_tindang`, `id_nguoiluutin`, `createAt`) VALUES
(1, 24, 5, '2020-12-12 02:42:46'),
(2, 10, 5, '2020-12-12 02:42:46'),
(3, 26, 1, '2020-12-12 17:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `tindang`
--

CREATE TABLE `tindang` (
  `id_tindang` int(11) NOT NULL,
  `idnguoiban` int(11) DEFAULT NULL,
  `ten` varchar(250) DEFAULT NULL,
  `tendanhmuc` varchar(40) NOT NULL,
  `loaitin` varchar(50) DEFAULT NULL,
  `diadiem` varchar(250) NOT NULL,
  `giaban` int(12) DEFAULT NULL,
  `anh` text NOT NULL DEFAULT '\'\\\'https://image.shutterstock.com/image-vector/merchandise-line-icons-signs-set-600w-1371727865.jpg\\\'\'',
  `describe` varchar(300) DEFAULT NULL,
  `trangthai` int(1) DEFAULT 1,
  `ngaydangtin` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaycapnhat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tindang`
--

INSERT INTO `tindang` (`id_tindang`, `idnguoiban`, `ten`, `tendanhmuc`, `loaitin`, `diadiem`, `giaban`, `anh`, `describe`, `trangthai`, `ngaydangtin`, `ngaycapnhat`) VALUES
(1, 1, 'Bàn ghế', 'Đồ gia dụng, nội thất', 'Cần bán', 'Hải', 124324, 'https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(2, 1, 'Nhà biệt thự', 'Bất động sản', 'Cần bán', 'Hà Nội', 2000000000, 'https://huytrandesign.vn/upload_images/images/2019/04/18/thiet-ke-nha-dep-thiet-ke-biet-thu-ninh-hiep-anh-luc-1.jpg', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(3, 2, 'Điện thoại', '	\r\nĐồ điện tử', 'Cần bán', 'Thái Bình', 9000000, 'https://cdn.tgdd.vn/Files/2020/05/12/1254989/iphone-12-eap_800x450.jpg', NULL, 3, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(4, 3, 'Điện thoại cũ', '	\r\nĐồ điện tử', 'Cần bán', 'Thái Bình', 4000000, 'https://cdn.tgdd.vn/Files/2020/05/12/1254989/iphone-12-eap_800x450.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(5, 2, 'Thú cưng', 'Thú cưng', 'Cần bán', 'Hà Nội', 5000000, 'https://cms.luatvietnam.vn/uploaded/Images/Original/2019/01/17/nuoi-cho-meo_1701125148.png', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(6, 5, 'Iphone 12', '	\r\nĐồ điện tử', 'Cần bán', 'Hà Nội', 25000000, 'https://i1-sohoa.vnecdn.net/2020/10/26/iPhone-12-Pro-VnExpress-03079-8809-3623-1603700356.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=Mi-s2IDK35c7tNL5mF_9hg', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(7, 3, 'Mèo', 'Thú cưng', 'Cần bán', 'TP. HCM', 1000000, 'https://cdn.chotot.com/Xlxm5jhmwUZQiuGpcjPitjWBldooAF1MEr_vqcybppg/preset:listing/plain/d8284a40910a6e78c8a91390c2d2d9f6-2691175427931695132.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(8, 3, 'Quần jeans', 'Thời trang', 'Cần bán', 'Hà Nội', 100000, 'https://cdn.chotot.com/CYG8pD0-Kah-sL7L6CtJrVAo3rCtX8z0T3IU92gvoRc/preset:listing/plain/5f9e4f21da1fc579c3843124925aa5ab-2687707342113980384.jpg', NULL, 3, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(9, 3, 'Nhà ở', '	\r\nBất động sản', 'Cần bán', 'Hà Nội', 2000000000, 'https://cdn.chotot.com/CYG8pD0-Kah-sL7L6CtJrVAo3rCtX8z0T3IU92gvoRc/preset:listing/plain/5f9e4f21da1fc579c3843124925aa5ab-2687707342113980384.jpg', NULL, 3, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(10, 5, 'Lexus 570', '	\r\nXe cộ', 'Cần bán', 'Hà Nội', 2000000000, 'https://giaxeoto.vn/admin/upload/images/lexus-lx570-1574300897.JPG', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(11, 5, 'Bàn gỗ', 'Đồ gia dụng, nội thất\r\n', 'Cần bán', 'Quảng Ninh', 2000000, 'https://cdn.chotot.com/qj5deWI83fDo_7v4hM4xx7voRKhSjo1zOpEBxAP1PzE/preset:listing/plain/d993bffbf209d99b4a167dbf8ecde852-2691175343017225854.jpg', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(12, 3, 'Phòng trọ', 'Bất động sản', 'Cần bán', 'Hà Nội', 2000000, 'https://cdn.chotot.com/senF5CnPaxFsoO74W3dUsu8lleBVKvJQA5VfiqwADOg/preset:listing/plain/70b24a81ae57878d288bcdb2194503c4-2665362047171995685.jpg', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(13, 3, 'Gà tre', 'Thú cưng', 'Cần bán', 'Hà Nội', 2000000, 'https://cdn.chotot.com/senF5CnPaxFsoO74W3dUsu8lleBVKvJQA5VfiqwADOg/preset:listing/plain/70b24a81ae57878d288bcdb2194503c4-2665362047171995685.jpg', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(14, 3, 'Bút nước', 'Đồ dùng văn phòng', 'Cần bán', 'Hà Nội', 20000, 'https://cdn.chotot.com/UL9z2TWO6qHZbetst9mU99M1go9p_-yDMVS7lOUbYtw/preset:listing/plain/2a619b5e737314f5ee1bd3d7399fd76c-2691175593158476583.jpg', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(15, 3, 'Tay cầm ps4', 'Giải trí, thể thao', 'Cần bán', 'Hà Nội', 5000000, 'https://cdn.chotot.com/iKGpsBswTCtR3cmgJiL5o04KC-7spzXpEDp89zURYPo/preset:listing/plain/c83fb9e91831fa145658e2ad151218bd-2691176457203226389.jpg', NULL, 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(16, 5, 'Đàn Guitar', 'Giải trí, thể thao', 'Cần bán', 'Hà Nội', 5000000, 'https://cdn.chotot.com/OKY0lncdlPw7-Z0-DpKFAQg_KQc5Woz1V_mfLQrXzFk/preset:listing/plain/a4d4bc3f59e18f5eab3c623aceb28275-2691175610500252581.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(17, 3, 'Điều hòa', 'Xe cộ', 'Cần bán', 'Hà Nội', 5000000, 'https://cdn.chotot.com/_gYC4zmIrbAmAldqghafhic76aUy6qHUOVgtljt4qiE/preset:view/plain/eb6fb765439c864ac3b8c516309e1df4-2692122094680649729.jpg', 'Điều hòa DAIKIN 1.5HP INVERTER MODEL BH18T MÁY ZIN 95% THB', 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(18, 5, 'Macbook pro 15 inch', 'Đồ ăn, thực phẩm', 'Cần bán', 'Hà Nội', 35000000, 'https://cdn.chotot.com/9T77IwLf70CrTD5NAbVUi9e87bBM02EeSpe4-yVwhrI/preset:view/plain/1a70c670d7c451625791c1b8037af954-2692123293037298216.jpg', 'Macbook Pro 15in 2019-I9 9th 2.4/ Ram 32/ SSD 512', 2, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(19, 2, 'Mua máy tính cũ, giá dưới 10 triệu', 'Đồ điện tử', 'Cần mua', 'Thái Thụy, Thái Bình', NULL, 'https://cdn.tgdd.vn/Products/Images/44/220173/apple-macbook-air-2020-va%CC%82ntay-220173-600x600.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(20, 2, '     \r\nLaptop Apple MacBook Air 2020 i5 1.1GHz/8GB/256GB (Z0YL)\r\n', 'Đồ điện tử', 'Cần bán', 'Nam Từ Liêm, Hà Nội', 20000000, 'https://cdn.tgdd.vn/Products/Images/44/220173/apple-macbook-air-2020-va%CC%82ntay-220173-600x600.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(23, 1, 'Bàn ghế', 'Đồ gia dụng, nội thất', 'Cần bán', 'Hà Nội', 150000, 'https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(24, 1, 'Bàn ghế', 'Đồ gia dụng, nội thất', 'Cần bán', 'Hà Nội', 150000, 'https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(25, 3, 'Bàn ghế', 'Đồ gia dụng, nội thất', 'Cần bán', 'Hải Dương', 124324, 'https://image.shutterstock.com/image-vector/merchandise-line-icons-signs-set-600w-1371727865.jpg,https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg,https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg,https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg,https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg,https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg,https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg', NULL, 1, '2020-12-10 10:12:52', '2020-12-10 10:12:52'),
(26, 2, 'Điều hòa', 'Xe cộ', 'Cần bán', 'Hà Nội', 5000000, '', NULL, 2, '2020-12-12 00:19:52', '2020-12-10 10:18:24'),
(27, 2, 'Điện thoại', 'Đồ điện tử', 'Cần bán', 'Hà Nội', 50000000, 'https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-x-new-1.jpg,https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-x-new-1.jpg', 'pqthinh', 1, '2020-12-13 00:41:10', '2020-12-13 00:41:10'),
(28, 1, 'Bán bàn ghế', 'Đồ gia dụng, nội thất', 'Cần bán', 'Mễ Trì Hạ, Nam Từ Liêm, Hà Nội', 10000000, 'http://192.168.101.109:3000/data/uploads/image/1607795614215_image-5b6bb335-e4ec-46e8-ae92-ef7c8ba848a2.jpg,http://192.168.101.109:3000/data/uploads/image/1607795614216_IMG_20201122_192619_795.jpg,http://192.168.101.109:3000/data/uploads/image/1607795614216_IMG_20201122_192533_540.jpg,', 'Bàn ghế gỗ , đẹp + xịn\n\nKiểu dáng, mẫu mã đẹp, ', 1, '2020-12-13 01:00:03', '2020-12-13 01:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'pendding',
  `role` varchar(250) COLLATE utf8_unicode_ci DEFAULT 'member',
  `avatar` varchar(250) COLLATE utf8_unicode_ci DEFAULT 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png',
  `follower` int(11) NOT NULL DEFAULT 10,
  `following` int(11) NOT NULL DEFAULT 5,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `mobile`, `password`, `status`, `role`, `avatar`, `follower`, `following`, `create_at`, `update_at`) VALUES
(1, 'Pham Quang', 'pqthinh1@gmail.com', '0123456780', 'pqthinh', 'pendding', 'member', 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png', 10, 5, '2020-12-10 22:49:13', '2020-12-10 22:49:13'),
(2, 'pqthinh', 'pqthinh.uet@gmail.com', '0987615432', 'pqthinh', 'pendding', 'owner', 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png', 10, 5, '2020-12-10 22:49:13', '2020-12-10 22:49:13'),
(3, 'huy doan', 'huydoan@gmail.com', '0368310864', '121226', 'pendding', 'owner', 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png', 10, 5, '2020-12-10 22:49:13', '2020-12-10 22:49:13'),
(5, 'Pham Thinh', 'thinh1@edu.vn', '0998765327', 'thinh', 'pendding', 'seller', 'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png', 10, 5, '2020-12-10 22:49:54', '2020-12-10 22:49:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner_images`
--
ALTER TABLE `banner_images`
  ADD PRIMARY KEY (`id_banner`);

--
-- Indexes for table `danhmuctin`
--
ALTER TABLE `danhmuctin`
  ADD PRIMARY KEY (`tendanhmuc`),
  ADD KEY `tendanhmuc` (`tendanhmuc`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tindaluu`
--
ALTER TABLE `tindaluu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tindang`
--
ALTER TABLE `tindang`
  ADD PRIMARY KEY (`id_tindang`),
  ADD KEY `idnguoiban` (`idnguoiban`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner_images`
--
ALTER TABLE `banner_images`
  MODIFY `id_banner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tindaluu`
--
ALTER TABLE `tindaluu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tindang`
--
ALTER TABLE `tindang`
  MODIFY `id_tindang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
