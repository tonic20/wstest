# Test for whitespectre.com

Write a model (ActiveRecord-based) for storing global configuration settings. It will be used for storing single values, for example an email address to send error emails to, or a flag enable/disable a particular feature. The interface must be simple and convenient, it should be possible to read and write specific configuration items. It must be possible to store values of these 4 types: string, integer, float and boolean. The model should come with a unit test and a migration.

Bonus: add caching within the model so that values are cached in regular Rails cache to minimize db load.

## Tests

Init database:

$ rake db:drop db:create db:migrate

Run tests:

$ rspec

## Usage

Store setting value:

    >> AppConfig[:name] = 'new value'

Read setting value:

    >> AppConfig[:name]
    => "new value"
