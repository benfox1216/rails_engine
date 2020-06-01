# Rails Engine

This was a solo project with the goal of importing CSV data, and exposing an API with specified end points. The repo [Rails Driver](https://www.github.com/benfox1216/rails_driver) is the front end we were given, and it contains a spec harness to test the API.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

### Installation
*Terminal commands are on a Mac*

From your terminal, go to the folder you want to install this project in, and create a folder to contain both this repo and the [Rails Driver](https://www.github.com/benfox1216/rails_driver) repo, cd into it, then run these two commands:

```
git clone https://github.com/benfox1216/rails_engine.git
git clone https://github.com/benfox1216/rails_driver.git
```

Enter the command `cd rails_engine`

Open the directory in your favorite text editor.

Make sure Ruby 2.5.7 is installed. Install Bundler, then run it to install the remaining gems in the gemfile:

```
gem install bundler
bundle install
```

## Testing

You can run the test suite by running `bundle exec rspec`.

These test that all the endpoints are sending the correct responses back, using the factory_bot_rails and faker gems in order to create database objects for tests. You will also have the ability to utilize `binding.pry` to pry into the code wherever you'd like to.

All 27 tests should pass, with 100% test coverage.

## Usage

Enter `rails s` to start your local server.

Open another terminal winder, and go to the rails_driver directory.

Again, open the directory in your favorite text editor, and run `bundle install`.

Run `figaro install` to create your environment variables file (which is added to .gitignore).

Add `RAILS_ENGINE_DOMAIN: http://localhost:3000` to your new application.yml file in your config folder.

Enter `bundle exec rspec` to run the spec harness. All 17 tests should pass.

You can also open localhost on your browser, and put in the URLs from the tests in the spec harness to see the responses.
