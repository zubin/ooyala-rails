require 'ooyala/rails/config'
require 'ooyala/rails/engine'
require 'ooyala/rails/version'
require 'ooyala/rails/video'

module Ooyala
  module Rails
    def self.config
      @config ||= Config.new
    end

    def self.configure
      yield config
    end

    def self.configured?
      config.configured?
    end
  end
end
