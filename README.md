## Test for whitespectre.com

Write a model (ActiveRecord-based) for storing global configuration settings. It will be used for storing single values, for example an email address to send error emails to, or a flag enable/disable a particular feature. The interface must be simple and convenient, it should be possible to read and write specific configuration items. It must be possible to store values of these 4 types: string, integer, float and boolean. The model should come with a unit test and a migration.

Init database
$ rake db:drop db:create db:migrate

Run tests
$ rspec