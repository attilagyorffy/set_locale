require 'set_locale/strategies/base'
require 'set_locale/strategies/parameter'
require 'set_locale/strategies/cookie'
require 'set_locale/strategies/http_header'
require 'set_locale/strategies/user_preference'

require "set_locale/engine"

module SetLocale

  mattr_accessor :strategies

  def self.initialize
    # Fall back to the default list of strategies unless
    # specified otherwise, in an initializer
    SetLocale.strategies ||= default_strategies
  end

  # Find and return the first valid locale
  def self.from_strategies(controller)
    strategies.each do |strategy|
      strategy.controller = controller
      return strategy.valid_locale if strategy.valid_locale
    end

    nil
  end

  def self.default_strategies
    [
      Strategies::Parameter.new,
      Strategies::Cookie.new
    ]
  end
end
