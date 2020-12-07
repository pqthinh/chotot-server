

CREATE TABLE if not EXISTS `banner_images` (
  `id_banner` int(11) NOT NULL,
  `chucnang` int(1) NOT NULL,
  `link` varchar(250) nULL
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

CREATE TABLE if not EXISTS `danhmuctin` (
  `id` int(11) NOT NULL,
  `tendanhmuc` varchar(40) nULL,
  `description` varchar(250) NULL,
  `image` varchar(250) NULL
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

CREATE TABLE if not EXISTS `hinhanh` (
  `id_anh` int(11) NOT NULL,
  `id_tindang` int(11) NOT NULL,
  `link` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------


--
-- Table structure for table `tindang`
--

CREATE TABLE if not EXISTS `tindang` (
  `id_tindang` int(11) NOT NULL,
  `loaitin` varchar(50)  DEFAULT NULL,
  `idnguoiban` int(11) DEFAULT NULL,
  `ten` varchar(250)  DEFAULT NULL,
  `tendanhmuc` varchar(40)  NOT NULL,
  `diadiem` varchar(250)  NOT NULL,
  `describe` varchar(300)  DEFAULT NULL,
  `trangthai` int(1) DEFAULT '1',
  `ngaydangtin` datetime DEFAULT CURRENT_TIMESTAMP,
  `anh` varchar(250)  DEFAULT 'https://image.shutterstock.com/image-vector/merchandise-line-icons-signs-set-600w-1371727865.jpg',
  `giaban` int(12) DEFAULT NULL,
  `ngaycapnhat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `tindang`
--

INSERT INTO `tindang` (`id_tindang`, `loaitin`, `idnguoiban`, `ten`, `tendanhmuc`, `diadiem`, `describe`, `trangthai`, `anh`, `giaban`) VALUES
(1, 'Cần bán', 1, 'Bàn ghế', 'Đồ gia dụng, nội thất', 'Hải', NULL, 1, 'https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg', 124324),
(2, 'Cần bán', 1, 'Nhà biệt thự', 'Bất động sản', 'Hà Nội', NULL, 2, 'https://huytrandesign.vn/upload_images/images/2019/04/18/thiet-ke-nha-dep-thiet-ke-biet-thu-ninh-hiep-anh-luc-1.jpg', 2000000000),
(3, 'Cần bán', 2, 'Điện thoại', '	\r\nĐồ điện tử', 'Thái Bình', NULL, 3, 'https://cdn.tgdd.vn/Files/2020/05/12/1254989/iphone-12-eap_800x450.jpg', 9000000),
(4, 'Cần bán', 3, 'Điện thoại cũ', '	\r\nĐồ điện tử', 'Thái Bình', NULL, 1, 'https://cdn.tgdd.vn/Files/2020/05/12/1254989/iphone-12-eap_800x450.jpg', 4000000),
(5, 'Cần bán', 2, 'Thú cưng', 'Thú cưng', 'Hà Nội', NULL, 2, 'https://cms.luatvietnam.vn/uploaded/Images/Original/2019/01/17/nuoi-cho-meo_1701125148.png', 5000000),
(6, 'Cần bán', 4, 'Iphone 12', '	\r\nĐồ điện tử', 'Hà Nội', NULL, 2, 'https://i1-sohoa.vnecdn.net/2020/10/26/iPhone-12-Pro-VnExpress-03079-8809-3623-1603700356.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=Mi-s2IDK35c7tNL5mF_9hg', 25000000),
(7, 'Cần bán', 3, 'Mèo', 'Thú cưng', 'TP. HCM', NULL, 1, 'https://cdn.chotot.com/Xlxm5jhmwUZQiuGpcjPitjWBldooAF1MEr_vqcybppg/preset:listing/plain/d8284a40910a6e78c8a91390c2d2d9f6-2691175427931695132.jpg', 1000000),
(8, 'Cần bán', 3, 'Quần jeans', 'Thời trang', 'Hà Nội', NULL, 3, 'https://cdn.chotot.com/CYG8pD0-Kah-sL7L6CtJrVAo3rCtX8z0T3IU92gvoRc/preset:listing/plain/5f9e4f21da1fc579c3843124925aa5ab-2687707342113980384.jpg', 100000),
(9, 'Cần bán', 3, 'Nhà ở', '	\r\nBất động sản', 'Hà Nội', NULL, 3, 'https://cdn.chotot.com/CYG8pD0-Kah-sL7L6CtJrVAo3rCtX8z0T3IU92gvoRc/preset:listing/plain/5f9e4f21da1fc579c3843124925aa5ab-2687707342113980384.jpg', 2000000000),
(10, 'Cần bán', 5, 'Lexus 570', '	\r\nXe cộ', 'Hà Nội', NULL, 2, 'https://giaxeoto.vn/admin/upload/images/lexus-lx570-1574300897.JPG', 2000000000),
(11, 'Cần bán', 5, 'Bàn gỗ', 'Đồ gia dụng, nội thất\r\n', 'Quảng Ninh', NULL, 2, 'https://cdn.chotot.com/qj5deWI83fDo_7v4hM4xx7voRKhSjo1zOpEBxAP1PzE/preset:listing/plain/d993bffbf209d99b4a167dbf8ecde852-2691175343017225854.jpg', 2000000),
(12, 'Cần bán', 3, 'Phòng trọ', 'Bất động sản', 'Hà Nội', NULL, 2, 'https://cdn.chotot.com/senF5CnPaxFsoO74W3dUsu8lleBVKvJQA5VfiqwADOg/preset:listing/plain/70b24a81ae57878d288bcdb2194503c4-2665362047171995685.jpg', 2000000),
(13, 'Cần bán', 3, 'Gà tre', 'Thú cưng', 'Hà Nội', NULL, 2, 'https://cdn.chotot.com/senF5CnPaxFsoO74W3dUsu8lleBVKvJQA5VfiqwADOg/preset:listing/plain/70b24a81ae57878d288bcdb2194503c4-2665362047171995685.jpg', 2000000),
(14, 'Cần bán', 3, 'Bút nước', 'Đồ dùng văn phòng', 'Hà Nội', NULL, 2, 'https://cdn.chotot.com/UL9z2TWO6qHZbetst9mU99M1go9p_-yDMVS7lOUbYtw/preset:listing/plain/2a619b5e737314f5ee1bd3d7399fd76c-2691175593158476583.jpg', 20000),
(15, 'Cần bán', 3, 'Tay cầm ps4', 'Giải trí, thể thao', 'Hà Nội', NULL, 2, 'https://cdn.chotot.com/iKGpsBswTCtR3cmgJiL5o04KC-7spzXpEDp89zURYPo/preset:listing/plain/c83fb9e91831fa145658e2ad151218bd-2691176457203226389.jpg', 5000000),
(16, 'Cần bán', 5, 'Đàn Guitar', 'Giải trí, thể thao', 'Hà Nội', NULL, 1, 'https://cdn.chotot.com/OKY0lncdlPw7-Z0-DpKFAQg_KQc5Woz1V_mfLQrXzFk/preset:listing/plain/a4d4bc3f59e18f5eab3c623aceb28275-2691175610500252581.jpg', 5000000),
(17, 'Cần bán', 3, 'Điều hòa', 'Xe cộ', 'Hà Nội', 'Điều hòa DAIKIN 1.5HP INVERTER MODEL BH18T MÁY ZIN 95% THB', 2, 'https://cdn.chotot.com/_gYC4zmIrbAmAldqghafhic76aUy6qHUOVgtljt4qiE/preset:view/plain/eb6fb765439c864ac3b8c516309e1df4-2692122094680649729.jpg', 5000000),
(18, 'Cần bán', 5, 'Macbook pro 15 inch', 'Đồ ăn, thực phẩm', 'Hà Nội', 'Macbook Pro 15in 2019-I9 9th 2.4/ Ram 32/ SSD 512', 2, 'https://cdn.chotot.com/9T77IwLf70CrTD5NAbVUi9e87bBM02EeSpe4-yVwhrI/preset:view/plain/1a70c670d7c451625791c1b8037af954-2692123293037298216.jpg', 35000000),
(19, 'Cần mua', 2, 'Mua máy tính cũ, giá dưới 10 triệu', 'Đồ điện tử', 'Thái Thụy, Thái Bình', NULL, 1, 'https://cdn.tgdd.vn/Products/Images/44/220173/apple-macbook-air-2020-va%CC%82ntay-220173-600x600.jpg', NULL),
(20, 'Cần bán', 2, '     \r\nLaptop Apple MacBook Air 2020 i5 1.1GHz/8GB/256GB (Z0YL)\r\n', 'Đồ điện tử', 'Nam Từ Liêm, Hà Nội', NULL, 1, 'https://cdn.tgdd.vn/Products/Images/44/220173/apple-macbook-air-2020-va%CC%82ntay-220173-600x600.jpg', 20000000),
(23, 'Cần bán', 1, 'Bàn ghế', 'Đồ gia dụng, nội thất', 'Hà Nội', NULL, 1, 'https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg', 150000),
(24, 'Cần bán', 1, 'Bàn ghế', 'Đồ gia dụng, nội thất', 'Hà Nội', NULL, 1, 'https://rongba.vn/wp-content/uploads/2019/01/quy-trinh-lam-ban-ghe-go-huong-nam-phi.jpg', 150000),
(25, 'Cần bán', 4, 'Bàn ghế', 'Đồ gia dụng, nội thất', 'Hải Dương', NULL, 1, 'https://image.shutterstock.com/image-vector/merchandise-line-icons-signs-set-600w-1371727865.jpg', 124324);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE  TABLE if not EXISTS `user` (
  `id` int(100) NOT NULL,
  `name` varchar(50) nULL,
  `email` varchar(50) nULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pendding',
  `role` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'member',
  `creat_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `mobile`, `password`, `status`, `role`) VALUES
(1, 'Pham Quang', 'pqthinh1@gmail.com', '0123456780', 'encoding', 'pendding', 'member'),
(2, 'pqthinh', 'pqthinh.uet@gmail.com', '0987615432', 'owner', 'pendding', 'onwer');

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
-- Indexes for table `nguoiban`
--
ALTER TABLE `nguoiban`
  ADD PRIMARY KEY (`idnguoiban`);

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
  MODIFY `id_banner` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tindang`
--
ALTER TABLE `tindang`
  MODIFY `id_tindang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nguoiban`
--

