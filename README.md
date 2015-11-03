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

To render a player:

    ```erb
    <%= ooyala_player 'your_embed_code' %>
    ```

This only works when `player_id` is configured.

To specify `player_id`:

    ```erb
    <%= ooyala_player 'your_embed_code', player_id: 'PLAYER_ID_GOES_HERE' %>
    ```

To add/override player options:

    ```erb
    <%= ooyala_player 'your_embed_code', options: {autoplay: true} %>
    ```

The generated container `<div>` will require some basic CSS, eg:

```css
div.ooyala-player { width:480px; height:360px; }
```
