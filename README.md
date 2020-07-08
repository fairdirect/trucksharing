# Open Food Bank - logistics app

## Domain

### Why?

### What?

### How?

## Architecture

### Inspiration
https://web-crunch.com/posts/ruby-on-rails-api-vue-js

### Docker

We have three images: `web_api`, `logistics_db` and `marketplace_db`

* `web_api` - Ruby on Rails API server.
* `logistics_db` - database for the Ruby on Rails API server.
* `marketplace_db` - database with a schema of an existings application.

### Back-end: Ruby on Rails 5.2

 We use JWT tokens for user authentication https://github.com/tuwukee/jwt_sessions which are stored on the marketplace application's database.

### Front-end: Vue.js

## Useful links

