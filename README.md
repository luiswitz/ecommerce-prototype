# Ecommerce Prototype

This project is a concept of an ecommerce.

It has just basic functionality like:
- create orders
- add products to the order
- remove products from the order
- edit products from the order

Every time an order is finished, another one is created and the shopping starts at the beginning again.

## Setup

To get the project up and running, follow this steps:

Build docker image
```
docker-compose build
```

Create database
```
docker-compose run --rm app bundle exec rails db:create
```

Run migrations
```
docker-compose run --rm app bundle exec rails db:migrate
```

Fill database with data
```
docker-compose run --rm app bundle exec rails db:seed
```

Run project
```
docker-compose up
```

## Running tests

In order to run the tests, execute the following command
```
docker-compose run --rm app bundle exec rspec
```
