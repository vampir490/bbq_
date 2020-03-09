<h1 align="center">BBQ</h1>

A **Ruby on Rails** application to invite friends to parties, events, bbq etc. It lets you create an event, subscribe for updates, upload photos and share comments. 
A training project as part of Ruby / Ruby on Rails coding bootcamp. It shows the ability to:
* upload files. It uses AWS on production;
* authentification and authorization;
* localization and YML files;
* devise gem;
* carrierwave;
* bootstrap;
* emails sending;
* deployment with capistrano.

## DEMO
[burundukmedia.ru](http://burundukmedia.ru/)

## Versions used
* Ruby 2.6.4
* Rails 5.2

## Installation
To use the code:
1. Download the repository using the [instruction](https://help.github.com/en/articles/cloning-a-repository).
2. In the command line go to the directory with the files downloaded.
3. Install required gems. To do that:
   1. Check if the bundler is installed with the command `gem list bundler`
      * If it is not installed - installed it with the command `gem install bundler`.
      * If bundler is already installed, that is perfect. Go to the next step.
   2. In the directory with the game, to install all necessary gems run `bundle`
4. To run migrations: 
```console
bundle exec rake db:migrate
```
5. To work on production configure your web-server and the files: `deploy.rb`, `config/environments/production.rb`, `config/deploy/production.rb`
**It is important** to use `bundle exec` to make the necessary versions of gems to be used.
