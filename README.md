# README

- Ruby version 2.3.0
It's in the Gemfile. It's probably not vital, but it is not otherwise tested

- To get the app up and running you will need to setup the ENV variables

```
mv config/application.sample.yml config/application.yml
```

The configuration is done using [figaro](https://github.com/laserlemon/figaro) you can push the ENV variables to Heroku with

```
figaro heroku:set -e production
```

- Database creation/initialization

```
rake db:setup
```

- Run the rspec test suite with (wait for it)

```
rspec
```

There are a ton of deprecation messages. They look like a tremendous amount of technical debt. Version 0.2 appears to be canceled though so we won't waste time fixing it this round.

- Deployment instructions

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
