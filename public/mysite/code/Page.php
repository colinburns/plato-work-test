<?php
class Page extends SiteTree {

	private static $db = array(
	);

	private static $has_one = array(
	);

}
class Page_Controller extends ContentController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	private static $allowed_actions = array (
        'ContactForm'
	);

	public function init() {
		parent::init();
		// You can include any CSS or JS required by your project here.
		// See: http://doc.silverstripe.org/framework/en/reference/requirements
	}

    public function ContactForm() {

        $fields = new FieldList(
            new TextField('FullName','Full Name'),
            new EmailField('Email','Email'),
            new TextField('Phone','Phone'),
            new CountryDropdownField('Location', 'Location', NULL, 'NZ'),
            new DropdownField('PreferredBeverage','Preferred Beverage', singleton('ContactForm')->dbObject('PreferredBeverage')->enumValues())
        );

        $actions = new FieldList(
            new FormAction('doContactForm', 'Submit')
        );

        $validator = new RequiredFields(
            array(
                'FullName',
                'Email',
                'Phone',
                'Location',
            )
        );

        return new Form($this, 'ContactForm', $fields, $actions, $validator);
    }

    public function doContactForm($data, $form) {

        $SubmittedForm = new ContactForm();
        $form->saveInto($SubmittedForm);
        if($SubmittedForm->write()){

            $config = SiteConfig::current_site_config();

            $from = "noreply@platocreative.co.nz";
            $to = $config->WebAdminEmail;
            $subject = "Preferred Beverage for ".$data['FullName']." is ".$data['PreferredBeverage'];
$body = <<<EOF

    Hi {$config->WebAdminName},

    The preferred beverage for {$data['FullName']} is {$data['PreferredBeverage']}

    Please ensure that next time they visit the office we have this drink available for them.

    Regards,
    The Internet

EOF;

            $email = new Email($from, $to, $subject, $body);
            $email->sendPlain();

            // get the type of beverage the user wanted
            switch ($data['PreferredBeverage']) {
                case 'Coffee':
                    $beverageURL = "/themes/simple/images/coffee.jpg";
                    break;
                case 'Tea':
                    $beverageURL = "/themes/simple/images/tea.jpg";
                    break;
                case 'Coca Cola':
                    $beverageURL = "/themes/simple/images/coke.jpg";
                    break;
                case 'Water':
                    $beverageURL = "/themes/simple/images/water.jpg";
                    break;
            }

            $response = array(
                'success' => true,
                'message' => "Thanks, next time you're visiting our office we'll make sure we have a ".$data['PreferredBeverage']." ready for you.",
                'beverage' => $beverageURL
            );

        }else{

            $response = array(
                'success' => true,
                'message' => "Unfortunately something has gone wrong, next time you're in our office we'll make sure to ask you personally what your preferred beverage is.",
                'beverage' => ''
            );

        }

        return json_encode($response);

    }

}
