# frozen_string_literal: true

module App
  module Controllers
    class Message
      attr_reader :bot, :message

      def initialize(bot, message)
        @bot = bot
        @message = message
      end

      def call
        case message.text
        when '/start'
          start
        when '/list'
          torrents
        when %r{^/add_torrent}
          add_torrent(message.text.split(' ')[1])
        else
          not_defiend
        end
      end

      private

      def start
        bot.api.send_message(chat_id: message.chat.id, text: I18n.t('bot.welcome'))
      end

      def torrents
        result = Operations::Torrents.new.call
        bot.api.send_message(chat_id: message.chat.id, text: result)
      end

      def add_torrent(torrent_url)
        result = Operations::AddTorrent.new.call(torrent_url)
        bot.api.send_message(chat_id: message.chat.id, text: result)
      end

      def not_defiend
        bot.api.send_message(chat_id: message.chat.id, text: I18n.t('bot.not_defined'))
      end
    end
  end
end
