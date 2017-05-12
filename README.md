# Seth Goodman - CompSci 290.02 - Final Project

## Heroku: https://fierce-chamber-67255.herokuapp.com/

## About this Application

Health care is expensive and often unaffordable for people who need it most.
  A relatively unknown fact is that the same care may cost significantly
  different from one hospital to another—since doctors and hospitals decide
  how much they want to charge for specific procedures—making the choice of
  hospital very important in the decision process. This application should make
  the process of choosing where to seek care much easier, by taking pricing data
  for specific care from providers around the country and sorting the data by
  cost, region, and type. The other element of this website is to make the data
  visual, by showing bar charts and a choropleth map of pricing.

## Running the Program

The application is already established in Heroku, but if entering the information
in a new database is required, the commands:
`rake db:migrate` and
`rake db:seed`.
The seeding file is preloaded with the database information (which is a fraction
  of the total, government-provided database) and login information for a pre-seeded
  administrator here: `db/seeds.rb`.

The administrator credentials are:
* **Admin Email**: admin@admin
* **Admin password**: password

A normal username credentials are as follows:
* **Email**: a@b
* **Password**: 123456

Each of the entries in the dataset has its own JSON data file. In order to access
this file, the user must click the "More information" button for the specific
entry and then add the __.json__ extension to the end of the website. For example: https://fierce-chamber-67255.herokuapp.com/health_data/4512.json.

## References

The full dataset can be found here: https://data.cms.gov/resource/ehrv-m9r6.

A small subset can be downloaded here: https://data.cms.gov/resource/ehrv-m9r6.json.

