# venturafamilymed.org
Venturafamilymed.org Website and Testing suite

Currently starting Behavoir Direct Development with Behat/Mink
This is a alpha project and should not be considered stable in any sense

Branches:
  remotes/origin/master
  remotes/origin/behat.config
  remotes/origin/homepage.feature
  remotes/origin/meetus.feature

General Usage:
If you have just pulled the project it uses PHP Composer to control the dependencies.
Just run "composer install" to install the versions in the composer.lock file.

If you want to update the versions run "composer update".  Afterwards if anything was
updated you'd want to commit the composer.lock file if you want the changes to stick.

The actual tests are run with behat.
