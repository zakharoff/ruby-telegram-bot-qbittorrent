# frozen_string_literal: true

require 'byebug' # fixes?
require 'dotenv'

Dotenv.load('.env', ".env.#{ENV['APP_ENV']}") if File.exist?('./../.env')
# Dotenv.load('.env', ".env.#{ENV['APP_ENV']}")

require_relative 'i18n'
require_relative '../lib/app'
require_relative 'settings'

App.loader.setup
