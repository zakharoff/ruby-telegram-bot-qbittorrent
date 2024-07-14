# frozen_string_literal: true

module App
  module Operations
    class Torrents
      def call
        torrents = Api::Qbittorrent.new.torrents
        torrents.map { |torrent| "#{torrent['name']} - #{torrent['progress'] * 100}%" }.join("\n")
      end
    end
  end
end
