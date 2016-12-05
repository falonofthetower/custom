# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.3.0
It's in the Gemfile. It's probably not vital, but it is not otherwise tested

* Configuration
You will need to

```
mv config/application.sample.yml config/application.yml
```

The configuration is done using [figaro](https://github.com/laserlemon/figaro) you can push the ENV variables to Heroku with

```
figaro heroku:set -e production
```

* Database creation/initialization

```
rake db:setup
```

* How to run the test suite

```
rspec
```

* Deployment instructions

If you need to setup heroku toolbelt setup -> [instructions](https://devcenter.heroku.com/articles/getting-started-with-rails5#local-workstation-setup) otherwise all you need are

```
heroku create
git push heroku master
heroku addons:create heroku-postgresql:hobby-dev
heroku run rake db:migrate
heroku addons:create sendgrid:starter
```

finally swap the domain/host for your new heroku domain in config/application.yml or the whole app may or may not tumble like a house of cards. However, the password reset email will definately bomb.

* Further notes

- Using jquery all the forms should be submitted by ajax, but will also function without javascript enabled
- The next step would probably be acceptance/inheritance tests. Currently testing out the actual work flow with the js requires hand testing and is therefore cumbersome.
- I didn't get around to styling the devise views.
- The only truly interseting code is found in [ErrorHelper](https://github.com/falonofthetower/custom/blob/master/app/helpers/error_helper.rb) && [ErrorProxy](https://github.com/falonofthetower/custom/blob/master/app/models/error_proxy.rb) which I used to simplifying creating a dummy set of errors while also simplifying the interface with standard ActiveRecord model errors.
