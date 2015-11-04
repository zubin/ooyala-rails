require 'ooyala-v2-api'

module Ooyala
  module Rails
    class Video
      NotFound = Class.new(StandardError)

      attr_reader :embed_code
      class << self
        delegate :config, to: Ooyala::Rails
      end
      delegate :api, to: :class

      def initialize(embed_code)
        @embed_code = embed_code
      end

      def self.api
        @api ||= Ooyala::API.new(config.api_key, config.secret_key)
      end

      def self.find(embed_code)
        new(embed_code).tap do |video|
          raise NotFound unless video.exists?
        end
      end

      def duration
        return unless duration_in_seconds
        mins = (duration_in_seconds / 60.0).floor
        secs = duration_in_seconds % 60
        '%s:%s' % [mins, secs]
      end

      def exists?
        data
      end

      def preview_image_url
        data['preview_image_url'] if data
      end

      private

      def data
        if embed_code.present?
          @data ||= api.get('assets', where: "embed_code = '#{embed_code}'").fetch('items').first
        end
      end

      def duration_in_seconds
        data['duration'] if data
      end
    end
  end
end
