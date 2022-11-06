# README

This file includes all the things you need to get this application up and running locally for development/testing.

List of articles from:
https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json

TODO:
 - tests
 - handling for bad articles
 - article helper method for total likes

## System dependencies

- Ruby 3.1.1
- Rails 7.0.4
- Postgres

### System setup

TODO: How to install rvm, ruby, rails and postgres on Linux?
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