module SetLocale
  module Strategies
    class Base
      attr_writer :controller

      def valid_locale
        potential_locales.detect { |locale| I18n.available_locales.include? locale }
      end

    private

      def fetch
        raise NotImplementedError.new "#{self.class}#fetch needs implementation."
      end

      # Always return potential locale matches
      # from strategies in an an array
      def potential_locales
        fetch.kind_of?(Array) ? fetch : [fetch]
      end
    end
  end
end
