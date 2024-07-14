# frozen_string_literal: true

require 'dry-configurable'

module App
  class Settings
    extend Dry::Configurable

    setting :telegram_token, default: ENV.fetch('TELEGRAM_TOKEN'), reader: true
    setting :telegram_allow_users, default: ENV.fetch('TELEGRAM_ALLOW_USERS'), reader: true
    setting :qb_server, default: ENV.fetch('QB_SERVER'), reader: true
    setting :qb_username, default: ENV.fetch('QB_USERNAME'), reader: true
    setting :qb_password, default: ENV.fetch('QB_PASSWORD'), reader: true
  end
end
