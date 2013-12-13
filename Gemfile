source 'https://rubygems.org'
source 'http://gems.github.com' # for ambethia-smtp-tls

gem 'rake', '0.8.7'  # a make like build program for Ruby

gem 'airbrake', :require => 'airbrake/rails'  # sends application errors to Airbrake server, used in loyalty registration callback
gem 'net-scp'  # ruby implementation of SCP protocol (not used)

gem 'rails', '~>2.3.16', :require => nil
gem 'paperclip'  # easy file attachment manager for ActiveRecord, used in its own files lib/paperclip/csv.rb (not used)

gem 'authlogic' # model based ruby authentication solution, used in user_session model


# for performing paginated queries with ActiveRecord; used in dealer/restuarants/user management
gem 'will_paginate', '2.3.15' #will_paginate 3.0 is not compatible with Rails 2.3 or older 

gem 'uuidtools' #unique id generation library, used in business/dealer models to generate id and timestamps

gem 'semanticart-is_paranoid', '>= 0.9.6', :require => 'is_paranoid' #allows to hide and delete records without actually deleting them, 
# used in some models ie. business, brand, corporation

# gem 'acts_as_paranoid'
gem 'hoptoad_notifier'

gem 'geokit'  # API for geocoding and distance calculation ,  used in profile and business models to set latitude/longitude

gem 'net-dns', '>= 0.6.1', :require => 'net/dns' # dns library written in Ruby, used in Domain.rb

gem 'chronic' # natural language date/time parser, used in Reservations controller

gem 'factory_girl'  # as an easier version to fixtures 

gem 'faker'    # to easily generate fake data, used in rake task i.e. populate, random_localeze and pacifica 

gem 'fastercsv'  # faster than standard CSV library for parsing .csv files, used in customer import/export, and dashboard lite vouchers.

gem "comma", "~> 2.0"  # for comma seperated values generation (not used)
gem 'less', '1.2.21' # to invoke Less CSS compiler (not used)
gem 'json', '1.1.9' #represent data in javasript object notation
gem 'aws-s3', :require => 'aws/s3' # library for Amazon's Simple Storage REST Service, used in landing page controller

gem 'happymapper', '0.3.0' # object to xml mapping library (not used)

gem 'hpricot'  # html parser, used in users controller and website_text_block model
gem 'twitter', '0.9.12' # new versions like     twitter (4.5.0) need code uddates   used in website builder which is currently not there
gem 'stomp'  # for sending and receiving messages from a Stomp protocol (not used)

gem 'activemessaging' # messaging framework for Ruby, used in some config files
gem 'curb'  # provides Ruby language binding for libcurl(3) (not used)
gem 'aasm'  # for adding finite state machines to Ruby classes, used in models related to website builder i.e. website widgets, marketing campaign model, discounted purchase model, loyalty balance, email sms template and customer import   
gem 'reliable-msg' # optional? will this be used? (not used)

gem 'inherited_resources', '1.0.6' # Newer versions are Rails 3.x only
gem 'bkoski-rails_env', :require => 'rails_env'  #simplifies conditional RAILS_ENV checks, used in User fixtures
gem 'ambethia-smtp-tls', '1.1.2', :require => 'smtp-tls' # gem to enable Transport Layer Security (TLS) for Net::SMTP, 
gem 'csspool'  # css parser, widgets controller and web page builder

# SOAP client, used in localeze lib file which is used in profile listings (not there in Zonal only in ProfitStreams US instance)
gem 'savon', '0.9.2' # => Can not upgrade to 2.1.0, Savon 2 expects a Hash of options for creating a new client and executing requests. 


gem 'rqrcode'  # library for encoding QR codes , used in landing page and loyalty enrollment widget

gem 'rmagick', '~>2.12.0', :require => nil # interface between ruby and ImageMagick, used in loyalty enrollment widget to generate the QR code and landing page

gem 'acts-as-taggable-on', '2.1.0' # tagging plugin that allows for customic tagging with dynamic context, used in restaurant metadata with neighborhoods tag (not 

gem 'configatron'  # ruby configuration system, used in Instance model

gem 'going_postal'  # zipcode formatting and validation for UK, US etc., used in customer profiles

gem 'nokogiri'  # html, xml parser and search ability via XPath, used in api libraries i.e. merchant_sync, rpwr to build xml that is passed to remote api service

gem 'rubyzip' # library for reading and writing zip files, used in exportdata jobs

gem 'after_commit' #plugin to provide after_commit callbacks, only used in marketing campaign controllers and brand model

gem 'rdoc', '~>2.4.2' #produces Html and command line documentation

# gem 'therubyracer', :platform => :ruby, :require => 'v8' #Embed the V8 JavaScript interpreter into Ruby.
gem 'httparty' # api for consuming restful web services, used in Bitly class

# Seems like this should only be required for tests, but running
# any rake task will fail without it (therefore deployments fail).
gem 'rcov'  # code coverage tool used during testing

# Databases
gem 'mysql'

gem 'whenever', :require => false

# Newer version of daemon-spawn (0.4.0) causes deployment problems.
gem 'daemon-spawn', '0.2.0' #daemon management tool used in delayed job script

# These were needed for 'rake spec'.
gem 'garb', '0.3.1' #google analytics api (not used)
gem 'roo', '1.9.3' #interface to spreadsheets, used in Menu model
gem 'spreadsheet', '0.6.4.1'  # read and write spreadsheet in Microsoft Excel (not used)
gem 'google-spreadsheet-ruby', '0.1.1'  #library to read/write google spreadsheets (not used)

# From config/environment.rb:
# gem "rubywmq" # optional, for websphere mq, fails... expects /opt/mqm/inc/cmqc.h, leaving this one alone for now

group :development do
  gem 'ruby-debug' #command line interface for ruby-debug
end

# Testing environments
[:test, :cucumber].each do |name|
  group name do
    # gem 'cucumber','>= 0.5.2'
    # gem 'cucumber-rails', '>=0.3.2'
    gem 'factory_girl'
    gem 'chronic'
    gem 'timecop' 
    # rspec 2.x is for Rails 3.x only
    gem 'rspec','~> 1.3.0'
    gem 'rspec-rails','~> 1.3.2'
  end
end

group :cucumber do
  gem 'database_cleaner', '>=0.5.0'
  gem 'kelp' # provides helper methods for Cucumber for writing step definitions, used in features/step_definitions
  gem 'capybara', '>= 0.4.0' #integration testing tool for web applications
  gem 'launchy'
  # email_spec 1.x is for Rails 3.x only
  gem 'email_spec', '~> 0.6.0'
end

group :test do
  gem 'rcov'
  gem 'shoulda'
  gem 'faker'  
  gem 'populator'
  gem 'mocha' # mocking and stubbing library (not used)
  gem 'jasmine' # to test javascript without any framework dependencies, 
  gem 'launchy'
end
