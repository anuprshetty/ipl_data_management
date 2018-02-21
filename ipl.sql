-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ipl
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `c_match`
--

DROP TABLE IF EXISTS `c_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_match` (
  `m_id` varchar(7) NOT NULL,
  `stage` varchar(15) NOT NULL,
  `team1` varchar(7) NOT NULL,
  `team2` varchar(7) NOT NULL,
  `m_date` date NOT NULL,
  `toss_won_by` varchar(7) NOT NULL,
  `result` varchar(7) NOT NULL,
  `v_id` varchar(7) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `v_id` (`v_id`),
  KEY `team1` (`team1`),
  KEY `team2` (`team2`),
  CONSTRAINT `c_match_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `venue` (`v_id`),
  CONSTRAINT `c_match_ibfk_2` FOREIGN KEY (`team1`) REFERENCES `team` (`t_id`),
  CONSTRAINT `c_match_ibfk_3` FOREIGN KEY (`team2`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_match`
--

LOCK TABLES `c_match` WRITE;
/*!40000 ALTER TABLE `c_match` DISABLE KEYS */;
INSERT INTO `c_match` VALUES ('CM001','Group','KKR','MI','2013-04-12','MI','MI','V002'),('CM002','Group','RR','RCB','2013-04-13','MI','MI','V005'),('CM003','Group','RCB','DD','2013-04-14','RCB','DD','V004'),('CM004','Group','DD','CSK','2013-04-15','DD','DD','V008'),('CM005','Group','CSK','HYD','2013-04-16','CSK','HYD','V001'),('CM006','Group','HYD','RR','2013-04-17','RR','HYD','V009'),('CM007','Group','RR','KXIP','2013-04-18','RR','RR','V007'),('CM008','Group','KXIP','KKR','2013-04-19','KXIP','KXIP','V003'),('CM009','Group','KKR','DD','2013-04-22','DD','DD','V010'),('CM010','Group','MI','CSK','2013-04-23','MI','CSK','V012'),('CM011','Group','RCB','HYD','2013-04-24','HYD','HYD','V011'),('CM012','Group','DD','RR','2013-04-25','RR','DD','V014'),('CM013','Group','CSK','HYD','2013-04-26','CSK','HYD','V006'),('CM014','Group','HYD','KKR','2013-04-27','KKR','KKR','V013'),('CM015','Group','RR','MI','2013-04-28','MI','RR','V007'),('CM016','Group','KXIP','RCB','2013-04-29','RCB','KXIP','V005'),('CM017','Semi Final','RR','MI','2013-05-04','MI','MI','V001'),('CM018','Semi Final','HYD','CSK','2013-05-05','HYD','CSK','V002'),('CM019','Third','HYD','RR','2013-05-09','HYD','HYD','V005'),('CM020','Final','CSK','MI','2013-05-10','MI','MI','V003');
/*!40000 ALTER TABLE `c_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `c_id` varchar(7) NOT NULL,
  `t_id` varchar(7) NOT NULL,
  `Coach_name` varchar(20) NOT NULL,
  `domain` varchar(15) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES ('C001','CSK','Tom Mody','Head'),('C002','DD','Alan Donald','Head'),('C003','HYD','Stephan Flemming','Head'),('C004','MI','Ricky Ponting','Batting'),('C005','RR','Jonty Rhodes','Fielding'),('C006','KKR','Shane Bond','Bowling'),('C007','RCB','Daniel Vettori','Bowling'),('C008','KXIP','Muttaih Muralidharan','Bowling');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual_score`
--

DROP TABLE IF EXISTS `individual_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual_score` (
  `p_id` varchar(7) NOT NULL,
  `m_id` varchar(7) NOT NULL,
  `runs` int NOT NULL,
  `wickets` int NOT NULL,
  `catches` int NOT NULL,
  `sixes` int NOT NULL,
  `fours` int NOT NULL,
  `strike_rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`p_id`,`m_id`),
  KEY `p_id` (`p_id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `individual_score_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `player` (`p_id`),
  CONSTRAINT `individual_score_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `c_match` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual_score`
--

LOCK TABLES `individual_score` WRITE;
/*!40000 ALTER TABLE `individual_score` DISABLE KEYS */;
INSERT INTO `individual_score` VALUES ('PA001','CM003',78,0,3,4,7,166),('PA004','CM010',91,0,3,8,7,210),('PB001','CM001',93,0,1,6,9,180),('PB003','CM005',108,0,1,9,8,199),('PC001','CM006',32,2,0,0,4,112),('PC002','CM011',67,1,1,3,5,148),('PD003','CM002',0,4,0,0,0,0),('PD004','CM011',0,2,0,0,0,0);
/*!40000 ALTER TABLE `individual_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `o_id` varchar(7) NOT NULL,
  `Owner_name` varchar(20) NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES ('O001','Shah Rukh Khan'),('O002','Mukesh Ambani'),('O003','Vijay Malya'),('O004','GMR Co.'),('O005','India Cement'),('O006','Sun TV'),('O007','Shilpa Shetty'),('O008','Priety Zinta');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `p_id` varchar(7) NOT NULL,
  `Player_name` varchar(25) NOT NULL,
  `age` int NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `bidamt` decimal(5,2) DEFAULT NULL,
  `t_id` varchar(7) NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_t_id_idx` (`t_id`),
  CONSTRAINT `player_fk_t_id` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('PA001','Virat Kohli',28,'Indian','batsman,captain',72.10,'RCB'),('PA004','AB De Villiers',30,'South Africa','batsman,keeper',63.00,'RCB'),('PB001','M S Dhoni',28,'Indian','batsman,keeper',54.30,'CSK'),('PB003','Lasith Malinga',37,'Sri Lanka','bowler,captain',64.60,'CSK'),('PC001','Ravichandran Ashwin',33,'Indian','bowler,captain',32.10,'HYD'),('PC002','Angelo Mathews',21,'Sri Lanka','batsman,vice-captain',65.00,'HYD'),('PD003','Tilakaratne Dilshan',32,'Sri Lanka','bowler,keeper',89.00,'MI'),('PD004','Dale Steyn',34,'South African','batsman,bowler',62.19,'MI'),('PE001','Dinesh Chandimal',29,'Sri Lanka','bowler,captain',54.00,'KKR'),('PE004','Suresh Raina',25,'Indian','batsman',57.00,'KKR'),('PF002','Mitchell Starc',38,'England','bowler,vice-captain',31.00,'DD'),('PF004','Upul Tharanga',28,'Sri Lanka','batsman,bowler',60.00,'DD'),('PG001','Rohith Sharma',29,'Indian','batsman,captain',52.00,'RR'),('PG003','Hashim Amla',31,'South Africa','keeper,bowler',73.25,'RR'),('PH001','Goutham Gambhir',25,'Indian','bowler,captain',64.34,'KXIP'),('PH004','Imran Tahir',28,'South Africa','batsman,bowler',64.23,'KXIP');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `t_id` varchar(7) NOT NULL,
  `Team_name` varchar(50) NOT NULL,
  `money_spent` decimal(5,2) DEFAULT NULL,
  `home_ground` varchar(50) NOT NULL,
  `o_id` varchar(7) NOT NULL,
  PRIMARY KEY (`t_id`),
  KEY `o_id` (`o_id`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `owner` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('CSK','Chennai Super Kings',38.81,'M. A. Chidambaram Stadium','O002'),('DD','Delhi Daredevils',24.29,'Feroz Shah Kotla','O006'),('HYD','Deccan chargers',27.94,'U\"ppal Stadium','O003'),('KKR','Kolkata Knight Riders',32.53,'Eden Gardens','O005'),('KXIP','Kings XI Punjab',25.53,'Himachal Pradesh Cricket Association Stadium','O008'),('MI','Mumbai Indians',34.24,'Wankhade Stadium','O004'),('RCB','Royal Challengers Bangalore',41.90,'M Chinnaswamy Stadium','O001'),('RR','Rajasthan Royals',23.65,'Sawai Mansingh Stadium','O007');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_score`
--

DROP TABLE IF EXISTS `total_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_score` (
  `p_id` varchar(7) NOT NULL,
  `matches` decimal(10,0) DEFAULT NULL,
  `runs` int NOT NULL,
  `wickets` int NOT NULL,
  `catches` int NOT NULL,
  `sixes` int NOT NULL,
  `fours` int NOT NULL,
  `strike_rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`p_id`),
  CONSTRAINT `total_score_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `player` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_score`
--

LOCK TABLES `total_score` WRITE;
/*!40000 ALTER TABLE `total_score` DISABLE KEYS */;
INSERT INTO `total_score` VALUES ('PA001',25,200,19,7,3,2,31),('PB001',3,23,0,3,2,1,67),('PC002',1,24,3,1,0,2,58),('PD003',4,89,3,2,4,4,23),('PE004',12,345,4,5,12,4,29),('PH004',4,22,4,3,0,4,64);
/*!40000 ALTER TABLE `total_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `v_id` varchar(7) NOT NULL,
  `Venue_name` varchar(50) NOT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES ('V001','Uppal Stadium'),('V002','Wankhade Stadium'),('V003','Eden Gardens'),('V004','Feroz Shah Kotla'),('V005','M Chinnaswamy Stadium'),('V006','M. A. Chidambaram Stadium'),('V007','Mahatma Gandhi Stadium'),('V008','Himachal Pradesh Cricket Association Stadium'),('V009','Y S R ACA VDCA CRICKET STADIUM'),('V010','Punjab Cricket Association IS Bindra Stadium'),('V011','Sardar Patel Stadium'),('V012','Barabati Stadium'),('V013','Maharashtra Cricket Association Stadium'),('V014','Vidarbha Cricket Association Stadium');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-06 20:56:29
