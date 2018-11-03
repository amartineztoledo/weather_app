Small web app that use openweathermap.org API to retrieve current T°.
## Requeriments

* Ruby 2.5.0
* bundler gem

## Get Started:
* Clone repo
`(git clone https://github.com/amartineztoledo/weather_app.git`
* Move to project folder and install Gems
`cd weather_app`
`bundle`
* Create database, run migrations and seed basic data
`rake db:create`
`rake db:migrate`
`rake db:seed`
* Run server
`rails s`

For simplicity, master branch use SQLite DB.
Heroku branch use PostgresSQL DB.

## Run tests with
`rspec spec`

