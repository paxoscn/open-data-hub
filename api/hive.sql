-- MySQL dump 10.13  Distrib 5.5.15, for Win64 (x86)
--
-- Host: 192.168.20.31    Database: hive
-- ------------------------------------------------------
-- Server version	5.1.71

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BUCKETING_COLS`
--

DROP TABLE IF EXISTS `BUCKETING_COLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUCKETING_COLS` (
  `SD_ID` bigint(20) NOT NULL,
  `BUCKET_COL_NAME` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `BUCKETING_COLS_N49` (`SD_ID`),
  CONSTRAINT `BUCKETING_COLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUCKETING_COLS`
--

LOCK TABLES `BUCKETING_COLS` WRITE;
/*!40000 ALTER TABLE `BUCKETING_COLS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUCKETING_COLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CDS`
--

DROP TABLE IF EXISTS `CDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CDS` (
  `CD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CDS`
--

LOCK TABLES `CDS` WRITE;
/*!40000 ALTER TABLE `CDS` DISABLE KEYS */;
INSERT INTO `CDS` VALUES (6),(7),(29),(43),(44),(46),(62),(68),(71),(73),(76),(93),(94),(95),(96),(97),(98),(136),(141),(146);
/*!40000 ALTER TABLE `CDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLUMNS_V2`
--

DROP TABLE IF EXISTS `COLUMNS_V2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLUMNS_V2` (
  `CD_ID` bigint(20) NOT NULL,
  `COMMENT` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TYPE_NAME` varchar(4000) DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`CD_ID`,`COLUMN_NAME`),
  KEY `COLUMNS_V2_N49` (`CD_ID`),
  CONSTRAINT `COLUMNS_V2_FK1` FOREIGN KEY (`CD_ID`) REFERENCES `CDS` (`CD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLUMNS_V2`
--

LOCK TABLES `COLUMNS_V2` WRITE;
/*!40000 ALTER TABLE `COLUMNS_V2` DISABLE KEYS */;
INSERT INTO `COLUMNS_V2` VALUES (6,NULL,'a','double',5),(6,NULL,'d','bigint',4),(6,NULL,'e','string',2),(6,NULL,'key','string',0),(6,NULL,'p','string',1),(6,NULL,'t','string',3),(7,NULL,'a','double',0),(7,NULL,'d','string',4),(7,NULL,'e','string',2),(7,NULL,'p','string',1),(7,NULL,'t','string',3),(29,NULL,'k','string',0),(29,NULL,'n','string',1),(43,NULL,'id','string',0),(44,NULL,'p','string',0),(44,NULL,'t','string',1),(46,NULL,'a','double',4),(46,NULL,'d','bigint',3),(46,NULL,'e','string',1),(46,NULL,'p','string',0),(46,NULL,'t','string',2),(62,NULL,'k','string',0),(62,NULL,'n','string',1),(68,NULL,'a','double',4),(68,NULL,'e','string',1),(68,NULL,'m','string',3),(68,NULL,'p','string',0),(68,NULL,'t','string',2),(71,NULL,'a','double',6),(71,NULL,'c','string',4),(71,NULL,'d','bigint',5),(71,NULL,'e','string',2),(71,NULL,'items','map<string,string>',7),(71,NULL,'key','string',0),(71,NULL,'p','string',1),(71,NULL,'t','string',3),(73,NULL,'a','double',5),(73,NULL,'e','string',1),(73,NULL,'m','string',3),(73,NULL,'p','string',0),(73,NULL,'pd','string',2),(73,NULL,'q','double',4),(76,NULL,'a','double',5),(76,NULL,'c','string',3),(76,NULL,'d','bigint',4),(76,NULL,'key','string',0),(76,NULL,'p','string',1),(76,NULL,'t','string',2),(93,NULL,'a','double',5),(93,NULL,'c','string',3),(93,NULL,'d','bigint',4),(93,NULL,'items','map<string,string>',6),(93,NULL,'key','string',0),(93,NULL,'p','string',1),(93,NULL,'t','string',2),(94,NULL,'amount','double',6),(94,NULL,'code','string',4),(94,NULL,'coreenterprisecode','string',2),(94,NULL,'duedate','bigint',5),(94,NULL,'entrytype','string',3),(94,NULL,'items','array<string>',7),(94,NULL,'key','string',0),(94,NULL,'providercode','string',1),(95,NULL,'a','string',2),(95,NULL,'key','string',0),(95,NULL,'n','string',1),(96,NULL,'address','string',2),(96,NULL,'key','string',0),(96,NULL,'name','string',1),(97,NULL,'code','string',1),(97,NULL,'key','string',0),(97,NULL,'name','string',3),(97,NULL,'referenceprice','double',5),(97,NULL,'sellingmethod','int',2),(97,NULL,'unit','string',4),(98,NULL,'code','string',1),(98,NULL,'key','string',0),(98,NULL,'name','string',3),(98,NULL,'referenceprice','double',5),(98,NULL,'sellingmethod','int',2),(98,NULL,'unit','string',4),(136,NULL,'key','int',0),(136,NULL,'value','string',1),(141,NULL,'key','int',0),(141,NULL,'value','string',1),(146,NULL,'id','string',0);
/*!40000 ALTER TABLE `COLUMNS_V2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPACTION_QUEUE`
--

DROP TABLE IF EXISTS `COMPACTION_QUEUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPACTION_QUEUE` (
  `CQ_ID` bigint(20) NOT NULL,
  `CQ_DATABASE` varchar(128) NOT NULL,
  `CQ_TABLE` varchar(128) NOT NULL,
  `CQ_PARTITION` varchar(767) DEFAULT NULL,
  `CQ_STATE` char(1) NOT NULL,
  `CQ_TYPE` char(1) NOT NULL,
  `CQ_WORKER_ID` varchar(128) DEFAULT NULL,
  `CQ_START` bigint(20) DEFAULT NULL,
  `CQ_RUN_AS` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`CQ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPACTION_QUEUE`
--

LOCK TABLES `COMPACTION_QUEUE` WRITE;
/*!40000 ALTER TABLE `COMPACTION_QUEUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPACTION_QUEUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPLETED_TXN_COMPONENTS`
--

DROP TABLE IF EXISTS `COMPLETED_TXN_COMPONENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPLETED_TXN_COMPONENTS` (
  `CTC_TXNID` bigint(20) DEFAULT NULL,
  `CTC_DATABASE` varchar(128) NOT NULL,
  `CTC_TABLE` varchar(128) DEFAULT NULL,
  `CTC_PARTITION` varchar(767) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPLETED_TXN_COMPONENTS`
--

LOCK TABLES `COMPLETED_TXN_COMPONENTS` WRITE;
/*!40000 ALTER TABLE `COMPLETED_TXN_COMPONENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPLETED_TXN_COMPONENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASE_PARAMS`
--

DROP TABLE IF EXISTS `DATABASE_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASE_PARAMS` (
  `DB_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(180) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`DB_ID`,`PARAM_KEY`),
  KEY `DATABASE_PARAMS_N49` (`DB_ID`),
  CONSTRAINT `DATABASE_PARAMS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASE_PARAMS`
--

LOCK TABLES `DATABASE_PARAMS` WRITE;
/*!40000 ALTER TABLE `DATABASE_PARAMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATABASE_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DBS`
--

DROP TABLE IF EXISTS `DBS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBS` (
  `DB_ID` bigint(20) NOT NULL,
  `DESC` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `DB_LOCATION_URI` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `OWNER_TYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `UNIQUE_DATABASE` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DBS`
--

LOCK TABLES `DBS` WRITE;
/*!40000 ALTER TABLE `DBS` DISABLE KEYS */;
INSERT INTO `DBS` VALUES (1,'Default Hive database','hdfs://cluster1/user/hive/warehouse','default','public','ROLE');
/*!40000 ALTER TABLE `DBS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DB_PRIVS`
--

DROP TABLE IF EXISTS `DB_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DB_PRIVS` (
  `DB_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) DEFAULT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `DB_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`DB_GRANT_ID`),
  UNIQUE KEY `DBPRIVILEGEINDEX` (`DB_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`DB_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `DB_PRIVS_N49` (`DB_ID`),
  CONSTRAINT `DB_PRIVS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DB_PRIVS`
--

LOCK TABLES `DB_PRIVS` WRITE;
/*!40000 ALTER TABLE `DB_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DB_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DELEGATION_TOKENS`
--

DROP TABLE IF EXISTS `DELEGATION_TOKENS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DELEGATION_TOKENS` (
  `TOKEN_IDENT` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TOKEN` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`TOKEN_IDENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DELEGATION_TOKENS`
--

LOCK TABLES `DELEGATION_TOKENS` WRITE;
/*!40000 ALTER TABLE `DELEGATION_TOKENS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DELEGATION_TOKENS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUNCS`
--

DROP TABLE IF EXISTS `FUNCS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUNCS` (
  `FUNC_ID` bigint(20) NOT NULL,
  `CLASS_NAME` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) DEFAULT NULL,
  `FUNC_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `FUNC_TYPE` int(11) NOT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `OWNER_TYPE` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`FUNC_ID`),
  UNIQUE KEY `UNIQUEFUNCTION` (`FUNC_NAME`,`DB_ID`),
  KEY `FUNCS_N49` (`DB_ID`),
  CONSTRAINT `FUNCS_FK1` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUNCS`
--

LOCK TABLES `FUNCS` WRITE;
/*!40000 ALTER TABLE `FUNCS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUNCS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUNC_RU`
--

DROP TABLE IF EXISTS `FUNC_RU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUNC_RU` (
  `FUNC_ID` bigint(20) NOT NULL,
  `RESOURCE_TYPE` int(11) NOT NULL,
  `RESOURCE_URI` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`FUNC_ID`,`INTEGER_IDX`),
  CONSTRAINT `FUNC_RU_FK1` FOREIGN KEY (`FUNC_ID`) REFERENCES `FUNCS` (`FUNC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUNC_RU`
--

LOCK TABLES `FUNC_RU` WRITE;
/*!40000 ALTER TABLE `FUNC_RU` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUNC_RU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GLOBAL_PRIVS`
--

DROP TABLE IF EXISTS `GLOBAL_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GLOBAL_PRIVS` (
  `USER_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `USER_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`USER_GRANT_ID`),
  UNIQUE KEY `GLOBALPRIVILEGEINDEX` (`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`USER_PRIV`,`GRANTOR`,`GRANTOR_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GLOBAL_PRIVS`
--

LOCK TABLES `GLOBAL_PRIVS` WRITE;
/*!40000 ALTER TABLE `GLOBAL_PRIVS` DISABLE KEYS */;
INSERT INTO `GLOBAL_PRIVS` VALUES (1,1433835456,1,'admin','ROLE','admin','ROLE','All');
/*!40000 ALTER TABLE `GLOBAL_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HIVE_LOCKS`
--

DROP TABLE IF EXISTS `HIVE_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HIVE_LOCKS` (
  `HL_LOCK_EXT_ID` bigint(20) NOT NULL,
  `HL_LOCK_INT_ID` bigint(20) NOT NULL,
  `HL_TXNID` bigint(20) DEFAULT NULL,
  `HL_DB` varchar(128) NOT NULL,
  `HL_TABLE` varchar(128) DEFAULT NULL,
  `HL_PARTITION` varchar(767) DEFAULT NULL,
  `HL_LOCK_STATE` char(1) NOT NULL,
  `HL_LOCK_TYPE` char(1) NOT NULL,
  `HL_LAST_HEARTBEAT` bigint(20) NOT NULL,
  `HL_ACQUIRED_AT` bigint(20) DEFAULT NULL,
  `HL_USER` varchar(128) NOT NULL,
  `HL_HOST` varchar(128) NOT NULL,
  PRIMARY KEY (`HL_LOCK_EXT_ID`,`HL_LOCK_INT_ID`),
  KEY `HIVE_LOCK_TXNID_INDEX` (`HL_TXNID`),
  KEY `HL_TXNID_IDX` (`HL_TXNID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HIVE_LOCKS`
--

LOCK TABLES `HIVE_LOCKS` WRITE;
/*!40000 ALTER TABLE `HIVE_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `HIVE_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDXS`
--

DROP TABLE IF EXISTS `IDXS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDXS` (
  `INDEX_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DEFERRED_REBUILD` bit(1) NOT NULL,
  `INDEX_HANDLER_CLASS` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INDEX_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INDEX_TBL_ID` bigint(20) DEFAULT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `ORIG_TBL_ID` bigint(20) DEFAULT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`),
  UNIQUE KEY `UNIQUEINDEX` (`INDEX_NAME`,`ORIG_TBL_ID`),
  KEY `IDXS_N51` (`SD_ID`),
  KEY `IDXS_N50` (`INDEX_TBL_ID`),
  KEY `IDXS_N49` (`ORIG_TBL_ID`),
  CONSTRAINT `IDXS_FK1` FOREIGN KEY (`ORIG_TBL_ID`) REFERENCES `TBLS` (`TBL_ID`),
  CONSTRAINT `IDXS_FK2` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `IDXS_FK3` FOREIGN KEY (`INDEX_TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDXS`
--

LOCK TABLES `IDXS` WRITE;
/*!40000 ALTER TABLE `IDXS` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDXS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INDEX_PARAMS`
--

DROP TABLE IF EXISTS `INDEX_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDEX_PARAMS` (
  `INDEX_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`,`PARAM_KEY`),
  KEY `INDEX_PARAMS_N49` (`INDEX_ID`),
  CONSTRAINT `INDEX_PARAMS_FK1` FOREIGN KEY (`INDEX_ID`) REFERENCES `IDXS` (`INDEX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INDEX_PARAMS`
--

LOCK TABLES `INDEX_PARAMS` WRITE;
/*!40000 ALTER TABLE `INDEX_PARAMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `INDEX_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MASTER_KEYS`
--

DROP TABLE IF EXISTS `MASTER_KEYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MASTER_KEYS` (
  `KEY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MASTER_KEY` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`KEY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MASTER_KEYS`
--

LOCK TABLES `MASTER_KEYS` WRITE;
/*!40000 ALTER TABLE `MASTER_KEYS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MASTER_KEYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NEXT_COMPACTION_QUEUE_ID`
--

DROP TABLE IF EXISTS `NEXT_COMPACTION_QUEUE_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEXT_COMPACTION_QUEUE_ID` (
  `NCQ_NEXT` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEXT_COMPACTION_QUEUE_ID`
--

LOCK TABLES `NEXT_COMPACTION_QUEUE_ID` WRITE;
/*!40000 ALTER TABLE `NEXT_COMPACTION_QUEUE_ID` DISABLE KEYS */;
INSERT INTO `NEXT_COMPACTION_QUEUE_ID` VALUES (1);
/*!40000 ALTER TABLE `NEXT_COMPACTION_QUEUE_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NEXT_LOCK_ID`
--

DROP TABLE IF EXISTS `NEXT_LOCK_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEXT_LOCK_ID` (
  `NL_NEXT` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEXT_LOCK_ID`
--

LOCK TABLES `NEXT_LOCK_ID` WRITE;
/*!40000 ALTER TABLE `NEXT_LOCK_ID` DISABLE KEYS */;
INSERT INTO `NEXT_LOCK_ID` VALUES (1);
/*!40000 ALTER TABLE `NEXT_LOCK_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NEXT_TXN_ID`
--

DROP TABLE IF EXISTS `NEXT_TXN_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEXT_TXN_ID` (
  `NTXN_NEXT` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEXT_TXN_ID`
--

LOCK TABLES `NEXT_TXN_ID` WRITE;
/*!40000 ALTER TABLE `NEXT_TXN_ID` DISABLE KEYS */;
INSERT INTO `NEXT_TXN_ID` VALUES (1);
/*!40000 ALTER TABLE `NEXT_TXN_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTIFICATION_LOG`
--

DROP TABLE IF EXISTS `NOTIFICATION_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICATION_LOG` (
  `NL_ID` bigint(20) NOT NULL,
  `EVENT_ID` bigint(20) NOT NULL,
  `EVENT_TIME` int(11) NOT NULL,
  `EVENT_TYPE` varchar(32) NOT NULL,
  `DB_NAME` varchar(128) DEFAULT NULL,
  `TBL_NAME` varchar(128) DEFAULT NULL,
  `MESSAGE` mediumtext,
  PRIMARY KEY (`NL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICATION_LOG`
--

LOCK TABLES `NOTIFICATION_LOG` WRITE;
/*!40000 ALTER TABLE `NOTIFICATION_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTIFICATION_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTIFICATION_SEQUENCE`
--

DROP TABLE IF EXISTS `NOTIFICATION_SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICATION_SEQUENCE` (
  `NNI_ID` bigint(20) NOT NULL,
  `NEXT_EVENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`NNI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICATION_SEQUENCE`
--

LOCK TABLES `NOTIFICATION_SEQUENCE` WRITE;
/*!40000 ALTER TABLE `NOTIFICATION_SEQUENCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTIFICATION_SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NUCLEUS_TABLES`
--

DROP TABLE IF EXISTS `NUCLEUS_TABLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NUCLEUS_TABLES` (
  `CLASS_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TYPE` varchar(4) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `OWNER` varchar(2) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `VERSION` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTERFACE_NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`CLASS_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NUCLEUS_TABLES`
--

LOCK TABLES `NUCLEUS_TABLES` WRITE;
/*!40000 ALTER TABLE `NUCLEUS_TABLES` DISABLE KEYS */;
/*!40000 ALTER TABLE `NUCLEUS_TABLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITIONS`
--

DROP TABLE IF EXISTS `PARTITIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITIONS` (
  `PART_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `PART_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  `LINK_TARGET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PART_ID`),
  UNIQUE KEY `UNIQUEPARTITION` (`PART_NAME`,`TBL_ID`),
  KEY `PARTITIONS_N49` (`TBL_ID`),
  KEY `PARTITIONS_N50` (`SD_ID`),
  KEY `PARTITIONS_N51` (`LINK_TARGET_ID`),
  CONSTRAINT `PARTITIONS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`),
  CONSTRAINT `PARTITIONS_FK2` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `PARTITIONS_FK3` FOREIGN KEY (`LINK_TARGET_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITIONS`
--

LOCK TABLES `PARTITIONS` WRITE;
/*!40000 ALTER TABLE `PARTITIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITION_EVENTS`
--

DROP TABLE IF EXISTS `PARTITION_EVENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITION_EVENTS` (
  `PART_NAME_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `EVENT_TIME` bigint(20) NOT NULL,
  `EVENT_TYPE` int(11) NOT NULL,
  `PARTITION_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`PART_NAME_ID`),
  KEY `PARTITIONEVENTINDEX` (`PARTITION_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITION_EVENTS`
--

LOCK TABLES `PARTITION_EVENTS` WRITE;
/*!40000 ALTER TABLE `PARTITION_EVENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITION_EVENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITION_KEYS`
--

DROP TABLE IF EXISTS `PARTITION_KEYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITION_KEYS` (
  `TBL_ID` bigint(20) NOT NULL,
  `PKEY_COMMENT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PKEY_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PKEY_TYPE` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`TBL_ID`,`PKEY_NAME`),
  KEY `PARTITION_KEYS_N49` (`TBL_ID`),
  CONSTRAINT `PARTITION_KEYS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITION_KEYS`
--

LOCK TABLES `PARTITION_KEYS` WRITE;
/*!40000 ALTER TABLE `PARTITION_KEYS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITION_KEYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITION_KEY_VALS`
--

DROP TABLE IF EXISTS `PARTITION_KEY_VALS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITION_KEY_VALS` (
  `PART_ID` bigint(20) NOT NULL,
  `PART_KEY_VAL` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`PART_ID`,`INTEGER_IDX`),
  KEY `PARTITION_KEY_VALS_N49` (`PART_ID`),
  CONSTRAINT `PARTITION_KEY_VALS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITION_KEY_VALS`
--

LOCK TABLES `PARTITION_KEY_VALS` WRITE;
/*!40000 ALTER TABLE `PARTITION_KEY_VALS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITION_KEY_VALS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARTITION_PARAMS`
--

DROP TABLE IF EXISTS `PARTITION_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARTITION_PARAMS` (
  `PART_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`PART_ID`,`PARAM_KEY`),
  KEY `PARTITION_PARAMS_N49` (`PART_ID`),
  CONSTRAINT `PARTITION_PARAMS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARTITION_PARAMS`
--

LOCK TABLES `PARTITION_PARAMS` WRITE;
/*!40000 ALTER TABLE `PARTITION_PARAMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PARTITION_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PART_COL_PRIVS`
--

DROP TABLE IF EXISTS `PART_COL_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PART_COL_PRIVS` (
  `PART_COLUMN_GRANT_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PART_ID` bigint(20) DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PART_COL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`PART_COLUMN_GRANT_ID`),
  KEY `PART_COL_PRIVS_N49` (`PART_ID`),
  KEY `PARTITIONCOLUMNPRIVILEGEINDEX` (`PART_ID`,`COLUMN_NAME`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`PART_COL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  CONSTRAINT `PART_COL_PRIVS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PART_COL_PRIVS`
--

LOCK TABLES `PART_COL_PRIVS` WRITE;
/*!40000 ALTER TABLE `PART_COL_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PART_COL_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PART_COL_STATS`
--

DROP TABLE IF EXISTS `PART_COL_STATS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PART_COL_STATS` (
  `CS_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARTITION_NAME` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PART_ID` bigint(20) NOT NULL,
  `LONG_LOW_VALUE` bigint(20) DEFAULT NULL,
  `LONG_HIGH_VALUE` bigint(20) DEFAULT NULL,
  `DOUBLE_HIGH_VALUE` double(53,4) DEFAULT NULL,
  `DOUBLE_LOW_VALUE` double(53,4) DEFAULT NULL,
  `BIG_DECIMAL_LOW_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `BIG_DECIMAL_HIGH_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `NUM_NULLS` bigint(20) NOT NULL,
  `NUM_DISTINCTS` bigint(20) DEFAULT NULL,
  `AVG_COL_LEN` double(53,4) DEFAULT NULL,
  `MAX_COL_LEN` bigint(20) DEFAULT NULL,
  `NUM_TRUES` bigint(20) DEFAULT NULL,
  `NUM_FALSES` bigint(20) DEFAULT NULL,
  `LAST_ANALYZED` bigint(20) NOT NULL,
  PRIMARY KEY (`CS_ID`),
  KEY `PART_COL_STATS_FK` (`PART_ID`),
  KEY `PCS_STATS_IDX` (`DB_NAME`,`TABLE_NAME`,`COLUMN_NAME`,`PARTITION_NAME`) USING BTREE,
  CONSTRAINT `PART_COL_STATS_FK` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PART_COL_STATS`
--

LOCK TABLES `PART_COL_STATS` WRITE;
/*!40000 ALTER TABLE `PART_COL_STATS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PART_COL_STATS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PART_PRIVS`
--

DROP TABLE IF EXISTS `PART_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PART_PRIVS` (
  `PART_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PART_ID` bigint(20) DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PART_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`PART_GRANT_ID`),
  KEY `PARTPRIVILEGEINDEX` (`PART_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`PART_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `PART_PRIVS_N49` (`PART_ID`),
  CONSTRAINT `PART_PRIVS_FK1` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PART_PRIVS`
--

LOCK TABLES `PART_PRIVS` WRITE;
/*!40000 ALTER TABLE `PART_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PART_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLES`
--

DROP TABLE IF EXISTS `ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLES` (
  `ROLE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ROLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `ROLEENTITYINDEX` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLES`
--

LOCK TABLES `ROLES` WRITE;
/*!40000 ALTER TABLE `ROLES` DISABLE KEYS */;
INSERT INTO `ROLES` VALUES (1,1433835456,'admin','admin'),(2,1433835456,'public','public');
/*!40000 ALTER TABLE `ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_MAP`
--

DROP TABLE IF EXISTS `ROLE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_MAP` (
  `ROLE_GRANT_ID` bigint(20) NOT NULL,
  `ADD_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ROLE_GRANT_ID`),
  UNIQUE KEY `USERROLEMAPINDEX` (`PRINCIPAL_NAME`,`ROLE_ID`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `ROLE_MAP_N49` (`ROLE_ID`),
  CONSTRAINT `ROLE_MAP_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_MAP`
--

LOCK TABLES `ROLE_MAP` WRITE;
/*!40000 ALTER TABLE `ROLE_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SDS`
--

DROP TABLE IF EXISTS `SDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SDS` (
  `SD_ID` bigint(20) NOT NULL,
  `CD_ID` bigint(20) DEFAULT NULL,
  `INPUT_FORMAT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `IS_COMPRESSED` bit(1) NOT NULL,
  `IS_STOREDASSUBDIRECTORIES` bit(1) NOT NULL,
  `LOCATION` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `NUM_BUCKETS` int(11) NOT NULL,
  `OUTPUT_FORMAT` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `SERDE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SD_ID`),
  KEY `SDS_N49` (`SERDE_ID`),
  KEY `SDS_N50` (`CD_ID`),
  CONSTRAINT `SDS_FK1` FOREIGN KEY (`SERDE_ID`) REFERENCES `SERDES` (`SERDE_ID`),
  CONSTRAINT `SDS_FK2` FOREIGN KEY (`CD_ID`) REFERENCES `CDS` (`CD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SDS`
--

LOCK TABLES `SDS` WRITE;
/*!40000 ALTER TABLE `SDS` DISABLE KEYS */;
INSERT INTO `SDS` VALUES (6,6,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/entry',-1,NULL,6),(7,7,'org.apache.hadoop.mapred.TextInputFormat','\0','\0','hdfs://cluster1/user/hive/warehouse/summary',-1,'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat',7),(29,29,'org.apache.hadoop.mapred.TextInputFormat','\0','\0','hdfs://cluster1/user/hive/warehouse/provider',-1,'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat',29),(43,43,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/law',-1,NULL,43),(44,44,'org.apache.hadoop.mapred.TextInputFormat','\0','\0','hdfs://cluster1/user/hive/warehouse/lawsummary',-1,'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat',44),(46,46,'org.apache.hadoop.mapred.TextInputFormat','\0','\0','hdfs://cluster1/user/hive/warehouse/entryexport',-1,'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat',46),(62,62,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/providerdirect',-1,NULL,62),(68,68,'org.apache.hadoop.mapred.TextInputFormat','\0','\0','hdfs://cluster1/user/hive/warehouse/basicstatistics',-1,'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat',68),(71,71,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/entrywithitems',-1,NULL,71),(73,73,'org.apache.hadoop.mapred.TextInputFormat','\0','\0','hdfs://cluster1/user/hive/warehouse/productorientedstatistics',-1,'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat',73),(76,76,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/jjlentrywithitems',-1,NULL,76),(93,93,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/jjlentryhbase',-1,NULL,93),(94,94,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/jjlentrymongo',-1,NULL,94),(95,95,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/providerhbase',-1,NULL,95),(96,96,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/providermongo',-1,NULL,96),(97,97,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/producthbase',-1,NULL,97),(98,98,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/productmongo',-1,NULL,98),(136,136,'org.apache.hadoop.mapred.TextInputFormat','\0','\0','hdfs://cluster1/user/hive/warehouse/testhivedrivertable',-1,'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat',136),(141,141,'org.apache.hadoop.mapred.TextInputFormat','\0','\0','hdfs://cluster1/user/hive/warehouse/testhivedrivertable1',-1,'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat',141),(146,146,NULL,'\0','\0','hdfs://cluster1/user/hive/warehouse/lawpure',-1,NULL,146);
/*!40000 ALTER TABLE `SDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SD_PARAMS`
--

DROP TABLE IF EXISTS `SD_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SD_PARAMS` (
  `SD_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`SD_ID`,`PARAM_KEY`),
  KEY `SD_PARAMS_N49` (`SD_ID`),
  CONSTRAINT `SD_PARAMS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SD_PARAMS`
--

LOCK TABLES `SD_PARAMS` WRITE;
/*!40000 ALTER TABLE `SD_PARAMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SD_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQUENCE_TABLE`
--

DROP TABLE IF EXISTS `SEQUENCE_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCE_TABLE` (
  `SEQUENCE_NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `NEXT_VAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SEQUENCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE_TABLE`
--

LOCK TABLES `SEQUENCE_TABLE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE_TABLE` DISABLE KEYS */;
INSERT INTO `SEQUENCE_TABLE` VALUES ('org.apache.hadoop.hive.metastore.model.MColumnDescriptor',151),('org.apache.hadoop.hive.metastore.model.MDatabase',6),('org.apache.hadoop.hive.metastore.model.MGlobalPrivilege',6),('org.apache.hadoop.hive.metastore.model.MRole',6),('org.apache.hadoop.hive.metastore.model.MSerDeInfo',151),('org.apache.hadoop.hive.metastore.model.MStorageDescriptor',151),('org.apache.hadoop.hive.metastore.model.MTable',151);
/*!40000 ALTER TABLE `SEQUENCE_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERDES`
--

DROP TABLE IF EXISTS `SERDES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERDES` (
  `SERDE_ID` bigint(20) NOT NULL,
  `NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `SLIB` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`SERDE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERDES`
--

LOCK TABLES `SERDES` WRITE;
/*!40000 ALTER TABLE `SERDES` DISABLE KEYS */;
INSERT INTO `SERDES` VALUES (6,NULL,'org.apache.hadoop.hive.hbase.HBaseSerDe'),(7,NULL,'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'),(29,NULL,'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'),(43,NULL,'com.mongodb.hadoop.hive.BSONSerDe'),(44,NULL,'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'),(46,NULL,'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'),(62,NULL,'com.qubitproducts.hive.storage.jdbc.JdbcSerDe'),(68,NULL,'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'),(71,NULL,'org.apache.hadoop.hive.hbase.HBaseSerDe'),(73,NULL,'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'),(76,NULL,'org.apache.hadoop.hive.hbase.HBaseSerDe'),(93,NULL,'org.apache.hadoop.hive.hbase.HBaseSerDe'),(94,NULL,'com.mongodb.hadoop.hive.BSONSerDe'),(95,NULL,'org.apache.hadoop.hive.hbase.HBaseSerDe'),(96,NULL,'com.mongodb.hadoop.hive.BSONSerDe'),(97,NULL,'org.apache.hadoop.hive.hbase.HBaseSerDe'),(98,NULL,'com.mongodb.hadoop.hive.BSONSerDe'),(136,NULL,'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'),(141,NULL,'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'),(146,NULL,'com.mongodb.hadoop.hive.BSONSerDe');
/*!40000 ALTER TABLE `SERDES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERDE_PARAMS`
--

DROP TABLE IF EXISTS `SERDE_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERDE_PARAMS` (
  `SERDE_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`SERDE_ID`,`PARAM_KEY`),
  KEY `SERDE_PARAMS_N49` (`SERDE_ID`),
  CONSTRAINT `SERDE_PARAMS_FK1` FOREIGN KEY (`SERDE_ID`) REFERENCES `SERDES` (`SERDE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERDE_PARAMS`
--

LOCK TABLES `SERDE_PARAMS` WRITE;
/*!40000 ALTER TABLE `SERDE_PARAMS` DISABLE KEYS */;
INSERT INTO `SERDE_PARAMS` VALUES (6,'hbase.columns.mapping',':key,info:providerCode,info:coreEnterpriseCode,info:type,info:dueDate#binary,info:amount#binary'),(6,'serialization.format','1'),(7,'field.delim','	'),(7,'serialization.format','	'),(29,'field.delim','	'),(29,'serialization.format','	'),(43,'mongo.columns.mapping','{\"id\":\"id\"}'),(43,'serialization.format','1'),(44,'field.delim','	'),(44,'serialization.format','	'),(46,'field.delim','	'),(46,'serialization.format','	'),(62,'serialization.format','1'),(68,'field.delim','	'),(68,'serialization.format','	'),(71,'hbase.columns.mapping',':key,info:providerCode,info:coreEnterpriseCode,info:code,info:type,info:dueDate#binary,info:amount#binary,items:'),(71,'serialization.format','1'),(73,'field.delim','	'),(73,'serialization.format','	'),(76,'hbase.columns.mapping',':key,info:providerCode,info:code,info:type,info:dueDate#binary,info:amount#binary'),(76,'serialization.format','1'),(93,'hbase.columns.mapping',':key,info:providerCode,info:type,info:code,info:dueDate#binary,info:amount#binary,items:'),(93,'serialization.format','1'),(94,'mongo.columns.mapping','{\"key\":\"key\",\"providerCode\":\"providerCode\",\"coreEnterpriseCode\":\"coreEnterpriseCode\",\"entryType\":\"entryType\",\"code\":\"code\",\"dueDate\":\"dueDate\",\"amount\":\"amount\"}'),(94,'serialization.format','1'),(95,'hbase.columns.mapping',':key,info:name,info:address'),(95,'serialization.format','1'),(96,'mongo.columns.mapping','{\"key\":\"key\",\"name\":\"name\",\"address\":\"address\"}'),(96,'serialization.format','1'),(97,'hbase.columns.mapping',':key,info:code,info:sellingMethod,info:name,info:unit,info:referencePrice'),(97,'serialization.format','1'),(98,'mongo.columns.mapping','{\"key\":\"key\",\"code\":\"code\",\"sellingMethod\":\"sellingMethod\",\"name\":\"name\",\"unit\":\"unit\",\"referencePrice\":\"referencePrice\"}'),(98,'serialization.format','1'),(136,'field.delim','	'),(136,'serialization.format','	'),(141,'field.delim','	'),(141,'serialization.format','	'),(146,'mongo.columns.mapping','{\"id\":\"id\"}'),(146,'serialization.format','1');
/*!40000 ALTER TABLE `SERDE_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_COL_NAMES`
--

DROP TABLE IF EXISTS `SKEWED_COL_NAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_COL_NAMES` (
  `SD_ID` bigint(20) NOT NULL,
  `SKEWED_COL_NAME` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `SKEWED_COL_NAMES_N49` (`SD_ID`),
  CONSTRAINT `SKEWED_COL_NAMES_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_COL_NAMES`
--

LOCK TABLES `SKEWED_COL_NAMES` WRITE;
/*!40000 ALTER TABLE `SKEWED_COL_NAMES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_COL_NAMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_COL_VALUE_LOC_MAP`
--

DROP TABLE IF EXISTS `SKEWED_COL_VALUE_LOC_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_COL_VALUE_LOC_MAP` (
  `SD_ID` bigint(20) NOT NULL,
  `STRING_LIST_ID_KID` bigint(20) NOT NULL,
  `LOCATION` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`SD_ID`,`STRING_LIST_ID_KID`),
  KEY `SKEWED_COL_VALUE_LOC_MAP_N49` (`STRING_LIST_ID_KID`),
  KEY `SKEWED_COL_VALUE_LOC_MAP_N50` (`SD_ID`),
  CONSTRAINT `SKEWED_COL_VALUE_LOC_MAP_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `SKEWED_COL_VALUE_LOC_MAP_FK2` FOREIGN KEY (`STRING_LIST_ID_KID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_COL_VALUE_LOC_MAP`
--

LOCK TABLES `SKEWED_COL_VALUE_LOC_MAP` WRITE;
/*!40000 ALTER TABLE `SKEWED_COL_VALUE_LOC_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_COL_VALUE_LOC_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_STRING_LIST`
--

DROP TABLE IF EXISTS `SKEWED_STRING_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_STRING_LIST` (
  `STRING_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STRING_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_STRING_LIST`
--

LOCK TABLES `SKEWED_STRING_LIST` WRITE;
/*!40000 ALTER TABLE `SKEWED_STRING_LIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_STRING_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_STRING_LIST_VALUES`
--

DROP TABLE IF EXISTS `SKEWED_STRING_LIST_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_STRING_LIST_VALUES` (
  `STRING_LIST_ID` bigint(20) NOT NULL,
  `STRING_LIST_VALUE` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`STRING_LIST_ID`,`INTEGER_IDX`),
  KEY `SKEWED_STRING_LIST_VALUES_N49` (`STRING_LIST_ID`),
  CONSTRAINT `SKEWED_STRING_LIST_VALUES_FK1` FOREIGN KEY (`STRING_LIST_ID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_STRING_LIST_VALUES`
--

LOCK TABLES `SKEWED_STRING_LIST_VALUES` WRITE;
/*!40000 ALTER TABLE `SKEWED_STRING_LIST_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_STRING_LIST_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKEWED_VALUES`
--

DROP TABLE IF EXISTS `SKEWED_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SKEWED_VALUES` (
  `SD_ID_OID` bigint(20) NOT NULL,
  `STRING_LIST_ID_EID` bigint(20) NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID_OID`,`INTEGER_IDX`),
  KEY `SKEWED_VALUES_N50` (`SD_ID_OID`),
  KEY `SKEWED_VALUES_N49` (`STRING_LIST_ID_EID`),
  CONSTRAINT `SKEWED_VALUES_FK1` FOREIGN KEY (`SD_ID_OID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `SKEWED_VALUES_FK2` FOREIGN KEY (`STRING_LIST_ID_EID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKEWED_VALUES`
--

LOCK TABLES `SKEWED_VALUES` WRITE;
/*!40000 ALTER TABLE `SKEWED_VALUES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SKEWED_VALUES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SORT_COLS`
--

DROP TABLE IF EXISTS `SORT_COLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SORT_COLS` (
  `SD_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ORDER` int(11) NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `SORT_COLS_N49` (`SD_ID`),
  CONSTRAINT `SORT_COLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SORT_COLS`
--

LOCK TABLES `SORT_COLS` WRITE;
/*!40000 ALTER TABLE `SORT_COLS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SORT_COLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TABLE_PARAMS`
--

DROP TABLE IF EXISTS `TABLE_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TABLE_PARAMS` (
  `TBL_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`TBL_ID`,`PARAM_KEY`),
  KEY `TABLE_PARAMS_N49` (`TBL_ID`),
  CONSTRAINT `TABLE_PARAMS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TABLE_PARAMS`
--

LOCK TABLES `TABLE_PARAMS` WRITE;
/*!40000 ALTER TABLE `TABLE_PARAMS` DISABLE KEYS */;
INSERT INTO `TABLE_PARAMS` VALUES (6,'COLUMN_STATS_ACCURATE','false'),(6,'EXTERNAL','TRUE'),(6,'hbase.table.name','entry'),(6,'numFiles','0'),(6,'numRows','-1'),(6,'rawDataSize','-1'),(6,'storage_handler','org.apache.hadoop.hive.hbase.HBaseStorageHandler'),(6,'totalSize','0'),(6,'transient_lastDdlTime','1433838965'),(7,'COLUMN_STATS_ACCURATE','true'),(7,'numFiles','1'),(7,'numRows','40232'),(7,'rawDataSize','2596843'),(7,'totalSize','2637075'),(7,'transient_lastDdlTime','1433839044'),(29,'COLUMN_STATS_ACCURATE','true'),(29,'numFiles','1'),(29,'totalSize','1503660'),(29,'transient_lastDdlTime','1433906724'),(43,'COLUMN_STATS_ACCURATE','false'),(43,'EXTERNAL','TRUE'),(43,'mongo.uri','mongodb://192.168.20.33:27017/CreditRepository.LawCase'),(43,'numFiles','0'),(43,'numRows','-1'),(43,'rawDataSize','-1'),(43,'storage_handler','com.mongodb.hadoop.hive.MongoStorageHandler'),(43,'totalSize','0'),(43,'transient_lastDdlTime','1433908683'),(44,'COLUMN_STATS_ACCURATE','true'),(44,'numFiles','1'),(44,'numRows','398912'),(44,'rawDataSize','101858553'),(44,'totalSize','102257465'),(44,'transient_lastDdlTime','1433909673'),(46,'COLUMN_STATS_ACCURATE','true'),(46,'numFiles','1'),(46,'numRows','231804'),(46,'rawDataSize','14838437'),(46,'totalSize','15070241'),(46,'transient_lastDdlTime','1433998472'),(62,'COLUMN_STATS_ACCURATE','false'),(62,'EXTERNAL','TRUE'),(62,'numFiles','0'),(62,'numRows','-1'),(62,'qubit.sql.column.mapping','k=id, n=name'),(62,'qubit.sql.database.type','MYSQL'),(62,'qubit.sql.jdbc.driver','com.mysql.jdbc.Driver'),(62,'qubit.sql.jdbc.url','jdbc:mysql://192.168.20.31:3306/EnterpriseRepository?user=root&password=123456'),(62,'qubit.sql.query','SELECT id, name FROM Provider'),(62,'rawDataSize','-1'),(62,'storage_handler','com.qubitproducts.hive.storage.jdbc.JdbcStorageHandler'),(62,'totalSize','0'),(62,'transient_lastDdlTime','1435032828'),(68,'COLUMN_STATS_ACCURATE','true'),(68,'numFiles','1'),(68,'numRows','6649'),(68,'rawDataSize','445963'),(68,'totalSize','452612'),(68,'transient_lastDdlTime','1435123458'),(71,'COLUMN_STATS_ACCURATE','false'),(71,'EXTERNAL','TRUE'),(71,'hbase.table.name','entry'),(71,'numFiles','0'),(71,'numRows','-1'),(71,'rawDataSize','-1'),(71,'storage_handler','org.apache.hadoop.hive.hbase.HBaseStorageHandler'),(71,'totalSize','0'),(71,'transient_lastDdlTime','1435132888'),(73,'COLUMN_STATS_ACCURATE','true'),(73,'numFiles','1'),(73,'numRows','201327'),(73,'rawDataSize','15073578'),(73,'totalSize','15274905'),(73,'transient_lastDdlTime','1435139784'),(76,'COLUMN_STATS_ACCURATE','false'),(76,'EXTERNAL','TRUE'),(76,'hbase.table.name','entryjjl'),(76,'numFiles','0'),(76,'numRows','-1'),(76,'rawDataSize','-1'),(76,'storage_handler','org.apache.hadoop.hive.hbase.HBaseStorageHandler'),(76,'totalSize','0'),(76,'transient_lastDdlTime','1435629305'),(93,'COLUMN_STATS_ACCURATE','false'),(93,'EXTERNAL','TRUE'),(93,'hbase.table.name','entryjjl'),(93,'numFiles','0'),(93,'numRows','-1'),(93,'rawDataSize','-1'),(93,'storage_handler','org.apache.hadoop.hive.hbase.HBaseStorageHandler'),(93,'totalSize','0'),(93,'transient_lastDdlTime','1435631355'),(94,'COLUMN_STATS_ACCURATE','false'),(94,'EXTERNAL','TRUE'),(94,'mongo.uri','mongodb://192.168.30.207:27017/CreditRepository.Entry'),(94,'numFiles','0'),(94,'numRows','-1'),(94,'rawDataSize','-1'),(94,'storage_handler','com.mongodb.hadoop.hive.MongoStorageHandler'),(94,'totalSize','0'),(94,'transient_lastDdlTime','1435631355'),(95,'EXTERNAL','TRUE'),(95,'hbase.table.name','providerjjl'),(95,'storage_handler','org.apache.hadoop.hive.hbase.HBaseStorageHandler'),(95,'transient_lastDdlTime','1435633246'),(96,'EXTERNAL','TRUE'),(96,'mongo.uri','mongodb://192.168.30.207:27017/CreditRepository.Provider'),(96,'storage_handler','com.mongodb.hadoop.hive.MongoStorageHandler'),(96,'transient_lastDdlTime','1435633247'),(97,'EXTERNAL','TRUE'),(97,'hbase.table.name','productjjl'),(97,'storage_handler','org.apache.hadoop.hive.hbase.HBaseStorageHandler'),(97,'transient_lastDdlTime','1435633653'),(98,'EXTERNAL','TRUE'),(98,'mongo.uri','mongodb://192.168.30.207:27017/CreditRepository.Product'),(98,'storage_handler','com.mongodb.hadoop.hive.MongoStorageHandler'),(98,'transient_lastDdlTime','1435633654'),(136,'COLUMN_STATS_ACCURATE','true'),(136,'numFiles','1'),(136,'totalSize','8'),(136,'transient_lastDdlTime','1441863814'),(141,'COLUMN_STATS_ACCURATE','true'),(141,'numFiles','1'),(141,'totalSize','8'),(141,'transient_lastDdlTime','1441864096'),(146,'mongo.uri','mongodb://192.168.20.33:27017/CreditRepository.LawCase'),(146,'storage_handler','com.mongodb.hadoop.hive.MongoStorageHandler'),(146,'transient_lastDdlTime','1441864375');
/*!40000 ALTER TABLE `TABLE_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAB_COL_STATS`
--

DROP TABLE IF EXISTS `TAB_COL_STATS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAB_COL_STATS` (
  `CS_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `COLUMN_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `TBL_ID` bigint(20) NOT NULL,
  `LONG_LOW_VALUE` bigint(20) DEFAULT NULL,
  `LONG_HIGH_VALUE` bigint(20) DEFAULT NULL,
  `DOUBLE_HIGH_VALUE` double(53,4) DEFAULT NULL,
  `DOUBLE_LOW_VALUE` double(53,4) DEFAULT NULL,
  `BIG_DECIMAL_LOW_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `BIG_DECIMAL_HIGH_VALUE` varchar(4000) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `NUM_NULLS` bigint(20) NOT NULL,
  `NUM_DISTINCTS` bigint(20) DEFAULT NULL,
  `AVG_COL_LEN` double(53,4) DEFAULT NULL,
  `MAX_COL_LEN` bigint(20) DEFAULT NULL,
  `NUM_TRUES` bigint(20) DEFAULT NULL,
  `NUM_FALSES` bigint(20) DEFAULT NULL,
  `LAST_ANALYZED` bigint(20) NOT NULL,
  PRIMARY KEY (`CS_ID`),
  KEY `TAB_COL_STATS_FK` (`TBL_ID`),
  CONSTRAINT `TAB_COL_STATS_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAB_COL_STATS`
--

LOCK TABLES `TAB_COL_STATS` WRITE;
/*!40000 ALTER TABLE `TAB_COL_STATS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAB_COL_STATS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBLS`
--

DROP TABLE IF EXISTS `TBLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBLS` (
  `TBL_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) DEFAULT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `OWNER` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `RETENTION` int(11) NOT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  `TBL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `VIEW_EXPANDED_TEXT` mediumtext,
  `VIEW_ORIGINAL_TEXT` mediumtext,
  `LINK_TARGET_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TBL_ID`),
  UNIQUE KEY `UNIQUETABLE` (`TBL_NAME`,`DB_ID`),
  KEY `TBLS_N50` (`SD_ID`),
  KEY `TBLS_N49` (`DB_ID`),
  KEY `TBLS_N51` (`LINK_TARGET_ID`),
  CONSTRAINT `TBLS_FK1` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`),
  CONSTRAINT `TBLS_FK2` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`),
  CONSTRAINT `TBLS_FK3` FOREIGN KEY (`LINK_TARGET_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBLS`
--

LOCK TABLES `TBLS` WRITE;
/*!40000 ALTER TABLE `TBLS` DISABLE KEYS */;
INSERT INTO `TBLS` VALUES (6,1433838965,1,0,'data',0,6,'entry','EXTERNAL_TABLE',NULL,NULL,NULL),(7,1433838966,1,0,'data',0,7,'summary','MANAGED_TABLE',NULL,NULL,NULL),(29,1433906724,1,0,'data',0,29,'provider','MANAGED_TABLE',NULL,NULL,NULL),(43,1433908683,1,0,'data',0,43,'law','EXTERNAL_TABLE',NULL,NULL,NULL),(44,1433908683,1,0,'data',0,44,'lawsummary','MANAGED_TABLE',NULL,NULL,NULL),(46,1433998395,1,0,'data',0,46,'entryexport','MANAGED_TABLE',NULL,NULL,NULL),(62,1435032828,1,0,'data',0,62,'providerdirect','EXTERNAL_TABLE',NULL,NULL,NULL),(68,1435123405,1,0,'data',0,68,'basicstatistics','MANAGED_TABLE',NULL,NULL,NULL),(71,1435132888,1,0,'data',0,71,'entrywithitems','EXTERNAL_TABLE',NULL,NULL,NULL),(73,1435139703,1,0,'data',0,73,'productorientedstatistics','MANAGED_TABLE',NULL,NULL,NULL),(76,1435629305,1,0,'data',0,76,'jjlentrywithitems','EXTERNAL_TABLE',NULL,NULL,NULL),(93,1435631355,1,0,'data',0,93,'jjlentryhbase','EXTERNAL_TABLE',NULL,NULL,NULL),(94,1435631355,1,0,'data',0,94,'jjlentrymongo','EXTERNAL_TABLE',NULL,NULL,NULL),(95,1435633246,1,0,'data',0,95,'providerhbase','EXTERNAL_TABLE',NULL,NULL,NULL),(96,1435633247,1,0,'data',0,96,'providermongo','EXTERNAL_TABLE',NULL,NULL,NULL),(97,1435633653,1,0,'data',0,97,'producthbase','EXTERNAL_TABLE',NULL,NULL,NULL),(98,1435633654,1,0,'data',0,98,'productmongo','EXTERNAL_TABLE',NULL,NULL,NULL),(136,1441863812,1,0,'data',0,136,'testhivedrivertable','MANAGED_TABLE',NULL,NULL,NULL),(141,1441864094,1,0,'data',0,141,'testhivedrivertable1','MANAGED_TABLE',NULL,NULL,NULL),(146,1441864375,1,0,'data',0,146,'lawpure','MANAGED_TABLE',NULL,NULL,NULL);
/*!40000 ALTER TABLE `TBLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_COL_PRIVS`
--

DROP TABLE IF EXISTS `TBL_COL_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_COL_PRIVS` (
  `TBL_COLUMN_GRANT_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_COL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TBL_COLUMN_GRANT_ID`),
  KEY `TABLECOLUMNPRIVILEGEINDEX` (`TBL_ID`,`COLUMN_NAME`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`TBL_COL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `TBL_COL_PRIVS_N49` (`TBL_ID`),
  CONSTRAINT `TBL_COL_PRIVS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_COL_PRIVS`
--

LOCK TABLES `TBL_COL_PRIVS` WRITE;
/*!40000 ALTER TABLE `TBL_COL_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_COL_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PRIVS`
--

DROP TABLE IF EXISTS `TBL_PRIVS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PRIVS` (
  `TBL_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_PRIV` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TBL_GRANT_ID`),
  KEY `TBL_PRIVS_N49` (`TBL_ID`),
  KEY `TABLEPRIVILEGEINDEX` (`TBL_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`TBL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  CONSTRAINT `TBL_PRIVS_FK1` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PRIVS`
--

LOCK TABLES `TBL_PRIVS` WRITE;
/*!40000 ALTER TABLE `TBL_PRIVS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_PRIVS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TXNS`
--

DROP TABLE IF EXISTS `TXNS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TXNS` (
  `TXN_ID` bigint(20) NOT NULL,
  `TXN_STATE` char(1) NOT NULL,
  `TXN_STARTED` bigint(20) NOT NULL,
  `TXN_LAST_HEARTBEAT` bigint(20) NOT NULL,
  `TXN_USER` varchar(128) NOT NULL,
  `TXN_HOST` varchar(128) NOT NULL,
  PRIMARY KEY (`TXN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TXNS`
--

LOCK TABLES `TXNS` WRITE;
/*!40000 ALTER TABLE `TXNS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TXNS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TXN_COMPONENTS`
--

DROP TABLE IF EXISTS `TXN_COMPONENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TXN_COMPONENTS` (
  `TC_TXNID` bigint(20) DEFAULT NULL,
  `TC_DATABASE` varchar(128) NOT NULL,
  `TC_TABLE` varchar(128) DEFAULT NULL,
  `TC_PARTITION` varchar(767) DEFAULT NULL,
  KEY `TC_TXNID` (`TC_TXNID`),
  CONSTRAINT `TXN_COMPONENTS_ibfk_1` FOREIGN KEY (`TC_TXNID`) REFERENCES `TXNS` (`TXN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TXN_COMPONENTS`
--

LOCK TABLES `TXN_COMPONENTS` WRITE;
/*!40000 ALTER TABLE `TXN_COMPONENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TXN_COMPONENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPES`
--

DROP TABLE IF EXISTS `TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TYPES` (
  `TYPES_ID` bigint(20) NOT NULL,
  `TYPE_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TYPE1` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `TYPE2` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`TYPES_ID`),
  UNIQUE KEY `UNIQUE_TYPE` (`TYPE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPES`
--

LOCK TABLES `TYPES` WRITE;
/*!40000 ALTER TABLE `TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TYPE_FIELDS`
--

DROP TABLE IF EXISTS `TYPE_FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TYPE_FIELDS` (
  `TYPE_NAME` bigint(20) NOT NULL,
  `COMMENT` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `FIELD_NAME` varchar(128) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `FIELD_TYPE` varchar(767) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`TYPE_NAME`,`FIELD_NAME`),
  KEY `TYPE_FIELDS_N49` (`TYPE_NAME`),
  CONSTRAINT `TYPE_FIELDS_FK1` FOREIGN KEY (`TYPE_NAME`) REFERENCES `TYPES` (`TYPES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TYPE_FIELDS`
--

LOCK TABLES `TYPE_FIELDS` WRITE;
/*!40000 ALTER TABLE `TYPE_FIELDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TYPE_FIELDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VERSION`
--

DROP TABLE IF EXISTS `VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VERSION` (
  `VER_ID` bigint(20) NOT NULL,
  `SCHEMA_VERSION` varchar(127) NOT NULL,
  `VERSION_COMMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERSION`
--

LOCK TABLES `VERSION` WRITE;
/*!40000 ALTER TABLE `VERSION` DISABLE KEYS */;
INSERT INTO `VERSION` VALUES (1,'1.2.0','Hive release version 1.2.0');
/*!40000 ALTER TABLE `VERSION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-20 15:31:45
