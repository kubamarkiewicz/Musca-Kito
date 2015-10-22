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
Standard MVC structure organize files in three basic folders, one folder for each of MVC layer. We have a separation of concerns, Models, Views (templates) and Controllers, each have their own folder:
```sh
protected
----Controllers
--------IndexController.php
--------NewsController.php
----Models
--------ProductModel.php
--------NewsModel.php
----templates
--------layout.tpl
--------home.tpl
--------contact.tpl
```
This approach is preferable for smaller applications, when there is only a few controllers.
However, it is not scalable. When you start adding additional functionality to the app this kind of file structure becomes inconvinient to maintain. Once you have more than 10 controllers it becomes more difficult to find a specific file. In that case it is better to use **Modularized Structure**

### Modularized Structure
In Modularized Structure <sup>[1](#footnote1)</sup> the `Modules` folder will contain modules - the actual parts of your application. Each module should have it’s own subfolder with it’s own controllers, models and templates files. You could think of modules as mini applications. If the module has multiple templates, it may be a good idea to further separate these files into `Controllers`, `Models` and `templates` subfolders.
```sh
protected
----Modules
--------Home
------------HomeController.php
------------home.tpl
--------News
------------Controllers
----------------NewsController.php
------------Models
----------------NewsModel.php
----------------TagsModel.php
------------templates
----------------list.tpl
----------------details.tpl
```
Standard MVC and Modularized Structure can coexist and you can use both of them at the same time.


# References
<a name="footnote1">1</a>: [AngularJS Best Practices: Directory Structure](https://scotch.io/tutorials/angularjs-best-practices-directory-structure)

