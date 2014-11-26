require 'set_locale/strategies/parameter'
require 'set_locale/strategies/cookie'

require "set_locale/engine"

module SetLocale

  DEFAULT_STRATEGIES = [:parameter, :cookie]

  mattr_accessor :strategies

  def self.initialize
    ensure_strategies_are_set
    constantize_strategies
  end

private

  def self.ensure_strategies_are_set
    # Fall back to the defeult list of strategies unless
    # specified otherwise, in an initializer
    SetLocale.strategies ||= SetLocale::DEFAULT_STRATEGIES
  end

  def self.constantize_strategies
    @@strategies = SetLocale.strategies.inject([]) do |strategies, strategy|
      strategies << "SetLocale::Strategies::#{strategy.to_s.capitalize}".constantize
    end
  end

end
