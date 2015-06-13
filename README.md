MuscaKit CMS
============

MuscaKit is an Open Source Content Management System build on its own MVC framework. It serves for developing small and medium-size websites and internet applications. 

# On-line demo

Demo application is avaliable [here](http://jacobmarcus.com/muscakit/). Administration panel is [here](http://jacobmarcus.com/muscakit/). Login using username: _demo_ and password: _demo_


# Server Requirements

- PHP >= 5.3
- MySQL
- Apache with mod_rewrite or equivalent

# 3 steps instalation

1. Download files from [github](https://github.com/kubamarkiewicz/MuscaKit-App) into a directory on your server
2. Create a MySQL database and import file `protected/muscakit.sql` to the database
3. Configure your database connection in files `protected/config.php` and in `admin/protected/config.php`

That's it! Now open a web browser and go to a directory where `index.php` is located and you should see a "Hello world!" page.

### Administration panel

Go to URL `your_app_url/admin` and you should see login screen to the administration panel. 
Login using username: _demo_ and password: _demo_  
Next click on a link "Hello demo" in the top right corner to change your username and password. 
