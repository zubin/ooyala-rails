# Ooyala::Rails

Integrates [Ooyala](http://www.ooyala.com/) with Rails

## Installation

Add the following to your application's Gemfile:

```ruby
gem 'ooyala-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-ooyala'
end
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

There are two modes of use:

### 1. Standard

1. Render the JS:

```erb
<!-- using configured player_id -->
<%= ooyala_js %>

<!-- specifying player_id -->
<%= ooyala_js player_id: 'PLAYER_ID_GOES_HERE' %>
```

2. Render the player(s):

```erb
<!-- using configured player_id and default player options -->
<%= ooyala_player 'your_embed_code' %>

<!-- specifying player_id and player options  -->
<%= ooyala_player 'your_embed_code', player_id: 'PLAYER_ID_GOES_HERE', options: {autoplay: true} %>
```

### 2. Using jQuery

1. Add the [jquery-ooyala](https://www.npmjs.com/package/jquery-ooyala) library to `application.js`:

```javascript
//= require jquery-ooyala
```

2. Render the players using the same arguments as with standard but using a different method:

```erb
<!-- using configured player_id and default player options -->
<%= jquery_ooyala_player 'your_embed_code' %>

<!-- specifying player_id and player options  -->
<%= jquery_ooyala_player 'your_embed_code', player_id: 'PLAYER_ID_GOES_HERE', options: {autoplay: true} %>
```

See [jquery-ooyala](https://www.npmjs.com/package/jquery-ooyala) documentation more functionality.

## CSS

The generated container `<div>` will require some basic CSS, eg:

```css
.oo-player { width:480px; height:360px; }
```
