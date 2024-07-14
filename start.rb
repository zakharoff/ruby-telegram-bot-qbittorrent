# frozen_string_literal: true

require_relative './config/boot'

App::Api::Tg.run do |bot, message|
  case message
  when Telegram::Bot::Types::CallbackQuery
    puts 'callback'
  when Telegram::Bot::Types::Message
    App::Controllers::Message.new(bot, message).call
  end
end
