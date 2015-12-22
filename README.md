MuscaKit CMS
============

MuscaKit is an Open Source MVC framework and Content Management System. It was created in 2012 in an interactive agancy in Barcelona and was intended for rapid development of small to medium-size websites and any kind of internet application. 



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

## Standard MVC Structure
In Standard MVC Structure files are organized in three basic folders, one folder for each of MVC layer. We have a folder with Controllers, a folder with Models and a folder with templates (Views):
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

## Modularized Structure
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

# Front Controller

All page requests are processed by the Front Controller file (index.php) that is located in the root folder. 

# Routing

MuscaKit offers automatic routing. URLs are automatically resolved to module/controller/action/parameters by Router class. Examples of possible routes:
```sh
http://domain.com/product/details/123 	: ProductController->details(123)
http://domain.com/product 				: ProductController->index()
http://domain.com 						: IndexController->index()
http://domain.com/blog/post/view/123 	: Modules/Blog/PostController->view(123)
```
Multipart names in URLs can be separated by `-`, `_` or glued:
```sh
http://domain.com/my-products/show-latest	: MyProductsController->showLatest()
http://domain.com/my_products/show_latest	: MyProductsController->showLatest()
http://domain.com/myproducts/showlatest	: MyProductsController->showLatest()
```


# Controllers

Controllers are located in `protected/Controllers` folder and are autoloaded by Composer. Controller class name should be in format: `ProductController` and should extend `Controller` class. Public controller's methods are called _actions_ and will be called by the router. 

# Models

Models are located in `protected/Models` folder and are autoloaded by Composer.

# Templates

[Smarty Template Engine](http://www.smarty.net) is used for writing templates.
Smarty object can be accessed in controller by `template` property: 
```sh
$this->template->assign('param', $param);
$this->template->display('home.tpl');
```
Templates are located in `protected/templates` folder.

## Template inheritance

A template can extend layout file for example:

_layout.tpl_
```sh
<html>
<head>
	{block name=css}{/block}
</head>
<body>
	{block name=content}{/block}
	{block name=javascript}{/block}
</body>
</html>
```

_home.tpl_
```sh
{extends file="layout.tpl"}
{block name=content}
    Hello World!
{/block}
```


# Internacionalization




# Coding standards

## PHP

[PSR-0](http://www.php-fig.org/psr/psr-0/)

- Valid namespace format: \<Vendor Name>\(<Namespace>\)*<Class Name>

[PSR-1](http://www.php-fig.org/psr/psr-1/)

- Class names MUST be declared in StudlyCaps
- Method names MUST be declared in camelCase
- Class constants MUST be declared in all upper case with underscore separators

[PSR-2](http://www.php-fig.org/psr/psr-2/)

- Code MUST use 4 spaces for indenting, not tabs
- Opening braces for control structures MUST go on the same line, and closing braces MUST go on the next line after the body

## MySQL

- table name (singular): `my_product`
- field name: `first_name`
- many-to-many relation table name: `order_has_product`

## MongoDB

- collection name: `my_products`
- field name: `first_name`

## JavaScript

- class name: `MyClassName`
- JSON: `{ ‘this_is_a_key’: ‘value’ }`

## CSS

- class name: `my-class-name` (like in Bootstrap)



# References
<a name="footnote1">1</a>: [AngularJS Best Practices: Directory Structure by Adnan Kukic](https://scotch.io/tutorials/angularjs-best-practices-directory-structure)

