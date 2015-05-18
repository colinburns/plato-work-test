<?php

global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	"type" => 'MySQLDatabase',
	"server" => 'localhost',
	"username" => 'plato',
	"password" => 'platoworktest',
	"database" => 'plato-work-test',
	"path" => '',
);

// Set the site locale
i18n::set_locale('en_US');

Object::add_extension('SiteConfig', 'CustomSiteConfig');