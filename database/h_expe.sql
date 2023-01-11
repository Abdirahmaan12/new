-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2023 at 06:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `h_expe`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_statement_sp` (IN `_userId` VARCHAR(50) CHARSET utf8, IN `_from` DATE, IN `_to` DATE)   BEGIN

set @tbalance = 0;
set @expense = 0;
set @income = 0;

if(_from = '0000-00-00')THEN

CREATE TEMPORARY TABLE tb SELECT expense.date, expense.user_id,if(type = 'Income',amount,0) Income, if(type = 'Expense',amount,0) 'Expense',if(type = 'Income', @tbalance:=@tbalance+amount ,@tbalance:=@tbalance-amount) 'Balance'  FROM expense WHERE expense.user_id = _userId ORDER by expense.date ASC;

SELECT * FROM tb

UNION

SELECT '','', SUM(Income),SUM(Expense), @tbalance FROM tb;


ELSE

CREATE TEMPORARY TABLE tb SELECT expense.date, expense.user_id,if(type = 'Income',amount,0) Income, if(type = 'Expense',amount,0) 'Expense',if(type = 'Income', @tbalance:=@tbalance+amount ,@tbalance:=@tbalance-amount) 'Balance'  FROM expense WHERE expense.user_id = _userId AND expense.date BETWEEN _from and _to ORDER by expense.date ASC;

SELECT * FROM tb

UNION

SELECT '','', SUM(Income),SUM(Expense), @tbalance FROM tb;

END if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_sp` (IN `_username` VARCHAR(250) CHARSET utf8, IN `_password` VARCHAR(250) CHARSET utf8)   BEGIN


if EXISTS(SELECT * FROM users WHERE users.username = _username and users.password = MD5(_password))THEN	


if EXISTS(SELECT * FROM users WHERE users.username = _username and 	users.status = 'Active')THEN
 
SELECT * FROM users where users.username = _username;

ELSE

SELECT 'Locked' Msg;

end if;
ELSE


SELECT 'Deny' Msg;

END if;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `register_expense_sp` (IN `_id` INT, IN `_amount` FLOAT(11,2), IN `_type` VARCHAR(50) CHARSET utf8, IN `_desc` TEXT CHARSET utf8, IN `_userId` VARCHAR(50) CHARSET utf8)   BEGIN

if EXISTS( SELECT * FROM expense WHERE expense.id = _id)THEN

UPDATE expense SET expense.amount = _amount, expense.type = _type, expense.description = _desc WHERE expense.id = _id;

SELECT 'Updated' as Message;
 
ELSE

if(_type = 'Expense')THEN

if((SELECT get_user_balance_fn(_userId) < _amount ))THEN

SELECT 'Deny' as Message;

ELSE

INSERT into expense(expense.amount,expense.type,expense.description,expense.user_id)
VALUES(_amount,_type,_desc,_userId);

SELECT 'Registered' as Message;

END if;

ELSE

INSERT into expense(expense.amount,expense.type,expense.description,expense.user_id)
VALUES(_amount,_type,_desc,_userId);

SELECT 'Registered' as Message;

END if;

END if;

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_user_balance_fn` (`_userId` VARCHAR(50) CHARSET utf8) RETURNS FLOAT(11,2)  BEGIN

SET @balance = 0.00;

SET @income = (SELECT SUM(expense.amount) FROM expense WHERE expense.type = 'Income' AND expense.user_id = _userId);

SET @expense = (SELECT SUM(expense.amount) FROM expense WHERE expense.type = 'Expense' AND expense.user_id = _userId);

SET @balance = (ifnull(@income,0) - ifnull(@expense,0));

RETURN @balance;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `amount` float(11,2) NOT NULL,
  `type` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `amount`, `type`, `description`, `user_id`, `date`) VALUES
(1, 100.00, 'Income', 'mushar', 'USR001', '2022-12-21 07:16:12'),
(2, 90.00, 'Income', 'mushar', 'USR001', '2022-12-21 07:16:24'),
(3, 300.00, 'Income', 'xgjs', 'USR001', '2023-01-10 21:18:47'),
(4, 300.00, 'Income', 'xgjs', 'USR001', '2023-01-10 21:18:53'),
(5, 300.00, 'Income', 'xgjs', 'USR001', '2023-01-10 21:19:56'),
(6, 100.00, 'Income', 'xgjs', 'USR001', '2023-01-10 21:20:04'),
(7, 100.00, 'Income', 'xgjs', 'USR001', '2023-01-10 21:20:12'),
(8, 100.00, 'Income', 'xgjs', 'USR001', '2023-01-10 21:20:24'),
(9, 300.00, 'Income', 'xgjs', 'USR001', '2023-01-10 21:22:20'),
(10, 78.00, 'Income', '22', 'USR001', '2023-01-10 21:24:03'),
(11, 78.00, 'Expense', '22', 'USR001', '2023-01-10 21:26:50');

-- --------------------------------------------------------

--
-- Stand-in structure for view `system_authority`
-- (See below for the actual view)
--
CREATE TABLE `system_authority` (
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'Active',
  `image` varchar(250) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `status`, `image`, `date`) VALUES
('USR001', 'mosh', '81dc9bdb52d04dc20036dbd8313ed055', 'Active', 'USR001.png', '2023-01-10 21:01:22');

-- --------------------------------------------------------

--
-- Structure for view `system_authority`
--
DROP TABLE IF EXISTS `system_authority`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `system_authority`  AS SELECT `category`.`id` AS `id`, `category`.`name` AS `category`, `category`.`icon` AS `icon`, `category`.`role` AS `role`, `system_links`.`id` AS `link_id`, `system_links`.`name` AS `name`, `system_actions`.`id` AS `action_id`, `system_actions`.`name` AS `action_name` FROM ((`category` left join `system_links` on(`category`.`id` = `system_links`.`category_id`)) left join `system_actions` on(`system_links`.`id` = `system_actions`.`link_id`)) ORDER BY `category`.`role` ASC, `system_links`.`id` ASC, `system_actions`.`id` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
