- gem 'devise'

- bundle update

- follow devise cheatsheet, talk about documentation

*** do devise things that it tells you that aren't in documentation

- add nav block 

```ruby
<ul>
  <% if user_signed_in? %>
    <li><%= link_to('Edit your account info', edit_user_registration_path) %></li>
    <li><%= link_to('Sign Out', destroy_user_session_path, method: :delete) %></li>
  <% else %>
    <li><%= link_to('Sign In', new_user_session_path) %></li>
    <li><%= link_to('Sign up', new_user_registration_path) %></li>
  <% end %>
</ul>
```

- generate views



- generate migration, add things to user table
- talk about controller override
- write controller
- update views



### Omniauth

- gem 'omniauth-github'
- go to github, register your application

homepage url: http://localhost:3000/
callback url: http://localhost:3000/users/auth/github/callback

clientID: 757c014ee6fada132c29

client secret: a17e7451c65a4c512d276074eb759b507e38dc8b


- uncomment devise omniauth line, add in id and secret
```ruby
  config.omniauth :github, '757c014ee6fada132c29', 'a17e7451c65a4c512d276074eb759b507e38dc8b', scope: 'user:email'
```

- write callbacks controller

```ruby
class CallbacksController < Devise::OmniauthCallbacksController

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
end
```

- whitelist controller in routes
```ruby
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks' }
```

- add provider and uuid to user model
```ruby
rails g migration AddOmniauthToUsers provider:string uid:string
rake db:migrate
```
- add omniauthable to Users model (:omniauthable)


- def from_omniauth in model
```ruby
  def self.from_omniauth(auth)
    where(provider:auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.name
      user.last_name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
```

