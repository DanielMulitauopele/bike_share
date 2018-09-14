# README


#### View the results of this project on Heroku: [Bike Share](https://evening-lowlands-52452.herokuapp.com/)

This [project](https://evening-lowlands-52452.herokuapp.com/) was submitted as the Module 2 final for the Backend Program at the Turing School of Software and Design. Designed to teach students fundamental components of Rails, PostgreSQL, ActiveRecord, and TDD, this project represents the culmination of knowledge for Module 2 students. 


## What is it?


The [premise](http://backend.turing.io/module2/projects/bike-share-redux) of the project is to build a Bike Share website, that tracked the analytics of a San Francisco bike-for-rent company as well as to serve as a shop for bicycle-related accessories. The site needed to demonstrate full functionality, allowing the user to log in, log out, choose and checkout accessories, and to see relevant information pertaining to the trips, conditions, and stations involved with the bikes. 


## What did we use to build the site?
This site is an app built on the Ruby on Rails framework, utilizing a PostgreSQL database and ActiveRecord to interact with said database. We also used the following gems to help support our development:

* Ruby Version > 2.4.0
* Rails 5.1.6
* [Byebug](https://github.com/deivid-rodriguez/byebug/blob/master/README.md)
* [Capybara](https://github.com/teamcapybara/capybara)
* [Rspec-rails](https://github.com/rspec/rspec)
* [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
* [Pry](https://github.com/pry/pry)
* [Launchy](https://github.com/copiousfreetime/launchy)
* [Database-Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [SimpleCov](https://github.com/colszowka/simplecov)
* [FactoryBot](https://github.com/thoughtbot/factory_bot)
* [Friendly_ID](https://github.com/norman/friendly_id)


## What can I do on the site?

The site offers different functionality depending on the role: visitors, registered users, and administrators all have different functionality, as well different views. One of the primary lessons of this project was to ensure that users are restricted to their role, and that they are not able to access or control information in areas that they do not have authorization. 

* Users are able to view dashboards that demonstrate the analytics of different aspects of the bike share:
    * A Conditions Dashboard that displays the weather conditions of each day, as well calculated analytics
    * A Stations Dashboard that displays the all stations and their capacity, as well calculated analytics
    * A Trips Dashboard that displays the completed trip data, as well calculated analytics
* Users can see specific instances of trips, conditions, and stations on the individal show pages
* Users can visit the bike shop and add accessories to a fully-functioning cart
* Users can create an account
* Users can log in and complete purchases of items they have added to their cart
* Users can see orders that they have completed
* Users can update their own information
* Admin can edit information of analytics tables
* Admin can edit information pertaining to the bike shop 

With these features, visitors to our site can experience the full functionality of what a bike-sharing app might look like.

### Contributors

* Tara Craig, Project Manager
* Patrick Shobe
* Rajaa Boulassouak
* Daniel Mulitauopele


