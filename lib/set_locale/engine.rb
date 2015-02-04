require "set_locale/controller_helpers"

module SetLocale
  class Engine < ::Rails::Engine
    config.after_initialize do |app|
      SetLocale.initialize

      ApplicationController.send :include, SetLocale::ControllerHelpers

      # Make sure SetLocale::ContollerHelpers gets included in ApplicationController
      # in case Rails would auto-reload ApplicationController during a request in development
      ActionDispatch::Reloader.to_prepare do
        ApplicationController.send :include, SetLocale::ControllerHelpers
      end
    end
  end
end
