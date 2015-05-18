<?php
  
class CustomSiteConfig extends DataExtension {

    private static $db = array(
        'WebAdminEmail' => 'Varchar(255)',
        'WebAdminName' => 'Varchar(255)',
    );
  
    public function updateCMSFields(FieldList $fields) {
        
        $fields->addFieldToTab("Root.Main", new LiteralField("Header0", "<img src=\"/themes/simple/images/plato-logo-large.png\" />"), 'Title');
        
        $fields->addFieldToTab("Root.Main", new HeaderField("Header1", "Website Administrator Details", 2));
        $fields->addFieldToTab("Root.Main", new TextField('WebAdminEmail', 'Email Address'));
        $fields->addFieldToTab("Root.Main", new TextField('WebAdminName', 'Full Name'));

    }
}