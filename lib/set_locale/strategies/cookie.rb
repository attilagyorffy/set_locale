module SetLocale
  module Strategies
    class Cookie < Base

      def initialize(cookie_name = 'locale')
        @cookie_name = cookie_name
      end

      def fetch
        from_cookie.presence ? from_cookie.to_sym : nil
      end

    private

      def from_cookie
        cookie_name = @cookie_name.to_sym

        @controller.instance_eval do
          cookies[cookie_name]
        end
      end
    end
  end
end
