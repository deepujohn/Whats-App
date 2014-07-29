##WhatsApp Project
###First step

###Add dependency gems to our gem file

````ruby
source 'https://rubygems.org'
ruby '2.1.2'
gem 'rails', '4.1.4'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
# Use unicorn as the app server
gem 'unicorn-rails'
gem 'quiet_assets', group: :development
gem 'simple_form'
gem 'country_select'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'carrierwave'
gem 'devise'
group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end
group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
````

Then to get them

````console
bundle
````

Install Bootstrap

To generate bootstrap

````console
rails generate bootstrap:install static
````

For generating responsive layout

````console
rails g bootstrap:layout application fluid
````

Install Simple Form

To install simple form with bootstrap

````console
rails generate simple_form:install --bootstrap
````

To generate mailer

````console
rails g mailer UserMailer
````

Edit user_mailer as

````ruby
class UserMailer < ActionMailer::Base
  default from: "your email"
  def contact(user)
    @user=user
    @to="to email"
    @url='http://WhatsApp.com/contact'
    mail(to: @to,subject: 'A Message From WhatsApp Contact')
  end
end
````

Add Scaffold

For our conveniance, we use scaffold.

````console
rails g scaffold Contact name email message:text
````

then run migration file to create table

````console
rake db:migrate
````

To configure Our Mailer

Add to Environment/development.rb

  ````ruby
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }   

  config.action_mailer.delivery_method = :smtp


   config.action_mailer.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "localhost:3000",
  :user_name => *"enter our email address"*,
  :password => *"enter our email password"*,

  :authentication => 'plain',
  :enable_starttls_auto => true }
  ````

Remove unneccessary files from contacts

We require only three actions [new,create,show] and two views [new and show] one partial [_form]. So remove the rest from contacts folder
Add Mail Sender to controller

We need to simply call the mailer function from our controller when our new contact is created.

Redefine our ContactsController

````ruby
def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
     if @contact.save
        UserMailer.contact(@contact).deliver 
        format.html { redirect_to @contact, notice: 'Message has been successfully sended.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
  ````

*Rest is all yours. Remove all unnecessary links and as give good value for button nice heading and so on. All the best
Adding Contact Us link in the navigation bar*

This can be more simpler if you know bootstrap and layout. In views/layout/application.html.erb file

First find the div with class navbar and then simply change link_to with hyperlink and path

````html.erb
   <div class="navbar navbar-fluid-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-target=".nav-collapse" data-toggle="collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">WhatsApp</a>
          <div class="container-fluid nav-collapse">
            <ul class="nav">
              <li><%= link_to "Link1", "/path1"  %></li>
              <li><%= link_to "Link2", "/path2"  %></li>
              <li><%= link_to "Contact Us", "/contacts/new"  %></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
````    


## To generate uploader

````console
rails generate uploader Photo
rails generate uploader Resume
````
## To generate career controller

````console
rails g controller Careers new create 
````
## To generate model and table for career

````console
rails g model Career first_name last_name city country email phone resume photo

rake db:migrate
````
##Using Devise Gem

Add gem to gemfile

````ruby
gem 'devise'
````
Next run generator

````console
rails generate devise:install
````
Next we can add devise to any of the models

````console
rails g devise User
````
Next goto migration file get at last file and uncomment all lines  with single hash symbol.

````console 
rake db:migrate
````
Now generate views

````console
rails g devise:views users
````
Add in user model

````ruby
:confirmable, :lockable, :timeoutable
````
Then add in routes

````ruby
devise_for :users, :path => '', :path_names => {:sign_up => 'signup', :sign_in => 'signin', :sign_out => 'signout'}  
````

##Portfolio

````console
rails g scaffold portfolio title description image user:references
````
Now generate uploader

````console
 rails g uploader Image
````
Now mount uploader and add validations to the portofolio

````ruby
class Portfolio < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title,:description,:image,presence:true
end
````
Add this to _form

````html.erb
<%= f.hidden_field :user_id,value: current_user.id%>
````
## Convert to HAML

add gems

````ruby
gem 'erb2haml'
gem 'haml-rails'
````
To replace existing

````console
rake haml:replace_erbs
````
## Add confirmations controller

````console
rails g controller Confirmations
````
Then add this to confirmations controller

````ruby
protected
     def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        home_path
      else
        new_session_path(resource_name)
      end
    end
````
## Adding Captcha

Add this gem to Gemfile

````ruby
gem 'devise_security_extension'

````
Now install it using 
````console
bundle
````
Now generate simple captcha using the command

````console
rails generate devise_security_extension:install
````
Now add to config/initializers/devise.rb

````ruby
  # captcha integration for recover form
   config.captcha_for_recover = true

  # captcha integration for sign up form
   config.captcha_for_sign_up = true

  # captcha integration for sign in form
   config.captcha_for_sign_in = true
````
Now add to gem file

````ruby
gem 'easy_captcha'
````
Now run initializer

````console
rails generate easy_captcha:install
````

For validations add this to user model
````ruby
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,:secure_validatable
````
Now to add captcha to our view use this lines
````haml
= captcha_tag 
= text_field_tag :captcha 
````