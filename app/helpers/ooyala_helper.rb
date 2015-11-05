module OoyalaHelper
  # Generates Ooyala player JS
  def ooyala_js(player_id: default_ooyala_player_id)
    javascript_include_tag "//player.ooyala.com/v3/#{player_id}"
  end

  # Renders Ooyala player
  def ooyala_player(embed_code, div_id: embed_code, options: default_ooyala_player_options)
    render 'ooyala_player', embed_code: embed_code, div_id: div_id, options: options.to_json.html_safe
  end

  private

  def default_ooyala_player_id
    Ooyala::Rails.config.player_id
  end

  def default_ooyala_player_options
    Ooyala::Rails.config.player_options || {}
  end
end
