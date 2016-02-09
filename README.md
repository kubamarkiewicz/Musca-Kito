MuscaKit CMS
============

MuscaKit is an Open Source MVC framework and Content Management System. It was created in 2012 in an interactive agancy in Barcelona and was intended for rapid development of small to medium-size websites and any kind of internet application. 



# On-line demo

Demo application is avaliable [here](http://jacobmarcus.com/muscakit/).   
Administration panel is [here](http://jacobmarcus.com/muscakit/admin).  
Login using username: _demo_ and password: _demo_


# Server Requirements

- PHP >= 5.3
- Apache with mod_rewrite enabled (or equivalent)
- MySQL database


# 3 steps instalation

1. Download files from [github](https://github.com/kubamarkiewicz/MuscaKit-Cms)
2. Create a MySQL database and import SQL file that you will find in downloaded files in `protected/muscakit.sql`
3. Set up access to the database in two configuration files: `protected/config.php` and `admin/protected/config.php`

Done! Now open a web browser and go to a directory where `index.php` is located and you should see a "Hello world" page.

### Administration panel

You can access administration panel at URL `your_app_url/admin` using username: _demo_ and password: _demo_  
To change username and password click "Hello demo" link in the top right corner in administration panel.




# Application structure
There are 2 basic ways how you can structure your application: **Standard MVC Structure** and **Modularized Structure**

## Standard MVC Structure
In Standard MVC Structure files are organized in three basic folders, one folder for each of MVC layer. We have a folder with Controllers, a folder with Models and a folder with Templates:
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
This approach is preferable for smaller applications, when there are only a few controllers.
However, it is not scalable. When you start adding additional functionality to the app this kind of file structure becomes inconvinient to maintain. Once you have more than 10 controllers it becomes more difficult to find a specific file. In that case it is better to use **Modularized Structure**

## Modularized Structure
In Modularized Structure <sup>[1](#footnote1)</sup> the `Modules` folder will contain modules - the actual parts of your application. You can think of modules as mini applications. Each module has it’s own folder that contain it’s controllers, models and templates. If the module has multiple templates, files can be further distributed into `Controllers`, `Models` and `templates` subfolders.  
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
Standard MVC and Modularized Structure can coexist and you can use both at the same time.

# Front Controller

All page requests are processed by the Front Controller file `index.php` that is located in the root folder. 

# Routing

MuscaKit offers automatic routing. This means that the router is trying to find a controller and action matching the given URL.   
Following routes are possible:  
```sh
http://domain.com 							>> \Controllers\IndexController->index()
http://domain.com/product 					>> \Controllers\ProductController->index()
http://domain.com/product/all		 		>> \Controllers\ProductController->all()
http://domain.com/product/details/123 		>> \Controllers\ProductController->details(123)
http://domain.com/shop/product/details/123	>> \Modules\Shop\ProductController->details(123)
```
Default controller name is `IndexController` and default action name is `index()`.
If controller name or action name consist of multiple words they can be separated in URL by character `-` or `_` or glued:  
```sh
http://domain.com/myproducts/showlatest	>> \Controllers\MyProductsController->showLatest()
http://domain.com/my-products/show-latest	>> \Controllers\MyProductsController->showLatest()
http://domain.com/my_products/show_latest	>> \Controllers\MyProductsController->showLatest()
```


# Controllers

Controllers are located in `protected/Controllers` folder and are autoloaded by Composer.   Controller class name should finish with word `Controller`, eg.: `ProductController`.  
The class should extend `\MuscaKit\Controller` class.  
Public controllers' methods can be called by the router we will refer to them as _actions_. 

# Models

Models are located in `protected/Models` folder and are autoloaded by Composer.

# Templates

Templates are located in `protected/templates` folder.  
[Smarty Template Engine](http://www.smarty.net) is used for writing templates.  
Smarty object can be accessed inside a controller by `template` property:  
```sh
$this->template->assign('param', $param);
$this->template->display('home.tpl');
```

## Template inheritance

A template can extend layout file, for example:

_home.tpl_
```sh
{extends file="layout.tpl"}
{block name=content}
    Hello World!
{/block}
```

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


# Internationalization

Translation of web application includes:

- translation of static texts and images (in templates, controllers)
- translation of database tables content (eg. posts, products etc)
- translation of URLs

Internationalization also provides the posibility to switch languages.

## Languages

Languages available in the application are configured in `/protected/config/config.php` file.


## Translation of static content

## Translation of dynamic content

## Translation of URLs



# Coding standards

## PHP

[PSR-0](http://www.php-fig.org/psr/psr-0/)

- Valid namespace format: `\<Vendor Name>\(<Namespace>\)*<Class Name>`

[PSR-1](http://www.php-fig.org/psr/psr-1/)

- Class names MUST be declared in StudlyCaps
- Method names MUST be declared in camelCase
- Class constants MUST be declared in all upper case with underscore separators

[PSR-2](http://www.php-fig.org/psr/psr-2/)

- Code MUST use 4 spaces for indenting, not tabs
- Opening braces for control structures MUST go on the same line, and closing braces MUST go on the next line after the body

## MySQL

- Table name (singular): `my_product`
- Field name: `first_name`
- many-to-many relation table name: `order_has_product`

## MongoDB

- Collection name: `my_products`
- Field name: `first_name`

## JavaScript

- Class name: `MyClassName`
- JSON: `{ ‘this_is_a_key’: ‘value’ }`

## CSS

- Class name: `my-class-name` (like in Bootstrap)



# References
<a name="footnote1">1</a>: [AngularJS Best Practices: Directory Structure by Adnan Kukic](https://scotch.io/tutorials/angularjs-best-practices-directory-structure)

