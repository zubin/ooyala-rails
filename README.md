# Ooyala::Rails

Integrates Ooyala with Rails

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ooyala-rails'
```

And then execute:

    $ bundle

Configure an initialiser like so:

```ruby
# config/initializers/ooyala.rb
Ooyala::Rails.configure do |c|
  c.api_key        = 'API_KEY_GOES_HERE'    # required
  c.secret_key     = 'SECRET_KEY_GOES_HERE' # required
  c.player_id      = 'PLAYER_ID_GOES_HERE'  # optional (see below)
  c.player_options = {autoplay: false}      # optional
end
```

Ideally, use ENV variables instead of storing your credentials in version control.

## Usage

First, render the JS:

```erb
<!-- using configured player_id -->
<%= ooyala_js %>

<!-- specifying player_id -->
<%= ooyala_js player_id: 'PLAYER_ID_GOES_HERE' %>
```

Next, render your player(s):

```erb
<!-- using configured player_id and default player options -->
<%= ooyala_player 'your_embed_code' %>

<!-- specifying player_id and player options  -->
<%= ooyala_player 'your_embed_code', player_id: 'PLAYER_ID_GOES_HERE', options: {autoplay: true} %>
```

The generated container `<div>` will require some basic CSS, eg:

```css
div.ooyala-player { width:480px; height:360px; }
```
