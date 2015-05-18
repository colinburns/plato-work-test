<?php

class ContactFormAdmin extends ModelAdmin {

    public function init() {
        parent::init();
//        Requirements::javascript('mysite/javascript/contactform.js');
//        Requirements::css('mysite/css/contactform.css');
    }

//    private static $menu_icon = 'mysite/images/icon_dollar.png';

    private static $url_segment = 'contact-form';

    private static $menu_title = 'Contact Form';

    private static $managed_models = array(
        'ContactForm'
    );

}
