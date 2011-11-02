
-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_author` ***

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_checkbox` ***
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (8, 40, 'off', NULL);
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (7, 41, 'on', NULL);

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_date` ***
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (27, 46, 'yes');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (21, 22, 'yes');

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (57, 45, '/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (31, 11, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (15, 8, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (66, 33, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (67, 43, '/^-?(?:\\d+(?:\\.\\d+)?|\\.\\d+)$/i');

-- *** STRUCTURE: `tbl_fields_memberactivation` ***
DROP TABLE IF EXISTS `tbl_fields_memberactivation`;
CREATE TABLE `tbl_fields_memberactivation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `code_expiry` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `activation_role_id` int(11) unsigned NOT NULL,
  `deny_login` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberactivation` ***
INSERT INTO `tbl_fields_memberactivation` (`id`, `field_id`, `code_expiry`, `activation_role_id`, `deny_login`) VALUES (5, 7, '1 hour', 1, 'yes');

-- *** STRUCTURE: `tbl_fields_memberemail` ***
DROP TABLE IF EXISTS `tbl_fields_memberemail`;
CREATE TABLE `tbl_fields_memberemail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberemail` ***
INSERT INTO `tbl_fields_memberemail` (`id`, `field_id`) VALUES (8, 4);

-- *** STRUCTURE: `tbl_fields_memberpassword` ***
DROP TABLE IF EXISTS `tbl_fields_memberpassword`;
CREATE TABLE `tbl_fields_memberpassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_expiry` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberpassword` ***
INSERT INTO `tbl_fields_memberpassword` (`id`, `field_id`, `length`, `strength`, `salt`, `code_expiry`) VALUES (8, 5, 6, 'weak', 'ixi', '1 hour');

-- *** STRUCTURE: `tbl_fields_memberrole` ***
DROP TABLE IF EXISTS `tbl_fields_memberrole`;
CREATE TABLE `tbl_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_role` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberrole` ***

-- *** STRUCTURE: `tbl_fields_memberusername` ***
DROP TABLE IF EXISTS `tbl_fields_memberusername`;
CREATE TABLE `tbl_fields_memberusername` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberusername` ***
INSERT INTO `tbl_fields_memberusername` (`id`, `field_id`, `validator`) VALUES (2, 10, NULL);

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_select` ***

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_selectbox_link` ***
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (66, 31, 'no', 'yes', 10, 1);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (67, 32, 'no', 'yes', 11, 1);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (35, 36, 'no', 'yes', 10, 1);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (36, 37, 'no', 'yes', 33, 1);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (52, 38, 'no', 'yes', 33, 1);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (53, 39, 'no', 'yes', 10, 1);
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (68, 42, 'no', 'no', 10, 1);

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_taglist` ***

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (5, 9, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (36, 34, 'markdown', 15);
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (26, 21, 'markdown', 15);

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_upload` ***

-- *** STRUCTURE: `tbl_entries_data_10` ***
DROP TABLE IF EXISTS `tbl_entries_data_10`;
CREATE TABLE `tbl_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`handle`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_10` ***
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (20, 3, 'Mister Alone', 'mister-alone');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (2, 4, 'good', 'good');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (3, 5, 222, 222);
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (4, 6, 22222, 22222);
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (5, 7, '111sss', '111sss');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (6, 8, 'shyuka', 'shyuka');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (7, 9, 'mohammed', 'mohammed');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (21, 10, 'satan', 'satan');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (9, 48, 'Ussama B, Laden', 'ussama-b-laden');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (22, 49, 'Jesus C.', 'jesus-c');
INSERT INTO `tbl_entries_data_10` (`id`, `entry_id`, `value`, `handle`) VALUES (12, 177, 'Miki', 'miki');

-- *** STRUCTURE: `tbl_entries_data_11` ***
DROP TABLE IF EXISTS `tbl_entries_data_11`;
CREATE TABLE `tbl_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_11` ***
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 11, 'sample-category', 'Sample Category');
INSERT INTO `tbl_entries_data_11` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 19, 'another-category', 'Another Category');

