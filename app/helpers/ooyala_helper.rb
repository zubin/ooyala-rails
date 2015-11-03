module OoyalaHelper
  # Renders Ooyala player
  def ooyala_player(embed_code,
                    div_id: embed_code,
                    player_id: Ooyala::Rails.config.player_id,
                    options: Ooyala::Rails.config.player_options || {})
    @loaded_ooyala_js ||= Set.new
    render('ooyala_player',
           embed_code: embed_code,
           div_id: div_id,
           player_id: player_id,
           options: options).tap do |_|
      @loaded_ooyala_js << player_id
    end
  end
end
