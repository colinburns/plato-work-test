/*
 Navicat Premium Data Transfer

 Source Server         : NEW-LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 50622
 Source Host           : localhost
 Source Database       : plato-work-test

 Target Server Type    : MySQL
 Target Server Version : 50622
 File Encoding         : utf-8

 Date: 05/18/2015 19:48:20 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `ContactForm`
-- ----------------------------
DROP TABLE IF EXISTS `ContactForm`;
CREATE TABLE `ContactForm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ContactForm') CHARACTER SET utf8 DEFAULT 'ContactForm',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FullName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Location` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PreferredBeverage` enum('Coffee','Tea','Coca Cola','Water') CHARACTER SET utf8 DEFAULT 'Coffee',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ErrorPage`
-- ----------------------------
DROP TABLE IF EXISTS `ErrorPage`;
CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `ErrorPage`
-- ----------------------------
BEGIN;
INSERT INTO `ErrorPage` VALUES ('4', '404'), ('5', '500');
COMMIT;

-- ----------------------------
--  Table structure for `ErrorPage_Live`
-- ----------------------------
DROP TABLE IF EXISTS `ErrorPage_Live`;
CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `ErrorPage_Live`
-- ----------------------------
BEGIN;
INSERT INTO `ErrorPage_Live` VALUES ('4', '404'), ('5', '500');
COMMIT;

-- ----------------------------
--  Table structure for `ErrorPage_versions`
-- ----------------------------
DROP TABLE IF EXISTS `ErrorPage_versions`;
CREATE TABLE `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `ErrorPage_versions`
-- ----------------------------
BEGIN;
INSERT INTO `ErrorPage_versions` VALUES ('1', '4', '1', '404'), ('2', '5', '1', '500');
COMMIT;

-- ----------------------------
--  Table structure for `File`
-- ----------------------------
DROP TABLE IF EXISTS `File`;
CREATE TABLE `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Folder','Image','Image_Cached') CHARACTER SET utf8 DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Filename` mediumtext CHARACTER SET utf8,
  `Content` mediumtext CHARACTER SET utf8,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `File`
-- ----------------------------
BEGIN;
INSERT INTO `File` VALUES ('1', 'Folder', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'Uploads', 'Uploads', 'assets/Uploads/', null, '1', '0', '0'), ('2', 'Image', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'SilverStripeLogo.png', 'SilverStripeLogo.png', 'assets/Uploads/SilverStripeLogo.png', null, '1', '1', '0'), ('3', 'File', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'error-404.html', 'error-404.html', 'assets/error-404.html', null, '1', '0', '0'), ('4', 'File', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'error-500.html', 'error-500.html', 'assets/error-500.html', null, '1', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `Group`
-- ----------------------------
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') CHARACTER SET utf8 DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `Code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext CHARACTER SET utf8,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `Group`
-- ----------------------------
BEGIN;
INSERT INTO `Group` VALUES ('1', 'Group', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'Content Authors', null, 'content-authors', '0', '1', null, '0'), ('2', 'Group', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'Administrators', null, 'administrators', '0', '0', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `Group_Members`
-- ----------------------------
DROP TABLE IF EXISTS `Group_Members`;
CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `Group_Members`
-- ----------------------------
BEGIN;
INSERT INTO `Group_Members` VALUES ('1', '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `Group_Roles`
-- ----------------------------
DROP TABLE IF EXISTS `Group_Roles`;
CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `LoginAttempt`
-- ----------------------------
DROP TABLE IF EXISTS `LoginAttempt`;
CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') CHARACTER SET utf8 DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8 DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Member`
-- ----------------------------
DROP TABLE IF EXISTS `Member`;
CREATE TABLE `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') CHARACTER SET utf8 DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Surname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `TempIDHash` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `RememberLoginToken` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `TimeFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `Member`
-- ----------------------------
BEGIN;
INSERT INTO `Member` VALUES ('1', 'Member', '2015-05-17 16:19:41', '2015-05-17 16:29:35', 'Default Admin', null, 'admin', '936c44758183b4b6803a90d3a4fdfbac363dd46d', '2015-05-20 16:29:35', '$2y$10$10958893ee35f113f6275OZ4E/qZaNYSMzawVFQUU9rwWPl.1Iyd2', '$2y$10$10958893ee35f113f6275O8KFhH72t1kigLiUIfPZ.lvXl.YJIvey', '1', '2015-05-18 19:47:55', null, null, 'blowfish', '10$10958893ee35f113f6275c', null, null, 'en_US', '0', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `MemberPassword`
-- ----------------------------
DROP TABLE IF EXISTS `MemberPassword`;
CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') CHARACTER SET utf8 DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `MemberPassword`
-- ----------------------------
BEGIN;
INSERT INTO `MemberPassword` VALUES ('1', 'MemberPassword', '2015-05-17 16:19:41', '2015-05-17 16:19:41', '$2y$10$10958893ee35f113f6275OZ4E/qZaNYSMzawVFQUU9rwWPl.1Iyd2', '10$10958893ee35f113f6275c', 'blowfish', '1');
COMMIT;

-- ----------------------------
--  Table structure for `Permission`
-- ----------------------------
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') CHARACTER SET utf8 DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `Permission`
-- ----------------------------
BEGIN;
INSERT INTO `Permission` VALUES ('1', 'Permission', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'CMS_ACCESS_CMSMain', '0', '1', '1'), ('2', 'Permission', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'CMS_ACCESS_AssetAdmin', '0', '1', '1'), ('3', 'Permission', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'CMS_ACCESS_ReportAdmin', '0', '1', '1'), ('4', 'Permission', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'SITETREE_REORGANISE', '0', '1', '1'), ('5', 'Permission', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'ADMIN', '0', '1', '2');
COMMIT;

-- ----------------------------
--  Table structure for `PermissionRole`
-- ----------------------------
DROP TABLE IF EXISTS `PermissionRole`;
CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') CHARACTER SET utf8 DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `PermissionRoleCode`
-- ----------------------------
DROP TABLE IF EXISTS `PermissionRoleCode`;
CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') CHARACTER SET utf8 DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `RedirectorPage`
-- ----------------------------
DROP TABLE IF EXISTS `RedirectorPage`;
CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `RedirectorPage_Live`
-- ----------------------------
DROP TABLE IF EXISTS `RedirectorPage_Live`;
CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `RedirectorPage_versions`
-- ----------------------------
DROP TABLE IF EXISTS `RedirectorPage_versions`;
CREATE TABLE `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SiteConfig`
-- ----------------------------
DROP TABLE IF EXISTS `SiteConfig`;
CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') CHARACTER SET utf8 DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Theme` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `WebAdminEmail` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `WebAdminName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `SiteConfig`
-- ----------------------------
BEGIN;
INSERT INTO `SiteConfig` VALUES ('1', 'SiteConfig', '2015-05-17 16:19:41', '2015-05-18 19:47:55', 'Plato Work Test', null, 'simple', 'Anyone', 'LoggedInUsers', 'LoggedInUsers', 'webadmin@platocreative.co.nz', 'Plato Creative Web Admin');
COMMIT;

-- ----------------------------
--  Table structure for `SiteConfig_CreateTopLevelGroups`
-- ----------------------------
DROP TABLE IF EXISTS `SiteConfig_CreateTopLevelGroups`;
CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SiteConfig_EditorGroups`
-- ----------------------------
DROP TABLE IF EXISTS `SiteConfig_EditorGroups`;
CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SiteConfig_ViewerGroups`
-- ----------------------------
DROP TABLE IF EXISTS `SiteConfig_ViewerGroups`;
CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SiteTree`
-- ----------------------------
DROP TABLE IF EXISTS `SiteTree`;
CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `SiteTree`
-- ----------------------------
BEGIN;
INSERT INTO `SiteTree` VALUES ('1', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'home', 'Home', null, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>', null, null, '1', '1', '1', '0', '0', null, 'Inherit', 'Inherit', '1', '0'), ('2', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'about-us', 'About Us', null, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', null, null, '1', '1', '2', '0', '0', null, 'Inherit', 'Inherit', '1', '0'), ('3', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'contact-us', 'Contact Us', null, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', null, null, '1', '1', '3', '0', '0', null, 'Inherit', 'Inherit', '1', '0'), ('4', 'ErrorPage', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'page-not-found', 'Page not found', null, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', null, null, '0', '0', '4', '0', '0', null, 'Inherit', 'Inherit', '1', '0'), ('5', 'ErrorPage', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'server-error', 'Server error', null, '<p>Sorry, there was a problem with handling your request.</p>', null, null, '0', '0', '5', '0', '0', null, 'Inherit', 'Inherit', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `SiteTree_EditorGroups`
-- ----------------------------
DROP TABLE IF EXISTS `SiteTree_EditorGroups`;
CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SiteTree_ImageTracking`
-- ----------------------------
DROP TABLE IF EXISTS `SiteTree_ImageTracking`;
CREATE TABLE `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SiteTree_LinkTracking`
-- ----------------------------
DROP TABLE IF EXISTS `SiteTree_LinkTracking`;
CREATE TABLE `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SiteTree_Live`
-- ----------------------------
DROP TABLE IF EXISTS `SiteTree_Live`;
CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `SiteTree_Live`
-- ----------------------------
BEGIN;
INSERT INTO `SiteTree_Live` VALUES ('1', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'home', 'Home', null, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>', null, null, '1', '1', '1', '0', '0', null, 'Inherit', 'Inherit', '1', '0'), ('2', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'about-us', 'About Us', null, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', null, null, '1', '1', '2', '0', '0', null, 'Inherit', 'Inherit', '1', '0'), ('3', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'contact-us', 'Contact Us', null, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', null, null, '1', '1', '3', '0', '0', null, 'Inherit', 'Inherit', '1', '0'), ('4', 'ErrorPage', '2015-05-17 16:19:41', '2015-05-17 16:19:45', 'page-not-found', 'Page not found', null, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', null, null, '0', '0', '4', '0', '0', null, 'Inherit', 'Inherit', '1', '0'), ('5', 'ErrorPage', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'server-error', 'Server error', null, '<p>Sorry, there was a problem with handling your request.</p>', null, null, '0', '0', '5', '0', '0', null, 'Inherit', 'Inherit', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `SiteTree_ViewerGroups`
-- ----------------------------
DROP TABLE IF EXISTS `SiteTree_ViewerGroups`;
CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `SiteTree_versions`
-- ----------------------------
DROP TABLE IF EXISTS `SiteTree_versions`;
CREATE TABLE `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `SiteTree_versions`
-- ----------------------------
BEGIN;
INSERT INTO `SiteTree_versions` VALUES ('1', '1', '1', '1', '0', '0', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'home', 'Home', null, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>. You can now access the <a href=\"http://doc.silverstripe.org\">developer documentation</a>, or begin <a href=\"http://doc.silverstripe.org/doku.php?id=tutorials\">the tutorials.</a></p>', null, null, '1', '1', '1', '0', '0', null, 'Inherit', 'Inherit', '0'), ('2', '2', '1', '1', '0', '0', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'about-us', 'About Us', null, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', null, null, '1', '1', '2', '0', '0', null, 'Inherit', 'Inherit', '0'), ('3', '3', '1', '1', '0', '0', 'Page', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'contact-us', 'Contact Us', null, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br /></p>', null, null, '1', '1', '3', '0', '0', null, 'Inherit', 'Inherit', '0'), ('4', '4', '1', '1', '0', '0', 'ErrorPage', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'page-not-found', 'Page not found', null, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', null, null, '0', '0', '4', '0', '0', null, 'Inherit', 'Inherit', '0'), ('5', '5', '1', '1', '0', '0', 'ErrorPage', '2015-05-17 16:19:41', '2015-05-17 16:19:41', 'server-error', 'Server error', null, '<p>Sorry, there was a problem with handling your request.</p>', null, null, '0', '0', '5', '0', '0', null, 'Inherit', 'Inherit', '0');
COMMIT;

-- ----------------------------
--  Table structure for `VirtualPage`
-- ----------------------------
DROP TABLE IF EXISTS `VirtualPage`;
CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `VirtualPage_Live`
-- ----------------------------
DROP TABLE IF EXISTS `VirtualPage_Live`;
CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `VirtualPage_versions`
-- ----------------------------
DROP TABLE IF EXISTS `VirtualPage_versions`;
CREATE TABLE `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
