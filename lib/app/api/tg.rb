# frozen_string_literal: true

require 'telegram/bot'

module App
  module Api
    class Tg
      class << self
        def run
          loop do
            Telegram::Bot::Client.run(Settings.telegram_token) do |bot|
              bot.listen do |response|
                next if user_allow?(response.from)

                Thread.start(response) do |message|
                  yield bot, message
                rescue StandardError => e
                  puts 'RESCUE IN TELEGRAM BOT'
                  puts e.message
                end
              end
            end
          rescue StandardError => e
            puts 'RESCUE IN APP'
            puts e.message
          end
        end

        private

        def user_allow?(user)
          return false if user.is_bot
          return true if Settings.telegram_allow_users.empty?

          Settings.telegram_allow_users.split(',').include?(user.id)
        end
      end
    end
  end
end
