# Quiz master

## Purpose
Use this quiz to sharpen your knowledge on any field of interest.

## Usage
There are two main parts. One is the quiz taking and the other one is subscription management

In order to take the quiz
* Select a user from the home page to login
* Complete the quiz by answering all the questions
* See the results in the next page

Once you have logged in you can upgrade the subscription to access documentation on how to prepare for the 
quiz

## Installation locally 
You can install it locally by running the following commands in the terminal

make sure you have ruby 3.0.0, postgres and yarn installed

* `bundle install` to install the dependencies
* `rails db:setup` to create the databases
* `rails db:schema:load` to load the db schema and run the seeds will populate the tables with some dummy data
* `rails s` to start the server and head straight to http://localhost:3000 to view the app

The schema also exists on the /schema.xml and can be viewed by navigating to the url at the top of the file
You can repopulate the db with dummy data by using the rake tasks found /lib/tasks like so, 
` bundle exec rake alexweb:create_quiz` and you can also view all the tasks with `bundle exec rake -T` assuming they have a 
description.

## Things missing 
* Proper user authentication, there is no login form
* Proper authorization, anyone can create quizzes and questions
* The cron job that would check and expire the subscriptions that have reached their end date



