# Pprolist

This is an api for managing interactions with Pprolist frontend client api, written in Rails. You can find the repo for the frontend to start testing: 
[https://github.com/pjavadi84/pprolist-serverside]

Things you may want to cover:

* Ruby version

* System dependencies
No depedencies. Just make sure you type and run "bundle install" on your command line to install all the predefined dependencies in Gemfile. 

* Configuration
You only need to make sure to make CORS depedencies enabled and set origins "*" under [config>initializers>cors.rb]

* Database creation
This api is built based on an open source Postgres SQL. Two tables have been created: Vendor and Product. Vedor has many Products. 

* Database initialization
To initialize, assuming running postgresql setup on your end:

> rails db:create
> reails db:migrate

If you want to create more seed records, run the line below to migrate the seed records to database for testing on your client side and verify through communication between your front end and back end:
> rails db:seed

Finally, run:
>rails s
(p.s. you add -p <PORTNAME>, (e.g. 3001,3002, etc))


* How to run the test suite
There is no independent test suit written for this project. Feel free to use and write test. 

* Services (job queues, cache servers, search engines, etc.)
N/A


* Deployment instructions
N/A
* ...
