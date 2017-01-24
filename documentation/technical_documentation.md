## Main specs

- ruby version 2.4.0
- rails version 5.0.1

### Major gems

- devise
- bootstrap-sass
- sqlite3 for development and testing
- pg for production

In the program there is User model which is using Devise and Address model for the addresses
which user has. User can register, log in, add addresses, edit his addresses and also delete them.
User can export and import his addresses in csv format.

Device's confirmable module is also configured to use so user has to confirm his email address
after registration. In development Gmail is used as smtp server and in production emails are sent
from Sengrid via Heroku's Sengrid plugin.

ERB is used as the templating system for the views.

##Version control
Git is used as version control and project code is hosted at Github.
https://github.com/zHarrowed/AddressBook

## Continuous integration

Continuous integration service Travis CI is used to automatically test the software and build it
to the Heroku from Github. https://the-addressbook.herokuapp.com/

## Testing
- rspec-rails
- factory_girl_rails
- capybara
- coveralls

Automated testing is demonstrated with some Rspec tests for the Address model and couple feature
tests for Adding new address. Travis produces coverage reports with coveralls from those tests.

Automated testing is not nowhere near comprehensive and most of the features were tested by hand.
