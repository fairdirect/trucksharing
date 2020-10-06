# Open Food Bank - logistics app

## Development

### Setting up

#### Docker

* `docker-compose build` - compose your container
* `docker-compore run web_api rails db:create` - create your databases

#### Marketplace Database

* `docker-compose run web_api bash` - enter to the command line of your container and load an `.sql` file to your database with the Epelia schema by using `psql -U postgres epelia_development <  db/marketplace_db/epelia.sql -h marketplace_db`. You will be prompted to provide your database password.

#### Seeds

* `docker-compose run web_api rails db:seed`

## Domain

### Why?

### What?

### How?

#### Graph Hooper

## Architecture

### Inspiration
https://web-crunch.com/posts/ruby-on-rails-api-vue-js

### Docker

We have three images: `web_api`, `logistics_db` and `marketplace_db`

* `web_api` - Ruby on Rails API server.
* `logistics_db` - database for the Ruby on Rails API server.
* `marketplace_db` - database with a schema of an existings application.

### Back-end: Ruby on Rails 6.0.3.3

 We use JWT tokens for user authentication https://github.com/tuwukee/jwt_sessions which are stored on the marketplace application's database.

#### Environment Variables

 We are using https://github.com/bkeepers/dotenv for holding env variables in a file. We will use actual environment variables on production.

#### Specification and Testing

 We use RSpec (for Ruby on Rails) for writing specification and testing our code against it.

 If you use a docker build, you can run your tests via `docker-compose run web_api bundle exec rspec path/to/spec` command. If you run it on your host machine, you can just use `bundle exec rspec path/to/spec`

 You can find relevant information about the gem here: https://github.com/rspec/rspec-rails. More about usage is placed here: https://relishapp.com/rspec

### Front-end: Vue.js

## Useful links

