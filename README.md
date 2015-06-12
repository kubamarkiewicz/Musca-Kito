MuscaKit CMS
============

MuscaKit is an Open Source Content Management System build on its own MVC framework. It serves for developing small and medium-size websites and internet applications. 

# Server Requirements

- PHP >= 5.3
- MySQL
- Apache with mod_rewrite or equivalent

# 3 step instalation

1. Download files from [github](https://github.com/kubamarkiewicz/MuscaKit-App) into a directory on your server
2. Create a MySQL database and import file `protected/muscakit.sql` to the database
3. Configure your database connection in files `protected/config.php` and in `admin/protected/config.php`

That's it! Now open a web browser and go to a directory where `index.php` is located and you should see "Hello world!" page.

Next go to URL `your_app_url/admin` and you should see administration panel login screen. Enter as demo/demo and click on "Hello demo" link in the top right corner to change your login and password. 
