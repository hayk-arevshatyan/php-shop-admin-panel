-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 14 2025 г., 00:46
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `registration`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `category_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'Shoes'),
(2, 'Cloth'),
(3, 'Attribute');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `mail` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `additional_info` varchar(300) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `mail`, `phone`, `address`, `additional_info`) VALUES
(6, 'hayk arevshatyan', 'haykarevshatyan64@gmail.com', '098 815510', 'AM, Yerevan, baghramyan 10', 'delivery'),
(7, 'arsen arevshatyan', 'arsenarevshatyan@gmail.com', '077 511128', 'AM, Yerevan, baghramyan 10', 'delivery'),
(8, 'hgfhgfjgfjhfhj', 'hgfhgfhjfhjf@hgfhjf.jgfh', '654 654654', 'AM, Yerevan, jhhgfjfhjfjh', 'hgfhjfhfhg'),
(9, 'ghfhjfhjfhf', 'hgfjh@hgfhj.hgf', '987 987987', 'AM, Yerevan, hhgfjhffjghfj', 'gjgjhgjhgjhgjhgj'),
(10, 'hhjbjhbjhbjbjhb', 'jhbjbjhb@hjbj.vh', '979 879798', 'AM, Yerevan, ytyutituiytuy', 'iutytitutuituyt'),
(11, 'jhgjgjgfjhf', 'ghfhjfghfhj@hgfh.hjfg', '876 868868', 'AM, Yerevan, hgfhgfhgfhgfhgffh', 'jhgjhgjhgjgjgjhjg'),
(12, 'hgfhgfghfhgf', 'hgfhgffh@hfhf.hg', '654 654654', 'AM, Yerevan, hgfhgfghdfg', 'fgdgfdghdfg'),
(13, 'yryuryuryury', 'ytrytryryr@ytry.hgf', '987 987987', 'CH, Aadorf, uytutuytuytuytu', 'uytuytuytuytuytu'),
(14, 'gfgfgf', 'asdasd.asdasd@sdf.hj', '123 123123', 'AM, Agarak, .ghg', '&quot; AND id &lt; 1 &quot;'),
(15, 'oiuoiuouoiuoiu', 'oiuouo@oioiuioiu.oiu', '989 898798', 'AM, Yerevan, ioiyiuyiuyuiyiiuyoyoiyiouyi', 'oiuouoiuououououiuouou'),
(16, 'poipoipoipoi', 'poipoipoipoi@rew.uy', '987 987987', 'AM, Yerevan, uytytiytiutiytutyu', 'uytuiuyiutiyutiutiutuyututiutiututuyutyt'),
(17, 'uuyetuytuer', 'kjhsjsjgj@jjgjh.hf', '987 987987', 'AM, Yerevan, ututyutuytutututuytu', ''),
(18, 'poipoipoipoipoi', 'nbbcbvcbvcbvcb@gfh.hh', '987 987987', 'AM, Yerevan, uytuytutuytuytuytuyt', 'uytututuytutuytuytuy');

-- --------------------------------------------------------

--
-- Структура таблицы `guest_order`
--

CREATE TABLE `guest_order` (
  `order_id` int NOT NULL,
  `customer_mail` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `guest_order`
--

INSERT INTO `guest_order` (`order_id`, `customer_mail`, `product_id`, `quantity`, `subtotal`, `created_at`) VALUES
(22, 'haykarevshatyan64@gmail.com', 51, 21, 2100, '2024-11-18 14:06:28'),
(23, 'haykarevshatyan64@gmail.com', 52, 4, 600, '2024-11-18 14:06:28'),
(24, 'haykarevshatyan64@gmail.com', 53, 4, 280, '2024-11-18 14:06:28'),
(25, 'arsenarevshatyan@gmail.com', 51, 9, 900, '2024-11-18 14:14:43'),
(26, 'arsenarevshatyan@gmail.com', 52, 5, 750, '2024-11-18 14:14:43'),
(27, 'arsenarevshatyan@gmail.com', 53, 4, 280, '2024-11-18 14:14:43'),
(28, 'hgfhgfhjfhjf@hgfhjf.jgfh', 53, 1, 70, '2024-11-18 14:27:22'),
(29, 'hgfjh@hgfhj.hgf', 51, 1, 100, '2024-11-18 14:30:59'),
(30, 'hgfjh@hgfhj.hgf', 52, 1, 150, '2024-11-18 14:30:59'),
(31, 'hgfjh@hgfhj.hgf', 53, 1, 70, '2024-11-18 14:30:59'),
(32, 'jhbjbjhb@hjbj.vh', 51, 10, 1000, '2024-11-18 14:32:21'),
(33, 'ghfhjfghfhj@hgfh.hjfg', 53, 5, 350, '2024-11-18 14:38:50'),
(34, 'hgfhgffh@hfhf.hg', 60, 1, 120, '2024-11-18 14:41:51'),
(35, 'ytrytryryr@ytry.hgf', 61, 7, 1190, '2024-11-18 18:00:28'),
(36, 'asdasd.asdasd@sdf.hj', 51, 6, 600, '2024-11-19 12:48:04'),
(37, 'oiuouo@oioiuioiu.oiu', 51, 2, 200, '2024-11-20 12:53:34'),
(38, 'oiuouo@oioiuioiu.oiu', 52, 2, 300, '2024-11-20 12:53:34'),
(39, 'oiuouo@oioiuioiu.oiu', 53, 2, 140, '2024-11-20 12:53:34'),
(40, 'poipoipoipoi@rew.uy', 51, 1, 100, '2024-11-20 13:33:26'),
(41, 'poipoipoipoi@rew.uy', 52, 1, 150, '2024-11-20 13:33:26'),
(42, 'poipoipoipoi@rew.uy', 53, 1, 70, '2024-11-20 13:33:26'),
(43, 'kjhsjsjgj@jjgjh.hf', 51, 1, 100, '2024-11-20 13:43:39'),
(44, 'kjhsjsjgj@jjgjh.hf', 52, 1, 150, '2024-11-20 13:43:39'),
(45, 'kjhsjsjgj@jjgjh.hf', 53, 1, 70, '2024-11-20 13:43:39'),
(46, 'nbbcbvcbvcbvcb@gfh.hh', 53, 1, 70, '2024-11-20 13:46:48'),
(47, 'nbbcbvcbvcbvcb@gfh.hh', 57, 1, 140, '2024-11-20 13:46:48');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_category` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product_img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product_quantity` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `product_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`product_id`, `product_category`, `product_img`, `product_name`, `product_price`, `product_quantity`, `product_description`, `added_at`) VALUES
(51, 'Cloth', '../images/adidas_shoes.jpg', 'tyryurtry', '100', '831', 'erdtfghvbvgcdfghf', '2024-10-23 16:47:22'),
(52, 'Shoes', '../images/adidas_shoes.jpg', 'gfdgfdgfdgd', '150', '80', 'dgfhdghgkjdfdhghfdgddfghfdg', '2024-10-24 12:14:05'),
(53, 'Shoes', '../images/nike_cloth.jpg', 'hgfgjdgdhdfjghg', '70', '678', '11hg12f1gh1jjjj12hfjd13gh23j13', '2024-10-24 15:33:05'),
(56, 'Shoes', '../images/adidas_shoes.jpg', 'fffffffffffff', '200', '200', '51345342', '2024-10-25 13:42:39'),
(57, 'Shoes', '../images/adidas_shoes.jpg', 'ghfjgfj', '140', '699', 'ghfhgfhgfjfhg', '2024-10-25 19:41:01'),
(58, 'Shoes', '../images/adidas_shoes.jpg', 'dfgh', '50', '500', 'jhdfgshjkglhdfj', '2024-10-28 11:11:17'),
(60, 'Shoes', '../images/nike_cloth.jpg', 'sfdgjgfgfjhf', '120', '999', 'fjhfhgfhfhjfhgdfjdfgdgdjdkh', '2024-10-28 13:14:18'),
(61, 'Cloth', '../images/akar-icons--pencil.png', 'test', '170', '20', 'sdfsdf', '2024-10-29 12:30:23');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'female' COMMENT 'Male, Female',
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `mail`, `phone`, `gender`, `password`, `token`, `status`, `created_at`) VALUES
(1, 'ffffffffff', 'ffffffffff', 'fffffff@ggg.hgfhf', '(333)-333-333', 'Female', '$2y$10$tpqAzZOpujw4kn2HjV/Cv.T4L.X6zdxLODGFCtnT885D8t4YUXH5i', 'ee4ba6cbaa979893e7577ace65a2ec7f', '0', '2024-10-01 17:33:44'),
(2, 'hgfhgfhg', 'hgfhghgfhg', 'jhgfjhfh@hgfhf.hgfg', '(555)-555-555', 'Female', '$2y$10$my1Czsn1tt14/aGM/KI92.V5IDeM.7luc56cSITLtVdy/kbuHinJ6', NULL, '1', '2024-10-01 18:29:37'),
(3, 'fffffffff', 'fffffffff', 'fffyfcgfc@jhfj.hgchg', '(555)-555-555', 'Female', '$2y$10$iMVt8XU59vFaPiZkAPWzu.X55u2DGrPeSLNCRD2Mej8ROkISrmqV.', NULL, '1', '2024-10-01 18:35:51'),
(4, 'hayk', 'arevshatyan', 'haykarevshatyan@mail.ru', '(098)-815-510', 'Female', '$2y$10$wpCx3wd.fCEG1/j/SD4bLuvvAFdPphpGtKiBdMggJtIstoUHQUMZi', '467a5fa6f4479bc29f566936ca8b8c7c', '0', '2024-10-03 12:51:43'),
(5, 'hayk', 'arevshatyan', 'haykarevshatyan@gmail.ru', '(098)-815-510', 'Female', '$2y$10$bWvt0YcXYL2xI/eyXSCFOuMxN0g59l3K1AfDsgm/mGSdSF0IJZuF6', NULL, '1', '2024-10-03 16:31:31'),
(6, 'jhgjhgjhg', 'jhgjhgjhg', 'jhgjhgjhgjjh@jhgghfh.jfkj', '(555)-555-555', 'Female', '$2y$10$SiDwrit7yWl5FfbF2/8HRuQHTVJjDyyz9yl6zndp7Q1nEPTrbh.E2', NULL, '1', '2024-10-05 15:49:32'),
(7, 'tatevik', 'vardanyan', 'vardanyan@mail.ru', '098 098098', 'Female', '$2y$10$F/L11gMCSnEqSrIb4FOaPO94hHqxjQkYPd.1zSafS1DlHI5HWtsOG', 'bf78736891ce3f5694f11fe7460bbe97', '0', '2024-10-07 12:03:26'),
(8, 'tatevik', 'vardanyan', 'vardanyan@gmail.ru', '077 731353', 'Female', '$2y$10$kV9bPVu5UQcQnVAAU/opQu0v/mruq/hpIdUz5cxyymsrkzoZsJrDi', NULL, '1', '2024-10-07 12:07:35'),
(9, 'yutuytuyt', 'jhghgjgjg', 'jhgjhgjg@jhbv.gfdh', '555 555555', 'Male', '$2y$10$iAESqvXBxA/WD5HIYY6hieIpmiagi/lcly2KaicnZnk5MWIYUvZNK', NULL, '1', '2024-10-07 12:17:55'),
(10, 'tttttttt', 'tttttttt', 'ffffffff@ffff.ff', '999 999999', 'Female', '$2y$10$ETNelH22SRc/GLFSDyDbxeeUDPxen6XLXECAWwOENHlw48gYaiiYK', NULL, '1', '2024-10-07 17:51:16'),
(11, 'ghfhgfhgf', 'fdhdhg', 'gfjhfgfd@gfc.jh', '444 444444', 'Female', '$2y$10$pr5Q4GNsGz5PYAIXFSm5H.pxK8k5JLfRVIuedCOltSAQnqfamZWoq', '428f36f2daa9eecaf08935170459f31d', '0', '2024-10-08 15:24:09'),
(12, 'hgfhgfhgf', 'hfhghgfg', 'hjgff@jhgh.jhfg', '444 444444', 'Female', '$2y$10$.pnkbCyALFX4aPwZ0ru2HuLnWThwR8FLCwc28i/E6EkoZfJItKnN.', '3456dac75a328900877a5f0056b60d3a', '0', '2024-10-08 15:56:37'),
(13, 'hgfhgfhf', 'hfghfhgf', 'hgfhgfhf@hgfhgf.jgfh', '444 444444', 'Male', '$2y$10$FN5BY7i4HVoFM8aJcrthm.d2iPtKm2P8w/7CYe0KLJxDOHJCLd4Xy', '0f4126ee2f4e4e7ca01d224348db3c1d', '0', '2024-10-08 16:01:20'),
(14, 'hgfhgfhgfh', 'hgfhfhfhf', 'hgfhgfhgf@hgfhgf.jfhv', '444 444444', 'Male', '$2y$10$gohiU03YXrBlm4RT6us7uOYi1UCZp.DsjWwNu7Kv9unqGEtR6/xxG', 'bfbd441efdb86c31ed770cbbd840dd79', '0', '2024-10-08 16:03:40'),
(15, 'fgjhfhf', 'ghfhgfhgj', 'yghhdfc@hgc.gh', '444 444444', 'Male', '$2y$10$cjBhfvWwFznxbH2eqJNS3.L8DxYerlZ6HqvEw2WGGf9y7AbyAoobm', 'fd3d43ebb6c40456e5dcb6196c31ce81', '0', '2024-10-08 17:38:08'),
(16, 'xrtfchvjb', 'xdfghjgvhjb', 'fxcgbjk@ghjk.yut', '444 444444', '1', '$2y$10$c6nll3611/WSMQEeK6Yc.upYKPYEtscdnAVnpqZQmgM3L0bmNKKeG', '4004312debe44d29235974b1f93419e2', '0', '2024-10-09 16:48:31'),
(17, 'dxfcgj', 'gcfbhj', 'fgchvbj@hvjbk.gfcvhbj', '555 555555', '1', '$2y$10$2F3mPcrzHSUAgMLjnJNfZutcfMDicVg9LOs77qU59OzzyvNsKrveG', '9fc0fdb59b41fb77c25517a49eddd0c9', '0', '2024-10-09 18:11:57'),
(18, 'hayk', 'arevshatyan', 'haykevshat@gmail.com', '098 815510', '1', '$2y$10$LgggZzcDfr8.5LkMyBaxTeRIaGeddOTgzD5vfkt2Mfsz57AVNBCOy', '71e42c622bd25dcd5fdc5876d4110fd0', '0', '2024-10-10 12:00:52'),
(19, 'hayk', 'arevshatyan', 'atyan64@gmail.com', '098 815510', '1', '$2y$10$Mn8f77.RiU0XQte2dBjPMuReAO32oeBsxDKK8Frr7ttEBBdxL7KAG', '2f034e04b18d5e9f822d424bc2d68688', '0', '2024-10-10 12:06:47'),
(20, 'dfghjk', 'fdxcgh', 'an64@gmail.com', '456 754567', '1', '$2y$10$nq/C5W.knDJg5Q5RIfx05us9vE7k7SSeCnssYJV/RoQhE17E2E5Ae', 'b271959ac5b72f8e48dfb6931cc2bb2b', '0', '2024-10-10 16:14:08'),
(21, 'dfghjk', 'fdxcgh', 'hayka@gmail.com', '456 754567', '1', '$2y$10$ZEQvVTuVMX8G8sNB5O1Eue5LpL2YTzemadbZNVIWqw81ftRcKzGle', '1c854d5dd2c7e58a7b5794410fa18789', '0', '2024-10-10 16:15:34'),
(22, 'dfghjk', 'fdxcgh', 'haykar6tyan64@gmail.com', '456 754567', '1', '$2y$10$484/8MXqB1dWMBGss/LLfuOJTe3sYo.IyUJy5Z5PvVIWs4Xd6pdPi', 'e3e448238648e538ad575c7368fbbeb7', '0', '2024-10-10 16:16:40'),
(23, 'gfhgffhhffh', 'ghfhfhgfhfgfhgf', 'haykarevshatyan6664@gmail.com', '098 815510', '1', '$2y$10$xGPjK7yoGsCB5pqKXnbj0eTK07H46lkXXIvkoIrkJPhjhv5GO32Gm', '8da113e2d52a4a2a2788dd019a8e71df', '0', '2024-10-10 16:18:44'),
(24, 'gfhgffhhffh', 'ghfhfhgfhfgfhgf', 'haykarevshaty66an64@gmail.com', '098 815510', '1', '$2y$10$S5EKDxMPRZW829rk6d1EiO.oe2ee3VujomcHqGkc8sE9DoOMqCX/m', '695c783e628b36d12023fd409a223d62', '0', '2024-10-10 16:20:28'),
(25, 'gfhgffhhffh', 'ghfhfhgfhfgfhgf', 'hayk5arevshatyan64@gmail.com', '098 815510', '1', '$2y$10$JJRu/ijtBzpwndShqS3kR.4r8gwzfQfhT5DBT/qUD7LheiF92NXcy', '6db4043c6d79d2f5f8af61bedc390a7c', '0', '2024-10-10 16:23:38'),
(26, 'fghjkl', 'dxfcgvbhn', 'haykarevsha6tyan64@gmail.com', '098 815510', '1', '$2y$10$UKEZuVYESchFhYOI3gS8Fe/JExgfN7eNv.2knjhrRJmQD.fH57WAm', 'fd8ea38ecbad6fb02a02bfa19114590f', '0', '2024-10-10 16:44:02'),
(27, 'fghjkl', 'dxfcgvbhn', 'haykarevshatyan4@gmail.com', '098 815510', '1', '$2y$10$QiL4CL5ZgeXtBPQtDTMXGeze3.WelgPS/VTJl6NMWdgLgiT3XiDZu', 'ef77afb82748346698050b4e8d1e3dcf', '0', '2024-10-10 16:45:18'),
(28, 'fghjkl', 'dxfcgvbhn', 'haykavshatn64@gmail.com', '098 815510', '1', '$2y$10$uVKwCgiNOjVB1NAEObZW4eblrQZoLU3eX4URNLzvBH5TA1aPNay5a', '2a7720b4679c4e8d834d3d11ee1f77a4', '0', '2024-10-10 16:49:01'),
(29, 'fghjkl', 'dxfcgvbhn', 'haykarevshatyan64@il.com', '098 815510', '1', '$2y$10$1FkX01SiGUZZPSAIOhxcpu34qDPUGJb0LAXQv7kwU8FUMVw1ToNp2', '4e3732475dd358b086976e258350f77a', '0', '2024-10-10 16:51:30'),
(30, 'hayk', 'arevshatyan', 'haykarevshatyahhhhn64@gmail.com', '098 815510', '1', '$2y$10$xRSTMZvVhGERQ1cY8dd24etAxF8VSt4lH9P6L.s.mal01vpiriYwq', 'ac92c04fbce9cfa6a997d0d08dc74c0f', '0', '2024-10-10 16:53:52'),
(31, 'hayk', 'arevshatyan', 'haykayan64@gmail.com', '098 815510', '1', '$2y$10$Eh0KB9KIGXQkylOVax459OB4SlElKviz7ohM5SUI6b2i6G3g2evTq', 'dd961d80ac7ae339215dc85f300e7f51', '0', '2024-10-10 16:54:48'),
(32, 'hayk', 'arevshatyan', 'haykarevshat64@gmail.com', '098 815510', '1', '$2y$10$Mruy9PzGyAh0qbSLxIRP6ef3CXzqHzk20ASl2DYqQsP97MWm9i.Am', 'e01e0377b4c43e049d479123d1c04a25', '0', '2024-10-10 16:57:10'),
(33, 'hayk', 'Arevshatyan', 'haykarevshat@gmail.com', '098 815510', '1', '$2y$10$HMXF4YZ4BVUR0sHM2PkS8O/Qs9CFTs2yh8r8VGLMDDLm0jEV63EUm', '344608b5850265ed4f5ecbf180c1b8e7', '0', '2024-10-10 17:14:24'),
(34, 'hayk', 'Arevshatyan', 'haykarevs4@gmail.com', '098 815510', '1', '$2y$10$oig.ZJ.T83.Ic.baFyPiRujtb2eKJ2bYIe8T3AJ14bQTZ5VOPMPf2', 'fa481496419fd03694ac0234f32008b9', '0', '2024-10-10 17:19:57'),
(35, 'hayk', 'Arevshatyan', 'hayshatyan64@gmail.com', '098 815510', '1', '$2y$10$1B/91lo8vSZ.JPet7lHyxOoVlT.TWWiPuzrRCMyfM38RhVkdKX9b.', NULL, '1', '2024-10-10 17:24:28'),
(36, 'Hayk', 'Arevshatyan', 'yan64@gmail.com', '098 815510', '1', '$2y$10$9R.kL44YC.ZXCQbMg.eZoeX4ZgucxtqW5zKScMVcFRw.5n72vhPLS', NULL, '0', '2024-10-10 18:32:20'),
(37, 'Tatevik', 'Vardanyan', 'tatevikvardanyan05@gmail.com', '077 731353', '0', '$2y$10$zg2qTMzeCyO6WTF/LTwKgO.iHmi2JgRnlc.cGh3.n/kFNsmDpGUwK', '645d56d43804b1b3b1b8f61dc5391efc', '0', '2024-10-10 18:36:38'),
(38, 'hgfhggh', 'gkhhhg', 'vshatyan64@gmail.com', '987 987987', '1', '$2y$10$JUlJW30Vsl6K9MkbkYC0quIewzYBkJW4VmqPBcoeFgeG6/J2NB2c6', 'ccccd76a4bb2fed3a57165e21f88529e', '0', '2024-10-10 22:01:07'),
(39, 'hgfhggh', 'gkhhhg', 'hayatyan64@gmail.com', '987 987987', '1', '$2y$10$I4cw4e72FqjMiTeCGsEWhuyN8eBQgH93L3F9pYD5IhUW2n8ytVBg6', 'f6562e08a871f48de7b11a1256e831ac', '0', '2024-10-10 22:03:30'),
(40, 'hgfhggh', 'gkhhhg', 'haykarevshatyjhvhvnan64@gmail.com', '987 987987', '1', '$2y$10$B6TzQ2l.h58e53vZknE22udXEAJ5s730zBBiWIwv1YX3C4o72xHwC', NULL, '0', '2024-10-10 22:09:10'),
(41, 'hayk', 'arevshatyan', 'haykayan64@gmail.com', '098 815510', '1', '$2y$10$yIxfcLRaxGH5IuuKlKkunO9L8gObn8U60xMAk4k/SKpjTREVCLi0K', '96db38ea2d7adcc429da4ba521e80bca', '0', '2024-10-11 00:55:26'),
(42, 'Hayk', 'Arevshatyan', 'haykarevshatyan64@gmail.com', '098 815510', '1', '$2y$10$4XGIT8W68NdPcRqj.3J0Rux7.uoZfqixAdrtfS.8CwaFh3J2Kjr2.', NULL, '1', '2024-10-11 17:08:26'),
(43, 'Vahan', 'Pokhosyan', 'aaa@aaa..aa', '545 456400', '1', '$2y$10$53fC8Dzf2po9vPcbRPVzQeNrgrNHpbssqbTjAja2gh.pcPbMjRNLK', 'c598be97c5efe37c8e25c4655919261d', '0', '2024-10-29 12:27:23'),
(44, 'Vahan', 'Pokhosyan', 'aaa@aaa.aa', '545 456400', '1', '$2y$10$1gFQDQ.dvIApwS0HeTCz9eZ6upCafVZp1c4.n.IR9l5gtxX0Oc6JW', '2c87e1996c57a134a1c0597fde9d9bc9', '0', '2024-10-29 12:27:31'),
(45, 'Vahan', 'Pokhosyan', 'alviniaplum@livinitlarge.net', '545 456400', '1', '$2y$10$8vepPJe72RlCh/nulibNqO.5euQ6P6d8HDxdvLHnxaE3z8GPx1Vvu', NULL, '1', '2024-10-29 12:29:20'),
(46, 'Arsen', 'Arevshatyan', 'arsenarevshatyan2302@gmail.com', '077 511128', '1', '$2y$10$yIT2oCN1L8ZJpDllvjaESuXUHTqOZ80pkPyn4VrNDmnBjR6QZu5kq', 'ef82ecc7305f0f7883252f34b549d0d2', '0', '2024-11-17 23:21:16'),
(47, 'gdgdgfdgfdgf', 'poipoipoi', 'hdhdf@rgfh.jhfhg', '987 989897', '0', '$2y$10$NgzomOWQ6/V7Bnnk2iZuduP4ISESCCtQV9uqzBGvGEfksebL.zsd2', 'a10226191796022d159e7ce83576591b', '0', '2024-11-21 15:47:12'),
(48, 'ani', 'hovsepyan', 'anihovsepyan004@mail.ru', '987 987987', '0', '$2y$10$NsZarR2Iy9PFZhIoY6j7GOvrod4DNYYydAlQ15xOfKiQWoKVKs3pa', '77418e8bfd51e49ddb06b5fd66f4b8ef', '0', '2024-11-28 11:36:37');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `guest_order`
--
ALTER TABLE `guest_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `guest_order`
--
ALTER TABLE `guest_order`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