-- *** STRUCTURE: `tbl_entries_data_21` ***
DROP TABLE IF EXISTS `tbl_entries_data_21`;
CREATE TABLE `tbl_entries_data_21` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_21` ***
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (76, 174, 'We can not lose those..', '<p>We can not lose those..</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (78, 176, 'We can\'t win.', '<p>We can\'t win.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (79, 179, 'By Miki!', '<p>By Miki!</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (80, 191, 'Is phantom.', '<p>Is phantom.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (81, 193, 'I\'m inolved!', '<p>I\'m inolved!</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (82, 194, 'For sure!!!', '<p>For sure!!!</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (83, 196, 'I want to participate too.', '<p>I want to participate too.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (84, 198, 'I wanna be involved too!', '<p>I wanna be involved too!</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (95, 199, '**I\'m curious !**', '<p><strong>I\'m curious !</strong></p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (96, 201, 'The counting has began!', '<p>The counting has began!</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (98, 203, +1, '<p>+1</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (100, 204, +1, '<p>+1</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (101, 205, 'why', '<p>why</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (102, 206, 'not', '<p>not</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (103, 207, 'why', '<p>why</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (104, 208, 'where', '<p>where</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (108, 209, 'Winning the battle, loosing the war.', '<p>Winning the battle, loosing the war.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (109, 210, 'Building a long sentence is not an easy task.', '<p>Building a long sentence is not an easy task.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (111, 211, '_Updating_ this very important topic.', '<p><em>Updating</em> this very important topic.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (112, 213, 'reality//', '<p>reality//</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (143, 214, 'what in the world..', '<p>what in the world..</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (114, 216, 'If you want to statisfy your soul - go to sleep. \r\n\r\nI\'m the satan, will teach you good.', '<p>If you want to statisfy your soul - go to sleep. </p>\n\n<p>I\'m the satan, will teach you good.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (122, 219, 'Sleeping is worst thing in the world. Less sleep -> sleep lesS. \r\n\r\nThis is my tactics.', '<p>Sleeping is worst thing in the world. Less sleep -> sleep lesS. </p>\n\n<p>This is my tactics.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (120, 223, 'Hello there!', '<p>Hello there!</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (117, 229, 'nonsense...', '<p>nonsense...</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (118, 230, 'nonsense?', '<p>nonsense?</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (121, 233, 'What in the world..', '<p>What in the world..</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (123, 234, 'Mister Alone', '<p>Mister Alone</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (124, 235, 'come on. cheat them all. coo\r\nome on.', '<p>come on. cheat them all. coo\nome on.</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (125, 236, 'try try', '<p>try try</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (126, 237, 'try', '<p>try</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (127, 238, 'and again...', '<p>and again...</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (134, 239, 'Hope it\'ll work! 8!', '<p>Hope it\'ll work! 8!</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (129, 241, 'do not lie', '<p>do not lie</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (130, 242, '!', '<p>!</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (132, 243, 'iiiiiiiiiiii', '<p>iiiiiiiiiiii</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (142, 251, 5, '<p>5</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (144, 253, 'sense', '<p>sense</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (145, 254, 'again..', '<p>again..</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (146, 256, 'happy spam time', '<p>happy spam time</p>\n');
INSERT INTO `tbl_entries_data_21` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (147, 257, 'dzin...', '<p>dzin...</p>\n');

-- *** STRUCTURE: `tbl_entries_data_22` ***
DROP TABLE IF EXISTS `tbl_entries_data_22`;
CREATE TABLE `tbl_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_22` ***
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (76, 174, '2011-10-22T13:39:53+04:00', 1319276393, 1319276393);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (78, 176, '2011-10-22T13:40:41+04:00', 1319276441, 1319276441);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (79, 179, '2011-10-22T17:01:59+04:00', 1319288519, 1319288519);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (80, 191, '2011-10-22T17:25:11+04:00', 1319289911, 1319289911);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (81, 193, '2011-10-22T17:32:47+04:00', 1319290367, 1319290367);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (82, 194, '2011-10-22T17:33:35+04:00', 1319290415, 1319290415);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (83, 196, '2011-10-22T18:00:21+04:00', 1319292021, 1319292021);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (84, 198, '2011-10-22T18:55:28+04:00', 1319295328, 1319295328);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (95, 199, '2011-10-22T22:52:46+04:00', 1319309566, 1319309566);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (96, 201, '2011-10-22T23:44:11+04:00', 1319312651, 1319312651);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (98, 203, '2011-10-22T23:45:56+04:00', 1319312756, 1319312756);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (100, 204, '2011-10-22T23:47:00+04:00', 1319312820, 1319312820);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (101, 205, '2011-10-22T23:48:46+04:00', 1319312926, 1319312926);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (102, 206, '2011-10-22T23:50:04+04:00', 1319313004, 1319313004);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (103, 207, '2011-10-22T23:50:35+04:00', 1319313035, 1319313035);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (104, 208, '2011-10-22T23:51:03+04:00', 1319313063, 1319313063);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (108, 209, '2011-10-22T23:55:15+04:00', 1319313315, 1319313315);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (109, 210, '2011-10-22T23:56:43+04:00', 1319313403, 1319313403);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (111, 211, '2011-10-23T00:00:39+04:00', 1319313639, 1319313639);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (112, 213, '2011-10-23T00:01:19+04:00', 1319313679, 1319313679);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (143, 214, '2011-10-23T00:05:36+04:00', 1319313936, 1319313936);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (114, 216, '2011-10-23T00:06:33+04:00', 1319313993, 1319313993);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (122, 219, '2011-10-23T00:09:10+04:00', 1319314150, 1319314150);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (120, 223, '2011-10-23T00:09:52+04:00', 1319314192, 1319314192);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (117, 229, '2011-10-23T01:44:40+04:00', 1319319880, 1319319880);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (118, 230, '2011-10-23T01:44:50+04:00', 1319319890, 1319319890);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (121, 233, '2011-10-23T17:20:57+04:00', 1319376057, 1319376057);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (123, 234, '2011-10-23T22:59:34+04:00', 1319396374, 1319396374);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (124, 235, '2011-10-23T23:00:40+04:00', 1319396440, 1319396440);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (125, 236, '2011-10-23T23:01:19+04:00', 1319396479, 1319396479);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (126, 237, '2011-10-23T23:04:56+04:00', 1319396696, 1319396696);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (127, 238, '2011-10-23T23:13:25+04:00', 1319397205, 1319397205);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (134, 239, '2011-10-23T23:23:22+04:00', 1319397802, 1319397802);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (129, 241, '2011-10-23T23:29:40+04:00', 1319398180, 1319398180);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (130, 242, '2011-10-23T23:37:59+04:00', 1319398679, 1319398679);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (132, 243, '2011-11-01T19:41:52+03:00', 1320165712, 1320165712);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (142, 251, '2011-11-02T14:04:10+03:00', 1320231850, 1320231850);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (144, 253, '2011-11-02T14:09:36+03:00', 1320232176, 1320232176);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (145, 254, '2011-11-02T14:10:53+03:00', 1320232253, 1320232253);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (146, 256, '2011-11-02T14:11:15+03:00', 1320232275, 1320232275);
INSERT INTO `tbl_entries_data_22` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (147, 257, '2011-11-02T14:19:49+03:00', 1320232789, 1320232789);

-- *** STRUCTURE: `tbl_entries_data_31` ***
DROP TABLE IF EXISTS `tbl_entries_data_31`;
CREATE TABLE `tbl_entries_data_31` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_31` ***
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `relation_id`) VALUES (72, 173, 10);
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `relation_id`) VALUES (51, 178, 177);
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `relation_id`) VALUES (68, 190, 10);
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `relation_id`) VALUES (70, 200, 177);
INSERT INTO `tbl_entries_data_31` (`id`, `entry_id`, `relation_id`) VALUES (71, 215, 10);

