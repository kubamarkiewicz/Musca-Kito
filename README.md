MuscaKit CMS
============

MuscaKit is an Open Source Content Management System build on a custom MVC framework. It was created in 2012 in an interactive agancy in Barcelona and was intended for rapid development of small to medium-size websites and any kind of internet application. 

# On-line demo

Demo application is avaliable [here](http://jacobmarcus.com/muscakit/). 
Administration panel is [here](http://jacobmarcus.com/muscakit/admin). Login using username: _demo_ and password: _demo_


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

You can access administration panel at URL `your_app_url/admin`. Login using username: _demo_ and password: _demo_  
Next click on a link "Hello demo" in the top right corner to change your username and password. 
