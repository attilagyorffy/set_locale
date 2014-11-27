module SetLocale
  module Strategies
    class HttpHeader < Base

      def initialize(field_name = 'HTTP_ACCEPT_LANGUAGE')
        @field_name = field_name
      end

      def fetch
        if from_header.presence
          Parser.parse(from_header).map(&:to_sym)
        else
          nil
        end
      end

    private

      def from_header
        field_name = @field_name

        @controller.instance_eval do
          request.headers[field_name]
        end
      end
    end
  end
end

require 'set_locale/strategies/http_header/parser'
