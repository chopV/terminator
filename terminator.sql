-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Час створення: Трв 15 2017 р., 17:17
-- Версія сервера: 10.1.13-MariaDB
-- Версія PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `terminator`
--

-- --------------------------------------------------------

--
-- Структура таблиці `corral`
--

CREATE TABLE `corral` (
  `id` int(3) NOT NULL COMMENT 'Код',
  `caption` varchar(24) NOT NULL COMMENT 'Наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица загонов';

--
-- Дамп даних таблиці `corral`
--

INSERT INTO `corral` (`id`, `caption`) VALUES
(1, 'Загон 1'),
(2, 'Загон 2'),
(3, 'Загон 3'),
(4, 'Загон 4');

-- --------------------------------------------------------

--
-- Структура таблиці `day`
--

CREATE TABLE `day` (
  `id` int(3) NOT NULL COMMENT 'Код',
  `caption` varchar(9) NOT NULL COMMENT 'Наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблицы дней';

--
-- Дамп даних таблиці `day`
--

INSERT INTO `day` (`id`, `caption`) VALUES
(1, 'День 1');

-- --------------------------------------------------------

--
-- Структура таблиці `herd`
--

CREATE TABLE `herd` (
  `id` int(3) NOT NULL COMMENT 'Код',
  `id_corral` int(3) NOT NULL COMMENT 'Код стада',
  `id_sheep` int(3) NOT NULL COMMENT 'Код овцы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Овцы в загонах';

--
-- Дамп даних таблиці `herd`
--

INSERT INTO `herd` (`id`, `id_corral`, `id_sheep`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 2, 5),
(6, 3, 6),
(7, 1, 7),
(8, 3, 8),
(9, 3, 9),
(10, 4, 10);

-- --------------------------------------------------------

--
-- Структура таблиці `history`
--

CREATE TABLE `history` (
  `id` int(3) NOT NULL COMMENT 'Код',
  `id_day` int(3) NOT NULL COMMENT 'Код дня',
  `id_corral` int(3) NOT NULL COMMENT 'Код стада',
  `id_sheep` int(3) NOT NULL COMMENT 'Код овцы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='История';

--
-- Дамп даних таблиці `history`
--

INSERT INTO `history` (`id`, `id_day`, `id_corral`, `id_sheep`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 2, 5),
(6, 1, 3, 6),
(7, 1, 1, 7),
(8, 1, 3, 8),
(9, 1, 3, 9),
(10, 1, 4, 10);

-- --------------------------------------------------------

--
-- Структура таблиці `report`
--

CREATE TABLE `report` (
  `id` int(3) NOT NULL COMMENT 'Код',
  `id_day` int(3) NOT NULL COMMENT 'Код дня',
  `number_total` int(11) NOT NULL COMMENT 'Общее количество овечек',
  `number_killed` int(11) NOT NULL COMMENT 'Количество убитых овечек',
  `number_live` int(11) NOT NULL COMMENT 'Количество живых овечек',
  `id_most_herd` int(3) NOT NULL COMMENT 'Код самого населённого загона',
  `number_most` int(11) NOT NULL COMMENT 'Количество самого населённого загона',
  `id_least_herd` int(3) NOT NULL COMMENT 'Код самого менее населённого загона',
  `number_least` int(11) NOT NULL COMMENT 'Количество самого менее населённого загона'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ежедневный отчет';

--
-- Дамп даних таблиці `report`
--

INSERT INTO `report` (`id`, `id_day`, `number_total`, `number_killed`, `number_live`, `id_most_herd`, `number_most`, `id_least_herd`, `number_least`) VALUES
(1, 1, 10, 0, 10, 3, 4, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `sheep`
--

CREATE TABLE `sheep` (
  `id` int(3) NOT NULL COMMENT 'Код',
  `caption` varchar(24) NOT NULL COMMENT 'Наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица овечек';

--
-- Дамп даних таблиці `sheep`
--

INSERT INTO `sheep` (`id`, `caption`) VALUES
(1, 'Овечка 1'),
(2, 'Овечка 2'),
(3, 'Овечка 3'),
(4, 'Овечка 4'),
(5, 'Овечка 5'),
(6, 'Овечка 6'),
(7, 'Овечка 7'),
(8, 'Овечка 8'),
(9, 'Овечка 9'),
(10, 'Овечка 10');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `corral`
--
ALTER TABLE `corral`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `herd`
--
ALTER TABLE `herd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_corral` (`id_corral`),
  ADD KEY `id_sheep` (`id_sheep`);

--
-- Індекси таблиці `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_corral` (`id_corral`),
  ADD KEY `id_sheep` (`id_sheep`),
  ADD KEY `id_day` (`id_day`);

--
-- Індекси таблиці `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_most_herd` (`id_most_herd`),
  ADD KEY `id_least_herd` (`id_least_herd`);

--
-- Індекси таблиці `sheep`
--
ALTER TABLE `sheep`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `corral`
--
ALTER TABLE `corral`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Код', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблиці `day`
--
ALTER TABLE `day`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Код', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблиці `herd`
--
ALTER TABLE `herd`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Код', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблиці `history`
--
ALTER TABLE `history`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Код', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблиці `report`
--
ALTER TABLE `report`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Код', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблиці `sheep`
--
ALTER TABLE `sheep`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Код', AUTO_INCREMENT=11;
--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `herd`
--
ALTER TABLE `herd`
  ADD CONSTRAINT `herd_ibfk_2` FOREIGN KEY (`id_sheep`) REFERENCES `sheep` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `herd_ibfk_3` FOREIGN KEY (`id_corral`) REFERENCES `corral` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_day`) REFERENCES `day` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`id_corral`) REFERENCES `corral` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`id_sheep`) REFERENCES `sheep` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`id`) REFERENCES `day` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`id_most_herd`) REFERENCES `herd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`id_least_herd`) REFERENCES `herd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