-- *** STRUCTURE: `tbl_entries_data_32` ***
DROP TABLE IF EXISTS `tbl_entries_data_32`;
CREATE TABLE `tbl_entries_data_32` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_32` ***
INSERT INTO `tbl_entries_data_32` (`id`, `entry_id`, `relation_id`) VALUES (72, 173, 11);
INSERT INTO `tbl_entries_data_32` (`id`, `entry_id`, `relation_id`) VALUES (51, 178, 19);
INSERT INTO `tbl_entries_data_32` (`id`, `entry_id`, `relation_id`) VALUES (68, 190, 19);
INSERT INTO `tbl_entries_data_32` (`id`, `entry_id`, `relation_id`) VALUES (70, 200, 11);
INSERT INTO `tbl_entries_data_32` (`id`, `entry_id`, `relation_id`) VALUES (71, 215, 19);

-- *** STRUCTURE: `tbl_entries_data_33` ***
DROP TABLE IF EXISTS `tbl_entries_data_33`;
CREATE TABLE `tbl_entries_data_33` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_33` ***
INSERT INTO `tbl_entries_data_33` (`id`, `entry_id`, `handle`, `value`) VALUES (72, 173, 'micro-battles-inside-our-heads', 'Micro battles inside our heads.');
INSERT INTO `tbl_entries_data_33` (`id`, `entry_id`, `handle`, `value`) VALUES (51, 178, 'test-thread-1', 'Test thread #1');
INSERT INTO `tbl_entries_data_33` (`id`, `entry_id`, `handle`, `value`) VALUES (68, 190, 'satans-reign', 'Satan\'s reign.');
INSERT INTO `tbl_entries_data_33` (`id`, `entry_id`, `handle`, `value`) VALUES (70, 200, 'this-is-completely-new-school', 'This is completely new school.');
INSERT INTO `tbl_entries_data_33` (`id`, `entry_id`, `handle`, `value`) VALUES (71, 215, 'again-we-just-floating-around', 'Again, we just floating around.');

