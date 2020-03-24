# Ruby on Rails-Portfolio-Project-vue-tube

- Overview

The intended use of vue-tube is to see how an Email-Client works theoretically, without actually sending an email, however a latter version may have this functionality.  A new user can sign-up, then login and logout, as can an existing user, a user may also chose to login via their Google account using Oauth2.  At this point a user can create a new email, select a user from the dropdown selection and send the email.  Once an email is sent it will be displayed in the users outbox, when the user receives an email it will be displayed in both the inbox and recent unread box unit it is clicked on.  a user can also select the read option in the inbox, at which point the email will go from false to true on the join tables read column.  As a side note one may ponder why the name vue-tube and not something else, as I began this endeavour I envisioned creating an analog to Youtube.  This vision was quickly dashed by the need for a scope to be selected from Google at the time I requested the Youtube V3 data api, what is a scope, it is how your app will interact with Youtube to make requests to insert videos, view videos, view watchlists, view playlists, etc.  With that being said I was advised by Google that any scope selected would take 4-6 weeks to verify for usage with my app, and depending on the scope may cost $15-$75K.  As I had already begin coding the Authorization and Authentication for my app my next objective was to build something from the bones of my auth and Oauth code, so I chose the Email-Client domain.

## Installation

ruby '2.6.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'devise'
gem 'pry'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'google-api-client'
gem 'dotenv-rails'
gem 'materialize-sass'
gem 'bootsnap', '>= 1.4.2', require: false
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

execute: 
  $ bundle 
  or 
  $ bundle install

## Usage

Step 1: Clone the following repo https://github.com/Alendor22/vue-tube then cd into the newly cloned directory, vue-tube.
Step 2: To run the application open a terminal in the editor of your choice or use the terminal offered by your laptop and enter the following command $ rails s or $ rails server.  This will start the server on the loaclhost port 3000 of your browser also known as localhost:3000, type this into the URL of your browser to see the application in action.
Step 3: Sign-up as a new user, or login via Goolge Oauth2 (OmniAuth2), then select create an email, fill out the form and hit send after which you will be redirected to the index view where you will see your recent unread emails, the inbox for emails sent, as well as the outbox for the emails received.
Step 4: To update an email, open an email, navigate to the update Email link and click it, at which point you will be prompted by a form to edit the current email.
Step 5: To Delete an email select an email, navigate to the delete Email link and click it, that it its deleted.