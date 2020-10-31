# Open Food Bank - logistics app

## Development

### Setting up

#### Docker

* `docker-compose build` - compose your container
* `docker-compore run web_api rails db:create` - create your databases
* `docker-compore run web_api rails db:schema:load` - load your databases schemas

#### Seeds

* `docker-compose run web_api rails db:seed`

## Domain

### Why it was made?

 This application connects Recipients of food donations with heavy transport Service Providers.

### What does it do?

 This reduces the amount of wasted food by accelerating transport arrangements.

 Filters Shipment Requests based on a Route and vice versa. Decreases search time for an ideal match.

### How does it?

#### Basis

 Imports Orders requiring heavy transport (`app/models/marketplace/order.rb`) as Shipping Requests (`app/models/logistics/shipping_request.rb`).

 Shipping Request contains necessary information to arrange transport:
* recipient's reference,
* pickup address,
* destination address,
* routes length,
* weight,
* liters of fuel required,
* estimated cost of fuel,

#### Route Matching

 Both A Shipping Request and a Route have departure and destination addresses.

 This allows us to calculate the general direction of both. (`app/services/shared/routes/route.rb`). This determines if the Shipping Request has the same direction as a Route.

 A Route consists of multiple paths through the real world. Route is curved. It has a latitude maximum, latitude minimum, longitude minimum, longitude.maximum.

 Those coordinates create a rectangle field with coordinates:
* A (lat_max, lng_min)
* B (lat_max, lng_max)
* C (lat_min, lng_min)
* D (lat_min, lng_max)

 This rectangle conatins all available addresses on a Route's path.

 *Remember that coordinates are reversed!* Instead of points with (x, y), you have (y, x). Y is the latitude and X is the longitue.

*Visualize!* It is important.

 Take a piece of grid paper (the one you used for math in school). Draw a cartesian coordinates system on the paper. Draw points:
* A (4, 2) - departure point - latitude maximum
* B (2, 4) - curve - longitude maximum
* C (1, 3) - destination point - latitude_minimum
* D (3, 1) - curve - longitude minimum

  Connect those points with lines in order: A to D, D to B, B to C. A rectangle that contains all points will be:
* L (4, 1)
* M (4, 4)
* N (1, 1)
* O (1, 4)

  This is the field we were talking about.

### Matching Recipient's Shipping Requests with Service Provider's Routes

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

 We use a rondom generated token for user authentication which is stored on the marketplace application's database (marketplace_db).

#### Environment Variables

 We are using https://github.com/bkeepers/dotenv for holding env variables in a file. We will use actual environment variables on production.

#### Specification and Testing

 We use RSpec (for Ruby on Rails) for writing specification and testing our code against it.

 If you use a docker build, you can run your tests via `docker-compose run web_api bundle exec rspec path/to/spec` command. If you run it on your host machine, you can just use `bundle exec rspec path/to/spec`

 You can find relevant information about the gem here: https://github.com/rspec/rspec-rails. More about usage is placed here: https://relishapp.com/rspec

### Front-end: Vue.js

## Useful links

