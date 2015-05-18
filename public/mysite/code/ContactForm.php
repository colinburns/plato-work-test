<?php
class ContactForm extends DataObject {

    public static $db = array(
        'FullName' => "Varchar(255)",
        'Email' => "Varchar(255)",
        'Phone' => 'Varchar(255)',
        'Location' => 'Varchar(255)',
        'PreferredBeverage' => "Enum('Coffee,Tea,Coca Cola,Water')"
    );

    public static $has_one = array();

    static $default_country = 'AU';

    static $singular_name = 'FormContact';
    static $plural_name = 'FormContacts';
    static $default_sort = 'FullName';

    //Fields to show in the DOM table
    static $summary_fields = array(
        'FullName' => 'FullName',
        'Email' => 'Email',
        'Phone' => 'Phone'
    );

    function canCreate($member = NULL) {return true;}
    function canEdit($member = NULL) {return true;}
    function canDelete($member = NULL) {return true;}

    function getCMSFields() {

        $fields = parent::getCMSFields();

        $fields->addFieldToTab('Root.Main', new HeaderField('Contact Submission Details'));
        $fields->addFieldToTab('Root.Main', new TextField('FullName','Full Name'));
        $fields->addFieldToTab('Root.Main', new EmailField('Email','Email'));
        $fields->addFieldToTab('Root.Main', new TextField('Phone','Phone'));
        $fields->addFieldToTab('Root.Main', new CountryDropdownField('Location', 'Location', NULL, 'NZ'));
        $fields->addFieldToTab('Root.Main', new DropdownField('PreferredBeverage','Preferred Beverage', singleton('ContactForm')->dbObject('PreferredBeverage')->enumValues()));

        return $fields;

    }

}