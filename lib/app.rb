# frozen_string_literal: true

require 'zeitwerk'

module App
  class << self
    def loader
      @loader = Zeitwerk::Loader.for_gem
    end
  end
end