-- *** STRUCTURE: `tbl_entries_data_34` ***
DROP TABLE IF EXISTS `tbl_entries_data_34`;
CREATE TABLE `tbl_entries_data_34` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_34` ***
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (72, 173, 'We can not lose those..', '<p>We can not lose those..</p>\n');
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (51, 178, 'By Miki!', '<p>By Miki!</p>\n');
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (68, 190, 'Is phantom.', '<p>Is phantom.</p>\n');
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (70, 200, 'The counting has began!', '<p>The counting has began!</p>\n');
INSERT INTO `tbl_entries_data_34` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (71, 215, 'If you want to statisfy your soul - go to sleep. \r\n\r\nI\'m the satan, will teach you good. x.', '<p>If you want to statisfy your soul - go to sleep. </p>\n\n<p>I\'m the satan, will teach you good. x.</p>\n');

-- *** STRUCTURE: `tbl_entries_data_36` ***
DROP TABLE IF EXISTS `tbl_entries_data_36`;
CREATE TABLE `tbl_entries_data_36` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_36` ***
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (76, 174, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (78, 176, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (79, 179, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (80, 191, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (81, 193, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (82, 194, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (83, 196, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (84, 198, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (95, 199, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (96, 201, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (98, 203, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (100, 204, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (101, 205, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (102, 206, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (103, 207, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (104, 208, 177);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (108, 209, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (109, 210, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (111, 211, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (112, 213, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (143, 214, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (114, 216, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (122, 219, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (120, 223, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (117, 229, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (118, 230, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (121, 233, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (123, 234, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (124, 235, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (125, 236, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (126, 237, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (127, 238, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (134, 239, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (129, 241, 49);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (130, 242, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (132, 243, 3);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (142, 251, 10);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (144, 253, 49);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (145, 254, 49);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (146, 256, 49);
INSERT INTO `tbl_entries_data_36` (`id`, `entry_id`, `relation_id`) VALUES (147, 257, 49);

-- *** STRUCTURE: `tbl_entries_data_37` ***
DROP TABLE IF EXISTS `tbl_entries_data_37`;
CREATE TABLE `tbl_entries_data_37` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_37` ***
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (76, 174, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (78, 176, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (79, 179, 178);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (80, 191, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (81, 193, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (82, 194, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (83, 196, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (84, 198, 178);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (95, 199, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (96, 201, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (98, 203, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (100, 204, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (101, 205, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (102, 206, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (103, 207, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (104, 208, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (108, 209, 178);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (109, 210, 178);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (111, 211, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (112, 213, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (143, 214, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (114, 216, 215);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (122, 219, 215);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (120, 223, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (117, 229, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (118, 230, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (121, 233, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (123, 234, 178);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (124, 235, 178);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (125, 236, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (126, 237, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (127, 238, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (134, 239, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (129, 241, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (130, 242, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (132, 243, 173);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (142, 251, 190);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (144, 253, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (145, 254, 200);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (146, 256, 215);
INSERT INTO `tbl_entries_data_37` (`id`, `entry_id`, `relation_id`) VALUES (147, 257, 173);

-- *** STRUCTURE: `tbl_entries_data_38` ***
DROP TABLE IF EXISTS `tbl_entries_data_38`;
CREATE TABLE `tbl_entries_data_38` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_38` ***
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (275, 232, 190);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (265, 226, 178);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (131, 197, 178);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (159, 175, 173);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (274, 227, 173);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (279, 217, 215);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (308, 212, 200);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (158, 202, 200);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (303, 188, 173);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (301, 192, 190);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (170, 189, 178);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (125, 195, 190);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (236, 231, 215);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (276, 228, 200);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (319, 240, 173);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (311, 252, 200);
INSERT INTO `tbl_entries_data_38` (`id`, `entry_id`, `relation_id`) VALUES (314, 255, 215);

-- *** STRUCTURE: `tbl_entries_data_39` ***
DROP TABLE IF EXISTS `tbl_entries_data_39`;
CREATE TABLE `tbl_entries_data_39` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_39` ***
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (275, 232, 3);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (265, 226, 3);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (131, 197, 177);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (159, 175, 177);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (274, 227, 3);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (279, 217, 10);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (308, 212, 10);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (158, 202, 177);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (303, 188, 10);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (301, 192, 10);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (170, 189, 10);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (125, 195, 177);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (236, 231, 3);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (276, 228, 3);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (319, 240, 49);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (311, 252, 49);
INSERT INTO `tbl_entries_data_39` (`id`, `entry_id`, `relation_id`) VALUES (314, 255, 49);

-- *** STRUCTURE: `tbl_entries_data_4` ***
DROP TABLE IF EXISTS `tbl_entries_data_4`;
CREATE TABLE `tbl_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_4` ***
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (8, 8, 'shyka@pool.in');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (22, 3, 'alone@theplanet.com');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (4, 4, 'good@good.com');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (5, 5, 'programmer@ass.com');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (6, 6, 'pro2grammer@ass.com');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (7, 7, 'pro2gramsmer@ass.com');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (9, 9, 'moh@amed.ru');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (23, 10, 'bitch@bitch.eu');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (11, 48, 'ussama@alquaeda.eu');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (24, 49, 'jesus@everywhere.org');
INSERT INTO `tbl_entries_data_4` (`id`, `entry_id`, `value`) VALUES (14, 177, 'miki@noidea.com');

-- *** STRUCTURE: `tbl_entries_data_40` ***
DROP TABLE IF EXISTS `tbl_entries_data_40`;
CREATE TABLE `tbl_entries_data_40` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_40` ***
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (275, 232, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (265, 226, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (131, 197, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (159, 175, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (274, 227, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (279, 217, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (308, 212, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (158, 202, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (303, 188, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (301, 192, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (170, 189, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (125, 195, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (236, 231, 'no');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (276, 228, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (319, 240, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (311, 252, 'yes');
INSERT INTO `tbl_entries_data_40` (`id`, `entry_id`, `value`) VALUES (314, 255, 'yes');

-- *** STRUCTURE: `tbl_entries_data_41` ***
DROP TABLE IF EXISTS `tbl_entries_data_41`;
CREATE TABLE `tbl_entries_data_41` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_41` ***
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (275, 232, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (265, 226, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (131, 197, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (159, 175, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (274, 227, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (279, 217, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (308, 212, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (158, 202, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (303, 188, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (301, 192, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (170, 189, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (125, 195, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (236, 231, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (276, 228, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (319, 240, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (311, 252, 'yes');
INSERT INTO `tbl_entries_data_41` (`id`, `entry_id`, `value`) VALUES (314, 255, 'yes');

-- *** STRUCTURE: `tbl_entries_data_42` ***
DROP TABLE IF EXISTS `tbl_entries_data_42`;
CREATE TABLE `tbl_entries_data_42` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_42` ***
INSERT INTO `tbl_entries_data_42` (`id`, `entry_id`, `relation_id`) VALUES (55, 173, 49);
INSERT INTO `tbl_entries_data_42` (`id`, `entry_id`, `relation_id`) VALUES (53, 200, 49);
INSERT INTO `tbl_entries_data_42` (`id`, `entry_id`, `relation_id`) VALUES (34, 178, 3);
INSERT INTO `tbl_entries_data_42` (`id`, `entry_id`, `relation_id`) VALUES (51, 190, 10);
INSERT INTO `tbl_entries_data_42` (`id`, `entry_id`, `relation_id`) VALUES (54, 215, 49);

-- *** STRUCTURE: `tbl_entries_data_43` ***
DROP TABLE IF EXISTS `tbl_entries_data_43`;
CREATE TABLE `tbl_entries_data_43` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_43` ***
INSERT INTO `tbl_entries_data_43` (`id`, `entry_id`, `handle`, `value`) VALUES (52, 173, 10, 10);
INSERT INTO `tbl_entries_data_43` (`id`, `entry_id`, `handle`, `value`) VALUES (50, 200, 11, 11);
INSERT INTO `tbl_entries_data_43` (`id`, `entry_id`, `handle`, `value`) VALUES (31, 178, 5, 5);
INSERT INTO `tbl_entries_data_43` (`id`, `entry_id`, `handle`, `value`) VALUES (48, 190, 8, 8);
INSERT INTO `tbl_entries_data_43` (`id`, `entry_id`, `handle`, `value`) VALUES (51, 215, 2, 2);

-- *** STRUCTURE: `tbl_entries_data_45` ***
DROP TABLE IF EXISTS `tbl_entries_data_45`;
CREATE TABLE `tbl_entries_data_45` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_45` ***
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (55, 226, 5, 5);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (26, 231, 1, 1);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (65, 232, 7, 7);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (64, 227, 9, 9);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (66, 228, 9, 9);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (91, 192, 8, 8);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (109, 240, 10, 10);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (69, 217, 1, 1);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (93, 188, 9, 9);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (101, 252, 11, 11);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (98, 212, 10, 10);
INSERT INTO `tbl_entries_data_45` (`id`, `entry_id`, `handle`, `value`) VALUES (104, 255, 2, 2);

-- *** STRUCTURE: `tbl_entries_data_46` ***
DROP TABLE IF EXISTS `tbl_entries_data_46`;
CREATE TABLE `tbl_entries_data_46` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_46` ***
INSERT INTO `tbl_entries_data_46` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (9, 190, '2011-11-02T14:04:00+03:00', 1320231840, 1320231840);
INSERT INTO `tbl_entries_data_46` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (11, 200, '2011-11-02T14:10:00+03:00', 1320232200, 1320232200);
INSERT INTO `tbl_entries_data_46` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (12, 215, '2011-11-02T14:11:00+03:00', 1320232260, 1320232260);
INSERT INTO `tbl_entries_data_46` (`id`, `entry_id`, `value`, `local`, `gmt`) VALUES (13, 173, '2011-11-02T14:19:00+03:00', 1320232740, 1320232740);

-- *** STRUCTURE: `tbl_entries_data_5` ***
DROP TABLE IF EXISTS `tbl_entries_data_5`;
CREATE TABLE `tbl_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recovery-code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') COLLATE utf8_unicode_ci NOT NULL,
  `reset` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recovery-code` (`recovery-code`),
  KEY `entry_id` (`entry_id`),
  KEY `length` (`length`),
  KEY `password` (`password`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_5` ***
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (8, 8, '8568ff1dbb9927d89d70ef59d00c75156f22613d', NULL, 6, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (9, 9, 'd4125dc2da7669ca29a87cd4a1b96288d4295c2f', NULL, 6, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (22, 3, 'dab509011e421e0e809b591b901a1f960ed8865d', NULL, 7, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (4, 4, '6cc6da6896ab6054f8007780c0445b6892029b1b', NULL, 7, 'good', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (5, 5, 'd4125dc2da7669ca29a87cd4a1b96288d4295c2f', NULL, 6, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (6, 6, 'eab2e8fa217b49fce7ec36ae97ac86bc6bdbd3d2', NULL, 6, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (7, 7, 'cc9a69e90c9943570d88cb112df6c77109c96ea5', NULL, 6, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (23, 10, 'd4125dc2da7669ca29a87cd4a1b96288d4295c2f', NULL, 6, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (11, 48, 'd4125dc2da7669ca29a87cd4a1b96288d4295c2f', NULL, 6, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (24, 49, 'd4125dc2da7669ca29a87cd4a1b96288d4295c2f', NULL, 6, 'weak', 'no', NULL);
INSERT INTO `tbl_entries_data_5` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`) VALUES (14, 177, 'd4125dc2da7669ca29a87cd4a1b96288d4295c2f', NULL, 6, 'weak', 'no', NULL);

-- *** STRUCTURE: `tbl_entries_data_7` ***
DROP TABLE IF EXISTS `tbl_entries_data_7`;
CREATE TABLE `tbl_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `activated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_7` ***
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (8, 8, 'no', '2011-09-30 10:31:20', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (14, 177, 'yes', '2011-10-22 16:24:09', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (9, 9, 'no', '2011-09-30 11:23:35', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (22, 3, 'yes', '2011-09-30 00:17:16', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (4, 4, 'no', '2011-09-30 00:25:59', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (5, 5, 'no', '2011-09-29 22:40:22', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (6, 6, 'no', '2011-09-29 22:45:45', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (7, 7, 'no', '2011-09-29 22:47:48', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (11, 48, 'yes', '2011-10-10 09:07:51', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (23, 10, 'yes', '2011-09-30 11:43:44', NULL);
INSERT INTO `tbl_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`) VALUES (24, 49, 'yes', '2011-10-23 23:28:55', NULL);

-- *** STRUCTURE: `tbl_entries_data_8` ***
DROP TABLE IF EXISTS `tbl_entries_data_8`;
CREATE TABLE `tbl_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_8` ***
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `handle`, `value`) VALUES (13, 3, 'the-planet', 'the planet');
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 6, 33, 33);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 7, 33, 33);
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 8, 'nowhere', 'nowhere');
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `handle`, `value`) VALUES (5, 48, 'afganistan-kabul', 'Afganistan, Kabul');
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `handle`, `value`) VALUES (6, 177, 'nope', 'Nope');
INSERT INTO `tbl_entries_data_8` (`id`, `entry_id`, `handle`, `value`) VALUES (14, 10, 'hell', 'hell');

-- *** STRUCTURE: `tbl_entries_data_9` ***
DROP TABLE IF EXISTS `tbl_entries_data_9`;
CREATE TABLE `tbl_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_9` ***
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (8, 8, NULL, NULL);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (22, 3, 'I\'m alone!', '<p>I\'m alone!</p>\n');
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (4, 4, NULL, NULL);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (5, 5, NULL, NULL);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (6, 6, 33, '<p>33</p>\n');
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (7, 7, 33, '<p>33</p>\n');
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (9, 9, NULL, NULL);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (23, 10, NULL, NULL);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (11, 48, 'World Famous Celebrity.', '<p>World Famous Celebrity.</p>\n');
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (24, 49, NULL, NULL);
INSERT INTO `tbl_entries_data_9` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (14, 177, NULL, NULL);

-- *** DATA: `tbl_entries` ***
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (9, 2, 1, '2011-09-30 11:23:35', '2011-09-30 07:23:35');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (8, 2, 1, '2011-09-30 10:31:20', '2011-09-30 06:31:20');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (3, 2, 1, '2011-09-29 20:01:18', '2011-09-29 16:01:18');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (4, 2, 1, '2011-09-29 22:28:58', '2011-09-29 18:28:58');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (5, 2, 1, '2011-09-29 22:40:22', '2011-09-29 18:40:22');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (6, 2, 1, '2011-09-29 22:45:45', '2011-09-29 18:45:45');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (7, 2, 1, '2011-09-29 22:47:48', '2011-09-29 18:47:48');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (10, 2, 1, '2011-09-30 11:26:46', '2011-09-30 07:26:46');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (11, 3, 1, '2011-10-04 12:33:43', '2011-10-04 08:33:43');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (202, 11, 1, '2011-10-22 23:44:11', '2011-10-22 19:44:11');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (192, 11, 1, '2011-10-22 17:25:11', '2011-10-22 13:25:11');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (19, 3, 1, '2011-10-04 19:50:37', '2011-10-04 15:50:37');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (191, 5, 1, '2011-10-22 17:25:11', '2011-10-22 13:25:11');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (190, 10, 1, '2011-10-22 17:25:11', '2011-10-22 13:25:11');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (179, 5, 1, '2011-10-22 17:01:59', '2011-10-22 13:01:59');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (201, 5, 1, '2011-10-22 23:44:11', '2011-10-22 19:44:11');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (200, 10, 1, '2011-10-22 23:44:11', '2011-10-22 19:44:11');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (199, 5, 1, '2011-10-22 22:52:46', '2011-10-22 18:52:46');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (198, 5, 1, '2011-10-22 18:55:28', '2011-10-22 14:55:28');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (197, 11, 1, '2011-10-22 18:28:01', '2011-10-22 14:28:01');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (196, 5, 1, '2011-10-22 18:00:21', '2011-10-22 14:00:21');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (195, 11, 1, '2011-10-22 18:00:00', '2011-10-22 14:00:00');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (194, 5, 1, '2011-10-22 17:33:35', '2011-10-22 13:33:35');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (193, 5, 1, '2011-10-22 17:32:47', '2011-10-22 13:32:47');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (219, 5, 1, '2011-10-23 00:09:10', '2011-10-22 20:09:10');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (230, 5, 1, '2011-10-23 01:44:50', '2011-10-22 21:44:50');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (217, 11, 1, '2011-10-23 00:06:33', '2011-10-22 20:06:33');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (216, 5, 1, '2011-10-23 00:06:33', '2011-10-22 20:06:33');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (215, 10, 1, '2011-10-23 00:06:33', '2011-10-22 20:06:33');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (214, 5, 1, '2011-10-23 00:05:36', '2011-10-22 20:05:36');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (213, 5, 1, '2011-10-23 00:01:19', '2011-10-22 20:01:19');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (212, 11, 1, '2011-10-23 00:01:03', '2011-10-22 20:01:03');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (178, 10, 1, '2011-10-22 17:01:59', '2011-10-22 13:01:59');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (177, 2, 1, '2011-10-22 16:21:47', '2011-10-22 12:21:47');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (48, 2, 1, '2011-10-09 20:00:08', '2011-10-09 16:00:08');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (49, 2, 1, '2011-10-10 09:08:43', '2011-10-10 05:08:43');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (211, 5, 1, '2011-10-23 00:00:39', '2011-10-22 20:00:39');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (210, 5, 1, '2011-10-22 23:56:43', '2011-10-22 19:56:43');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (209, 5, 1, '2011-10-22 23:55:15', '2011-10-22 19:55:15');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (208, 5, 1, '2011-10-22 23:51:03', '2011-10-22 19:51:03');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (207, 5, 1, '2011-10-22 23:50:35', '2011-10-22 19:50:35');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (206, 5, 1, '2011-10-22 23:50:04', '2011-10-22 19:50:04');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (242, 5, 1, '2011-10-23 23:37:59', '2011-10-23 19:37:59');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (241, 5, 1, '2011-10-23 23:29:40', '2011-10-23 19:29:40');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (205, 5, 1, '2011-10-22 23:48:46', '2011-10-22 19:48:46');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (204, 5, 1, '2011-10-22 23:47:00', '2011-10-22 19:47:00');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (203, 5, 1, '2011-10-22 23:45:56', '2011-10-22 19:45:56');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (240, 11, 1, '2011-10-23 23:29:28', '2011-10-23 19:29:28');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (239, 5, 1, '2011-10-23 23:23:22', '2011-10-23 19:23:22');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (238, 5, 1, '2011-10-23 23:13:25', '2011-10-23 19:13:25');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (237, 5, 1, '2011-10-23 23:04:56', '2011-10-23 19:04:56');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (236, 5, 1, '2011-10-23 23:01:19', '2011-10-23 19:01:19');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (235, 5, 1, '2011-10-23 23:00:40', '2011-10-23 19:00:40');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (234, 5, 1, '2011-10-23 22:59:34', '2011-10-23 18:59:34');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (233, 5, 1, '2011-10-23 17:20:57', '2011-10-23 13:20:57');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (232, 11, 1, '2011-10-23 17:19:45', '2011-10-23 13:19:45');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (231, 11, 1, '2011-10-23 17:18:31', '2011-10-23 13:18:31');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (227, 11, 1, '2011-10-23 01:24:33', '2011-10-22 21:24:33');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (223, 5, 1, '2011-10-23 00:09:52', '2011-10-22 20:09:52');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (228, 11, 1, '2011-10-23 01:44:30', '2011-10-22 21:44:30');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (229, 5, 1, '2011-10-23 01:44:40', '2011-10-22 21:44:40');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (226, 11, 1, '2011-10-23 01:22:39', '2011-10-22 21:22:39');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (176, 5, 1, '2011-10-22 13:40:41', '2011-10-22 09:40:41');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (251, 5, 1, '2011-11-02 14:04:10', '2011-11-02 11:04:10');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (252, 11, 1, '2011-11-02 14:09:29', '2011-11-02 11:09:29');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (189, 11, 1, '2011-10-22 17:17:26', '2011-10-22 13:17:26');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (175, 11, 1, '2011-10-22 13:39:54', '2011-10-22 09:39:54');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (174, 5, 1, '2011-10-22 13:39:53', '2011-10-22 09:39:53');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (253, 5, 1, '2011-11-02 14:09:36', '2011-11-02 11:09:36');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (173, 10, 1, '2011-10-22 13:39:53', '2011-10-22 09:39:53');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (254, 5, 1, '2011-11-02 14:10:53', '2011-11-02 11:10:53');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (255, 11, 1, '2011-11-02 14:11:07', '2011-11-02 11:11:07');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (256, 5, 1, '2011-11-02 14:11:15', '2011-11-02 11:11:15');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (257, 5, 1, '2011-11-02 14:19:49', '2011-11-02 11:19:49');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (243, 5, 1, '2011-11-01 19:41:52', '2011-11-01 16:41:52');
INSERT INTO `tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`) VALUES (188, 11, 1, '2011-10-22 17:12:15', '2011-10-22 13:12:15');

-- *** DATA: `tbl_extensions` ***
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (1, 'xssfilter', 'enabled', 1.0);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (2, 'debugdevkit', 'enabled', 1.1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'export_ensemble', 'enabled', 1.16);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'selectbox_link_field', 'enabled', 1.19);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'jit_image_manipulation', 'enabled', 1.10);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'maintenance_mode', 'enabled', 1.4);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (7, 'members', 'enabled', '1.1.1');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (8, 'profiledevkit', 'enabled', '1.0.4');
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (9, 'markdown', 'enabled', 1.13);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'email_template_manager', 'enabled', 3.0);

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (1, 1, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (2, 1, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (3, 1, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (4, 2, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (5, 2, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (33, 3, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (7, 5, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (8, 5, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (9, 6, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (10, 6, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (11, 6, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (12, 6, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (13, 6, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (14, 6, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (15, 6, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (16, 7, '/frontend/', 'FrontendPageResolved', 'checkFrontendPagePermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (17, 7, '/frontend/', 'FrontendParamsResolve', 'addMemberDetailsToPageParams');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (18, 7, '/frontend/', 'FrontendProcessEvents', 'appendLoginStatusToEventXML');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (19, 7, '/frontend/', 'EventPreSaveFilter', 'checkEventPermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (20, 7, '/frontend/', 'EventPostSaveFilter', 'processPostSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (21, 7, '/backend/', 'AdminPagePreGenerate', 'appendAssets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (22, 7, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (23, 7, '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (24, 7, '/blueprints/events/new/', 'AppendEventFilter', 'appendFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (25, 7, '/blueprints/events/edit/', 'AppendEventFilter', 'appendFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (26, 8, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (27, 8, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (28, 10, '/blueprints/events/edit/', 'AppendEventFilter', 'AppendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (29, 10, '/blueprints/events/new/', 'AppendEventFilter', 'AppendEventFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (30, 10, '/frontend/', 'EventFinalSaveFilter', 'eventFinalSaveFilter');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (31, 10, '/blueprints/events/edit/', 'AppendEventFilterDocumentation', 'AppendEventFilterDocumentation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (32, 10, '/blueprints/datasources/', 'DatasourcePostEdit', 'DatasourcePostEdit');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'Activation', 'activation', 'memberactivation', 2, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Password', 'password', 'memberpassword', 2, 'yes', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'Email', 'email', 'memberemail', 2, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'Location', 'location', 'input', 2, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'Bio', 'bio', 'textarea', 2, 'no', 5, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Username', 'username', 'memberusername', 2, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (11, 'Name', 'name', 'input', 3, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (33, 'Topic', 'topic', 'input', 10, 'yes', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (34, 'Message', 'message', 'textarea', 10, 'yes', 3, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (32, 'Category', 'category', 'selectbox_link', 10, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (37, 'Discussion', 'discussion', 'selectbox_link', 5, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (36, 'Author', 'author', 'selectbox_link', 5, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (21, 'Message', 'message', 'textarea', 5, 'yes', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (22, 'Date Created', 'date-created', 'date', 5, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (31, 'Author', 'author', 'selectbox_link', 10, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (38, 'Discussion', 'discussion', 'selectbox_link', 11, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (39, 'Member', 'member', 'selectbox_link', 11, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (40, 'Involved', 'involved', 'checkbox', 11, 'no', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (41, 'Red', 'red', 'checkbox', 11, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (42, 'Last Poster', 'last-poster', 'selectbox_link', 10, 'no', 5, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (43, 'Number of replies', 'number-of-replies', 'input', 10, 'no', 6, 'sidebar', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (46, 'Last Active', 'last-active', 'date', 10, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (45, 'Number of replies', 'number-of-replies', 'input', 11, 'no', 4, 'sidebar', 'no');

-- *** DATA: `tbl_members_roles` ***
INSERT INTO `tbl_members_roles` (`id`, `name`, `handle`) VALUES (1, 'Public', 'public');

-- *** DATA: `tbl_members_roles_event_permissions` ***
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (20, 1, 'forum_new_discussion', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (19, 1, 'forum_new_discussion', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (18, 1, 'forum_discussion_update', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (17, 1, 'forum_discussion_update', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (16, 1, 'forum_discussion_read', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (15, 1, 'forum_discussion_read', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (14, 1, 'forum_discussion_involved', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (13, 1, 'forum_discussion_involved', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (21, 1, 'forum_new_reply', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (22, 1, 'forum_new_reply', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (23, 1, 'members_edit', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (24, 1, 'members_edit', 'edit', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (25, 1, 'members_new', 'create', 0);
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (26, 1, 'members_new', 'edit', 0);

-- *** DATA: `tbl_members_roles_forbidden_pages` ***
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (5, 1, 12);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (4, 1, 5);

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Home', 'home', NULL, NULL, 'member_current', NULL, 1);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, NULL, 'Members : Register', 'register', NULL, NULL, 'member_current,member_just_created', 'members_new', 2);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (3, NULL, 'Members : Activate Account', 'activate', NULL, NULL, NULL, 'members_activate_account,members_regenerate_activation_code', 3);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (4, NULL, 'Forum', 'forum', NULL, 'forum-category/forum-filter', 'forum_categories,forum_discussion_member,forum_discussions,member_current', NULL, 6);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (5, NULL, 'Forum: New Discussion', 'forum-new-discussion', NULL, NULL, 'forum_categories', 'forum_discussion_involved,forum_discussion_update,forum_new_discussion,forum_new_reply', 7);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (6, NULL, 'Forum: View Discussion', 'forum-discussion', NULL, 'discussion-id', 'forum_categories,forum_current_discussion,forum_discussion_member,forum_replies,member_current', 'forum_discussion_involved,forum_discussion_read,forum_discussion_update,forum_new_reply', 8);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (12, 4, 'Filter Discussions', 'filter', 'forum', 'forum-filter', 'forum_categories,forum_discussion_member,forum_discussions,member_current', NULL, 10);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (8, NULL, 'Forum: Edit Reply', 'forum-reply', NULL, 'discussion-id/reply-id', 'forum_current_discussion,forum_replies', 'forum_discussion_update,forum_new_reply', 9);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (9, NULL, 'async', 'async', NULL, NULL, NULL, NULL, 11);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (13, NULL, 'Members : Profile', 'members-profile', NULL, 'profile-member-id', 'member_current,member_profile', 'members_edit', 4);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (14, NULL, 'Members : Change Password', 'members-change-password', NULL, NULL, 'member_current', 'members_edit', 5);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (9, 1, 'index');

-- *** DATA: `tbl_sections` ***
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (2, 'Members', 'members', 1, NULL, 'asc', 'no', 'Content');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (3, 'Forum: Categories', 'forum-categories', 2, NULL, 'asc', 'no', 'Forum');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (11, 'Forum: Discussion - Member', 'forum-discussion-member', 5, 40, 'asc', 'no', 'Forum');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (5, 'Forum: Replies', 'forum-replies', 4, NULL, 'asc', 'no', 'Forum');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (10, 'Forum: Discussions', 'forum-discussions', 3, NULL, 'asc', 'no', 'Forum');

-- *** DATA: `tbl_sections_association` ***
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (66, 2, 10, 10, 31, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (67, 3, 11, 10, 32, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (35, 2, 10, 5, 36, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (36, 10, 33, 5, 37, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (52, 10, 33, 11, 38, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (53, 2, 10, 11, 39, 'no');
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (68, 2, 10, 10, 42, 'yes');
