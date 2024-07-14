# frozen_string_literal: true

require 'i18n'
require 'i18n/backend/fallbacks'

I18n.load_path += Dir[File.expand_path('locales/*.yml', __dir__)]
I18n.backend.load_translations
