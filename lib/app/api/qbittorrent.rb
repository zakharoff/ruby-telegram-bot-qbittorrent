# frozen_string_literal: true

require 'net/http'
require 'faraday'
require 'uri'
require 'json'

module App
  module Api
    class Qbittorrent
      MAX_RETRY = 3

      attr_reader :client

      def initialize
        @cookie = nil
        @client = Faraday.new(url: Settings.qb_server)
      end

      def login
        response = client.post(
          '/api/v2/auth/login',
          username: Settings.qb_username,
          password: Settings.qb_password
        )

        @cookie = response.headers['set-cookie'].match(/(SID=[^;]+)/)[1]
      end

      def torrents
        login
        response = client.get(
          '/api/v2/torrents/info',
          {},
          { 'Cookie' => @cookie }
        )

        handle_response(response)
      end

      def add_torrent(torrent_url)
        login

        response = client.post(
          '/api/v2/torrents/add',
          { urls: torrent_url },
          { 'Cookie' => @cookie }
        )

        response.body
      end

      private

      def handle_response(response)
        JSON.parse(response.body)
      end
    end
  end
end
