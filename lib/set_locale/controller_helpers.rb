module SetLocale
  module ControllerHelpers

    def self.included(controller)
      controller.before_action :set_locale
    end

    def set_locale
      I18n.locale = SetLocale.from_strategies(self) || I18n.default_locale
    end
  end
end
