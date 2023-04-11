# Dooist backend

## Getting started

`$ bundle install`

## Database creation

To create the database

`$ rails db:create`

To drop if you want

`$ rails db:drop`

## Database initialization

To fill the now created database run the following command:

`$ rails db:seed`

This will create a mock user for your to use with a project and a few todos in place

```bash
username: "tester",
email: "test@email.com",
password: "SuperSecretPassword"
```

### Migrations

## Tests

We are using Rspec for testing which comes with a factory creation for models

`$ bundle exec rspec [file path]`
