MuscaKit CMS
============

MuscaKit is an Open Source Content Management System build on a custom MVC framework. It was created in 2012 in an interactive agancy in Barcelona and was intended for rapid development of small to medium-size websites and any kind of internet application. 

# On-line demo

Demo application is avaliable [here](http://jacobmarcus.com/muscakit/). 
Administration panel is [here](http://jacobmarcus.com/muscakit/admin). Login using username: _demo_ and password: _demo_


# Server Requirements

- PHP >= 5.3
- Apache with mod_rewrite enabled (or equivalent)
- MySQL database


# 3 steps instalation

1. Download files from [github](https://github.com/kubamarkiewicz/MuscaKit-Cms)
2. Create a MySQL database and import SQL file that you will find in downloaded files in `protected/muscakit.sql`
3. Set up access to the database in configuration files located at `protected/config.php` and `admin/protected/config.php`

Done! Now open a web browser and go to a directory where `index.php` is located and you should see a "Hello world!" page.

### Administration panel

You can access administration panel at URL `your_app_url/admin` using username: _demo_ and password: _demo_  
To change username and password click "Hello demo" link in the top right corner in administration panel.


# Application structure

There are 2 basic ways how you can structure your application: **Standard MVC Structure** and **Modularized Structure**

### Standard MVC Structure

In basic MVC  

### Modularized Structure