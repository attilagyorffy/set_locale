module SetLocale
  module Strategies
    class Parameter < Base
      def fetch
        param.presence ? param.to_sym : nil
      end

    private

      def param
        @controller.instance_eval do
          params[:locale]
        end
      end
    end
  end
end
