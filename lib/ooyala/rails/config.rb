module Ooyala
  module Rails
    class Config
      attr_accessor :api_key
      attr_accessor :player_id
      attr_accessor :player_options
      attr_accessor :secret_key

      def configured?
        api_key.present?
      end
    end
  end
end
