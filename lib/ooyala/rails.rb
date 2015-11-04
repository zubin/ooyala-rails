require 'ooyala-v2-api'
require 'ooyala/rails/version'

module Ooyala
  module Rails
    def self.api
      @api ||= Ooyala::API.new(config.api_key, config.secret_key)
    end

    def self.config
      @config ||= Config.new
    end

    def self.configure
      yield config
    end

    def self.configured?
      config.api_key.present?
    end

    class Config
      attr_accessor :api_key
      attr_accessor :player_id
      attr_accessor :player_options
      attr_accessor :secret_key
    end

    class Engine < ::Rails::Engine
    end
  end
end
