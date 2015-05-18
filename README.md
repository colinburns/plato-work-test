#Work test for Plato Creative

### Installation Instructions

Clone or unpack the code into a directory and set the webroot to point to the /public directory.

I have configured the site for the following database details:

* host: localhost
* username: plato
* password: platoworktest
* dbname: plato-work-test

*Database details can be changes in /public/mysite/_config.php*

**Note:** Normally I would use "_ss_environment.php" for configuration but thought I would keep it simple in this case.

**CMS Admin User**

* username: admin
* password: password



### Assumption

I have not maintained state at all for the submitted form response. To view the form again simply refresh the page. 
If this was a production site and the form was more important I would consider maintaining the message on the site 
through the use of session variables or a cookie if we needed it to persist past this specific session.

I've assumed that persistance isn't needed for this exercise.

I've just used the basic "simple" theme and haven't spent the time modifying the content from the installation other
than to include a plato creative logo on the page and also in the "Settings" section.

I haven't done some of the more fancy things that I would normally do for clients solely due to time constraints. 
Normally I would set custom icons for Model Admin pages and different icons for specific page types to make life a 
little easier for the content editor.

**Settings**

I have provided the facility for the user to modify the web admin name and email through the "Settings" section using 
a SiteConfig data extension. I tend to use this method for setting whole of site variables (such as links in the footer, 
social media URL, site admins etc).

**Viewing saved responses**

Users can access the saved responses by clicking the "Contact Form" link in the left hand menu of the CMS.


### Time required

I spent about 2-2.5 hours in total to complete the project.