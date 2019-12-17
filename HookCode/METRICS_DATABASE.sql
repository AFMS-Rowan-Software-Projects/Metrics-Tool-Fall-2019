CREATE DATABASE  IF NOT EXISTS `Program_info` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Program_info`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Program_info
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author` (
  `author_ID` int(11) NOT NULL AUTO_INCREMENT,
  `author_email` varchar(100) DEFAULT NULL,
  `author_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`author_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `CONCAT_METRICS`
--

DROP TABLE IF EXISTS `CONCAT_METRICS`;
/*!50001 DROP VIEW IF EXISTS `CONCAT_METRICS`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CONCAT_METRICS` AS SELECT 
 1 AS `file_ID`,
 1 AS `commit_ID`,
 1 AS `physical_sloc`,
 1 AS `logical_sloc`,
 1 AS `comments`,
 1 AS `embedded_comments`,
 1 AS `metrics_maintainability3`,
 1 AS `metrics_maintainability4`,
 1 AS `severity`,
 1 AS `line_num`,
 1 AS `msg`,
 1 AS `warning_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Commit_info`
--

DROP TABLE IF EXISTS `Commit_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Commit_info` (
  `commit_ID` int(11) NOT NULL AUTO_INCREMENT,
  `commit_date` datetime DEFAULT NULL,
  `ticket_number` int(11) DEFAULT NULL,
  `author_ID` int(11) NOT NULL,
  `commit_hash` varchar(250) DEFAULT NULL,
  `build_result` varchar(50) DEFAULT NULL,
  `labor_hours` double DEFAULT NULL,
  `percent_coverage` double DEFAULT NULL,
  PRIMARY KEY (`commit_ID`),
  KEY `author_ID` (`author_ID`),
  CONSTRAINT `Commit_info_ibfk_1` FOREIGN KEY (`author_ID`) REFERENCES `Author` (`author_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Cpp_metrics`
--

DROP TABLE IF EXISTS `Cpp_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cpp_metrics` (
  `cpp_ID` int(11) NOT NULL AUTO_INCREMENT,
  `commit_ID` int(11) NOT NULL,
  `file_ID` int(11) NOT NULL,
  `severity` varchar(50) DEFAULT NULL,
  `msg` varchar(250) DEFAULT NULL,
  `warning_ID` varchar(100) DEFAULT NULL,
  `line_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cpp_ID`),
  KEY `commit_ID` (`commit_ID`),
  KEY `file_ID` (`file_ID`),
  CONSTRAINT `Cpp_metrics_ibfk_1` FOREIGN KEY (`commit_ID`) REFERENCES `Commit_info` (`commit_ID`) ON DELETE CASCADE,
  CONSTRAINT `Cpp_metrics_ibfk_2` FOREIGN KEY (`file_ID`) REFERENCES `File` (`file_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `File` (
  `file_ID` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(250) DEFAULT NULL,
  `file_path` varchar(250) NOT NULL,
  `repo_url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`file_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=722 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tag` (
  `tag_ID` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) DEFAULT NULL,
  `commit_ID` int(11) NOT NULL,
  `repo_url` varchar(250) NOT NULL,
  PRIMARY KEY (`tag_ID`),
  KEY `commit_ID` (`commit_ID`),
  CONSTRAINT `Tag_ibfk_1` FOREIGN KEY (`commit_ID`) REFERENCES `Commit_info` (`commit_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Temp_maintainability`
--

DROP TABLE IF EXISTS `Temp_maintainability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Temp_maintainability` (
  `m_main3` int(11) DEFAULT NULL,
  `m_main4` int(11) DEFAULT NULL,
  `f_path` varchar(250) NOT NULL,
  `c_hash` varchar(250) NOT NULL,
  `repo_url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`f_path`,`c_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Ucc_metrics`
--

DROP TABLE IF EXISTS `Ucc_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ucc_metrics` (
  `ucc_ID` int(11) NOT NULL AUTO_INCREMENT,
  `commit_ID` int(11) NOT NULL,
  `file_ID` int(11) NOT NULL,
  `physical_sloc` int(11) DEFAULT NULL,
  `logical_sloc` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `embedded_comments` int(11) DEFAULT NULL,
  `metrics_maintainability3` float DEFAULT NULL,
  `metrics_maintainability4` float DEFAULT NULL,
  PRIMARY KEY (`ucc_ID`),
  KEY `commit_ID` (`commit_ID`),
  KEY `file_ID` (`file_ID`),
  CONSTRAINT `Ucc_metrics_ibfk_1` FOREIGN KEY (`commit_ID`) REFERENCES `Commit_info` (`commit_ID`) ON DELETE CASCADE,
  CONSTRAINT `Ucc_metrics_ibfk_2` FOREIGN KEY (`file_ID`) REFERENCES `File` (`file_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'Program_info'
--
/*!50003 DROP FUNCTION IF EXISTS `DateMetrics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `DateMetrics`(start_date DATE, end_date DATE) RETURNS text CHARSET latin1
BEGIN
RETURN
	(SELECT 
	'COMMIT_DATE',
	'AUTHOR_NAME', 
	'AUTHOR_EMAIL',
    'COMMIT_HASH',
    'BUILD_RESULT',
    'PERCENT_COVERAGE',
    'FILE_NAME',
    'FILE_PATH',
    'PHYS_SLOC/HR.',
    'LOGI_SLOC/HR.',
    'PHYS_SLOC',
    'LOGI_SLOC',
    'COMMENTS',
    'EMBEDDED_COMMENTS',
    'METRICS_MAINTAINABILITY_3',
    'METRICS_MAINTAINABILITY_4',
    'SEVERITY',
    'LINE_NUM',
    'MSG',
    'WARNING_ID'
UNION
SELECT 
    c.commit_date,
    a.author_name,
    a.author_email,
    c.commit_hash,
    c.build_result,
    c.percent_coverage,
    con.file_name,
    con.file_path,
	ROUND(physical_sloc / c.labor_hours, 5) AS 'phys_sloc per hour',
    ROUND(logical_sloc / c.labor_hours, 5) AS 'logi_sloc per hour',
    con.physical_sloc AS 'physical_sloc',
    con.logical_sloc AS 'logical_sloc',
    con.comments,
    con.embedded_comments,
    con.metrics_maintainability3,
    con.metrics_maintainability4,
    con.severity,
    con.line_num,
    con.msg,
    con.warning_ID
FROM CONCAT_METRICS con
	JOIN Commit_info c USING (commit_ID)
	JOIN Author a USING (author_ID)
WHERE c.commit_date BETWEEN start_date AND end_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `InsertAuthor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `InsertAuthor`(a_email varchar(100), a_name varchar(100)) RETURNS int(11)
begin
  if not exists(select author_email from Author where author_email = a_email) then
       insert into Author(author_email, author_name) value (a_email, a_name);
  end if;
  return (select a.author_ID from Author a where a.author_email = a_email);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `InsertFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `InsertFile`(f_path varchar(250),r_url varchar(250)) RETURNS int(11)
begin
 if not exists(select file_path, repo_url from File where file_path = f_path and repo_url = r_url) then
insert into File (file_name, file_path, repo_url) value (SUBSTRING_INDEX(f_path, '/', -1), f_path, r_url);
end if ;
 return (select f.file_ID from File f where f.file_path = f_path and f.repo_url = r_url);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `InsertFileMatch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `InsertFileMatch`(f_path varchar(250), root_path varchar(250), r_url varchar(250)) RETURNS int(11)
begin
	SET f_path = (REPLACE(f_path, root_path, './'));
 if not exists(select file_path, repo_url from File where file_path = f_path and repo_url = r_url) then
		insert into File (file_name, file_path, repo_url) value (SUBSTRING_INDEX(f_path, '/', -1), f_path, r_url);
end if;
 return (select f.file_ID from File f where f.file_path = f_path and f.repo_url = r_url);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindNullHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FindNullHours`(IN a_email VARCHAR(250))
BEGIN
	SELECT 
		c.commit_ID AS 'COMMIT_ID',
        c.commit_hash AS 'COMMIT_HASH',
		c.commit_date AS 'COMMIT_DATE',
        count(distinct f.file_name) AS 'FILES_COMMITTED',
		a.author_name AS 'AUTHOR_NAME'
	FROM Commit_info c 
        JOIN Author a USING(author_ID)
        JOIN Ucc_metrics ucc USING(commit_ID)
        LEFT JOIN File f USING(file_ID)
	WHERE a.author_email = a_email
		AND c.labor_hours IS NULL
	GROUP BY c.commit_date, a.author_name, c.commit_ID, c.commit_hash;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertAuthor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAuthor`( in a_email varchar(100), in a_name varchar(100), out author_ID int)
begin
  if not exists(select author_email from Author where author_email = a_email) then
       insert into Author(author_email, author_name) value (a_email, a_name);
  end if;
  set author_ID = (select user_ID from Author where author_email = a_email);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertCommitInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCommitInfo`(in c_date datetime,
                                    in t_num int,
                                    in a_id int,
                                    in c_hash varchar(250)
                                    )
begin
	if (SELECT count(*) FROM Commit_info c WHERE c.commit_hash = c_hash) = 0 then 
			insert into Commit_info (commit_date, ticket_number, author_ID, commit_hash ) 
					value (c_date, t_num, a_id, c_hash );
	end if;
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertCommitTags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCommitTags`(IN c_hash VARCHAR(250), IN tag_string TEXT, IN repo_url VARCHAR(250), IN num_tag INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE temp_tag VARCHAR(50);
    DECLARE count INT DEFAULT 0;
    DECLARE temp_ID INT;
    WHILE i <= num_tag DO
		SET temp_tag = null;
        SET temp_ID = null;
		SET temp_tag = (SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(tag_string, ',', i), ',', -1));
        
        SET count = (SELECT count(*) FROM Tag t WHERE t.repo_url = repo_url AND t.tag = temp_tag);
        
        IF count != 0 THEN
			SET temp_ID = (SELECT t.tag_ID FROM Tag t WHERE t.repo_URL = repo_url AND t.tag = temp_tag);
        
			UPDATE Tag t 
            SET t.commit_ID = (SELECT c.commit_ID FROM Commit_info c WHERE c.commit_hash = c_hash)
            WHERE t.tag_ID = temp_ID;
		ELSE 
			INSERT INTO Tag (tag, commit_ID, repo_url) VALUES(temp_tag, (SELECT c.commit_ID FROM Commit_info c WHERE c.commit_hash = c_hash), repo_url);
        END IF;
        SET i := i +1;

    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertFile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFile`(in f_path varchar(250),in r_url varchar(250), out file_ID int)
begin
 if not exists(select file_path, repo_url from File where file_path = f_path and repo_url = r_url) then
insert into File (file_name, file_path, repo_url) value (SUBSTRING_INDEX(file_path, '/', -1), f_path, r_url);
end if ;
set file_ID = (select file_ID where file_path = f_path and repo_url = r_url);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertHours`(IN c_ID INT, IN hours DOUBLE)
BEGIN
	#IF ((SELECT c.labor_hours FROM Commit_info c WHERE c.commit_ID = c_ID) IS NULL) THEN
		UPDATE Commit_info c
		SET c.labor_hours = hours
		WHERE c.commit_ID = c_ID;
		SELECT c.commit_ID, c.commit_date, a.author_name, c.labor_hours FROM Commit_info c JOIN Author a USING(author_ID) WHERE c.commit_ID = c_ID;
        #SET successful = true;
	#ELSE 
		#SET successful = false;
	#END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertTag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTag`(in name varchar(250), in c_hash varchar(250),in r_url varchar(250))
begin
insert into Tag(tag, commit_ID, repo_url) value (name, (SELECT c.commit_ID FROM Commit_info c WHERE c.commit_hash = c_hash), r_url);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Report`()
BEGIN
SELECT 
	'COMMIT_DATE',
	'AUTHOR_NAME', 
	'AUTHOR_EMAIL',
    'COMMIT_HASH',
    'BUILD_RESULT',
    'PERCENT_COVERAGE',
    'FILE_NAME',
    'FILE_PATH',
    'PHYS_SLOC/HR.',
    'LOGI_SLOC/HR.',
    'PHYS_SLOC',
    'LOGI_SLOC',
    'COMMENTS',
    'EMBEDDED_COMMENTS',
    'METRICS_MAINTAINABILITY_3',
    'METRICS_MAINTAINABILITY_4',
    'SEVERITY',
    'LINE_NUM',
    'MSG',
    'WARNING_ID'
    
UNION
    
SELECT 
    c.commit_date,
    a.author_name,
    a.author_email,
    c.commit_hash,
    c.build_result,
    c.percent_coverage,
    f.file_name,
    f.file_path,
	ROUND(physical_sloc / c.labor_hours, 5) AS 'phys_sloc per hour',
    ROUND(logical_sloc / c.labor_hours, 5) AS 'logi_sloc per hour',
    con.physical_sloc AS 'physical_sloc',
    con.logical_sloc AS 'logical_sloc',
    con.comments,
    con.embedded_comments,
    con.metrics_maintainability3,
    con.metrics_maintainability4,
    con.severity,
    con.line_num,
    con.msg,
    con.warning_ID
FROM CONCAT_METRICS con
	JOIN Commit_info c USING (commit_ID)
	JOIN Author a USING (author_ID)
    JOIN File f USING(file_ID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportCommit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportCommit`(IN c_hash VARCHAR(250))
BEGIN
SELECT 
	'COMMIT_DATE',
	'AUTHOR_NAME', 
	'AUTHOR_EMAIL',
    'COMMIT_HASH',
    'BUILD_RESULT',
    'PERCENT_COVERAGE',
    'FILE_NAME',
    'FILE_PATH',
    'PHYS_SLOC/HR.',
    'LOGI_SLOC/HR.',
    'PHYS_SLOC',
    'LOGI_SLOC',
    'COMMENTS',
    'EMBEDDED_COMMENTS',
    'METRICS_MAINTAINABILITY_3',
    'METRICS_MAINTAINABILITY_4',
    'SEVERITY',
    'LINE_NUM',
    'MSG',
    'WARNING_ID'
    
UNION
    
SELECT 
    c.commit_date,
    a.author_name,
    a.author_email,
    c.commit_hash,
    c.build_result,
    c.percent_coverage,
    f.file_name,
    f.file_path,
	ROUND(physical_sloc / c.labor_hours, 5) AS 'phys_sloc per hour',
    ROUND(logical_sloc / c.labor_hours, 5) AS 'logi_sloc per hour',
    con.physical_sloc AS 'physical_sloc',
    con.logical_sloc AS 'logical_sloc',
    con.comments,
    con.embedded_comments,
    con.metrics_maintainability3,
    con.metrics_maintainability4,
    con.severity,
    con.line_num,
    con.msg,
    con.warning_ID
FROM CONCAT_METRICS con
	JOIN Commit_info c USING (commit_ID)
	JOIN Author a USING (author_ID)
    JOIN File f USING(file_ID)
WHERE c.commit_hash = c_hash;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportDate`(IN start_date DATE, IN end_date DATE)
BEGIN
SELECT 
	'COMMIT_DATE',
	'AUTHOR_NAME', 
	'AUTHOR_EMAIL',
    'COMMIT_HASH',
    'BUILD_RESULT',
    'PERCENT_COVERAGE',
    'FILE_NAME',
    'FILE_PATH',
    'PHYS_SLOC/HR.',
    'LOGI_SLOC/HR.',
    'PHYS_SLOC',
    'LOGI_SLOC',
    'COMMENTS',
    'EMBEDDED_COMMENTS',
    'METRICS_MAINTAINABILITY_3',
    'METRICS_MAINTAINABILITY_4',
    'SEVERITY',
    'LINE_NUM',
    'MSG',
    'WARNING_ID'
    
UNION
    
SELECT 
    c.commit_date,
    a.author_name,
    a.author_email,
    c.commit_hash,
    c.build_result,
    c.percent_coverage,
    f.file_name,
    f.file_path,
	ROUND(physical_sloc / c.labor_hours, 5) AS 'phys_sloc per hour',
    ROUND(logical_sloc / c.labor_hours, 5) AS 'logi_sloc per hour',
    con.physical_sloc AS 'physical_sloc',
    con.logical_sloc AS 'logical_sloc',
    con.comments,
    con.embedded_comments,
    con.metrics_maintainability3,
    con.metrics_maintainability4,
    con.severity,
    con.line_num,
    con.msg,
    con.warning_ID
FROM CONCAT_METRICS con
	JOIN Commit_info c USING (commit_ID)
	JOIN Author a USING (author_ID)
    JOIN File f USING(file_ID)
WHERE c.commit_date BETWEEN start_date AND end_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateGCOV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGCOV`(IN c_hash VARCHAR(250), IN coverage DOUBLE)
BEGIN
	DECLARE id int; 
	SET id = (SELECT ci.commit_ID FROM Commit_info ci WHERE ci.commit_hash = c_hash);
    
    IF id IS NOT NULL then
		UPDATE Commit_info c
		SET c.percent_coverage = coverage 
		WHERE c.commit_ID = id; 
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateJenkins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateJenkins`(IN c_hash VARCHAR(250), IN build_result VARCHAR(250))
BEGIN
	DECLARE id int; 
	SET id = (SELECT ci.commit_ID FROM Commit_info ci WHERE ci.commit_hash = c_hash);
    
    IF id IS NOT NULL then
		UPDATE Commit_info c
		SET c.build_result = build_result 
		WHERE c.commit_ID = id; 
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateMaintainability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateMaintainability`()
BEGIN
	UPDATE Ucc_metrics ucc
		INNER JOIN (SELECT temp.m_main3, temp.m_main4, f.file_ID, ci.commit_ID, temp.repo_url
					FROM Temp_maintainability temp
					JOIN File f ON f.file_path = temp.f_path AND f.repo_url = temp.repo_url
					JOIN Commit_info ci on temp.c_hash = ci.commit_hash) tm USING(commit_ID, file_ID)
	SET ucc.metrics_maintainability3 = tm.m_main3, ucc.metrics_maintainability4 = tm.m_main4;
    
	TRUNCATE Temp_maintainability;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `CONCAT_METRICS`
--

/*!50001 DROP VIEW IF EXISTS `CONCAT_METRICS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CONCAT_METRICS` AS select `ucc`.`file_ID` AS `file_ID`,`ucc`.`commit_ID` AS `commit_ID`,`ucc`.`physical_sloc` AS `physical_sloc`,`ucc`.`logical_sloc` AS `logical_sloc`,`ucc`.`comments` AS `comments`,`ucc`.`embedded_comments` AS `embedded_comments`,`ucc`.`metrics_maintainability3` AS `metrics_maintainability3`,`ucc`.`metrics_maintainability4` AS `metrics_maintainability4`,`cpp`.`severity` AS `severity`,`cpp`.`line_num` AS `line_num`,`cpp`.`msg` AS `msg`,`cpp`.`warning_ID` AS `warning_ID` from (`Ucc_metrics` `ucc` left join `Cpp_metrics` `cpp` on(((`ucc`.`commit_ID` = `cpp`.`commit_ID`) and (`ucc`.`file_ID` = `cpp`.`file_ID`)))) union select `cpp`.`file_ID` AS `file_ID`,`cpp`.`commit_ID` AS `commit_ID`,`ucc`.`physical_sloc` AS `physical_sloc`,`ucc`.`logical_sloc` AS `logical_sloc`,`ucc`.`comments` AS `comments`,`ucc`.`embedded_comments` AS `embedded_comments`,`ucc`.`metrics_maintainability3` AS `metrics_maintainability3`,`ucc`.`metrics_maintainability4` AS `metrics_maintainability4`,`cpp`.`severity` AS `severity`,`cpp`.`line_num` AS `line_num`,`cpp`.`msg` AS `msg`,`cpp`.`warning_ID` AS `warning_ID` from (`Cpp_metrics` `cpp` left join `Ucc_metrics` `ucc` on(((`ucc`.`commit_ID` = `cpp`.`commit_ID`) and (`ucc`.`file_ID` = `cpp`.`file_ID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ucc_view`
--

/*!50001 DROP VIEW IF EXISTS `ucc_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ucc_view` AS select `c`.`commit_ID` AS `commit_ID`,`c`.`commit_date` AS `commit_date`,`a`.`author_name` AS `author_name`,`a`.`author_email` AS `author_email`,`c`.`commit_hash` AS `commit_hash`,`c`.`build_result` AS `build_result`,`c`.`labor_hours` AS `labor_hours`,`f`.`file_name` AS `file_name`,`ucc`.`physical_sloc` AS `physical_sloc`,`ucc`.`logical_sloc` AS `logical_sloc`,`ucc`.`comments` AS `comments`,`ucc`.`embedded_comments` AS `embedded_comments`,`ucc`.`metrics_maintainability3` AS `metrics_maintainability3`,`ucc`.`metrics_maintainability4` AS `metrics_maintainability4` from (((`Commit_info` `c` join `Author` `a` on((`c`.`author_ID` = `a`.`author_ID`))) join `Ucc_metrics` `ucc` on((`c`.`commit_ID` = `ucc`.`commit_ID`))) join `File` `f` on((`f`.`file_ID` = `ucc`.`file_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-11 18:50:44
