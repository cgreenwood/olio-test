# README

This file includes all the things you need to get this application up and running locally for development/testing.

Known issues:
 - Bad handling of erroneous articles
 - Limited tests, need tests for not happy path
 - URLs are not stubbed for testing

## System dependencies

- Ruby 3.1.1
- Rails 7.0.4
- Postgres

## System setup

Install RVM and ruby using this (guide)[https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rvm-on-ubuntu-20-04]

Install Postgres using this (guide)[https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-20-04]

## Setup

Clone the repo using the following command:
```
git clone git@github.com:cgreenwood/olio-test.git
```

Install bundler and gems:
```
gem install bundler
bundle
```

Rename and change values of settings files
```
cp database.yml.example database.yml
code .
```

Change the value of `username` and `password` within this file.

Setup the database:
```
rake db:setup
```

Start the application:
```
bin/dev
```

Open the application by going to http://localhost:3000


## Testing

### Rubocop

Run the following command:
```
rubocop
```

### Brakeman

Run the following command:
```
brakeman
```

### Rspec

Setup the test database
```
rake db:test:prepare
```

Then run the following command:
```
rake spec
```

### Cucumber

Setup the test database
```
rake db:test:prepare
```

Run the following command:
```
cucumber features
```