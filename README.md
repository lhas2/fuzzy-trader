# Fuzzy Trader

This application is a tool for new investors in cryptocurrencies.

## How it works?

The user should add a new transaction, with some infos like: value to be invested, fiat and crypto desired. The app will persist the actual ticker for this transaction.

Then, the user can see her wallet. The wallet will display all transactions made by the user.

The wallet will display to each transaction:

- The fiat value in the start date;
- The crypto price in the start date;
- The fiat value today;
- The crypto price today.

## How to run

First, you must clone this repository:

```bash
git clone git@github.com:lhas2/fuzzy_trader.git
cd fuzzy_trader/
```

Then, you must install all dependencies:

```bash
bundle exec bundle install # install Rails deps
yarn install # install front-end deps
```

If this is the first time you are running the application, you must create the database and run all migrations:

```bash
bundle exec rake db:create
bundle exec rake db:migrate
```

With the database migrated, you can start the application:

```bash
bundle exec rails server
```

## Requirements

- Ruby 2.7+;
- PostgreSQL;

## Deploy

Just push code to the `master` branch and it will be available in the production environment, thankfully to Heroku.

## Contact

Just ping me at [luizhrqas@gmail.com](luizhrqas@gmail.com). =)
