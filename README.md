# README

This app is made as part of the bootcamp The Hacking Project.
It aims at creating a realistic database in Ruby on Rails that represents a Airbnb for dogsitter website : dogsitter make strolls with dogs and both of them are tight to a city.

## The Ruby version

The ruby version used is 2.5.1.
The rails version used is volontarily 5.2.4.
.

## Install from your console

`git clone https://github.com/JadeCaillot/champagnon.git`

Install the bundle:
`bundle install`

Migrate the database:
`rails db:migrate`

Seed the database:
`rails db:seed`

And launch the server:
`rails server`

And then access the localhost accordingly, for instance:
`http://localhost:3000/`

access to heroku app:
'https://champagnon.herokuapp.com/'

## Additional Gems used

We have used some additional Gems such as:

Faker gem for generating random data
gem 'table_player'
gem 'devise'
gem 'stripe'
gem 'dotenv'

## Start playing around with the database in the sandbox:

To use, please follow these commands:
`rails console --sandbox`

### Run tests yourself:

- The database has been seeded to enable testing. To do that, first launch your rails console from your terminal in test environment, so that nothing will be saved:

`rails console --sandbox`
