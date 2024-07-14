# frozen_string_literal: true

module App
  module Operations
    class AddTorrent
      def call(torrent_url)
        Api::Qbittorrent.new.add_torrent(torrent_url)
      end
    end
  end
end
