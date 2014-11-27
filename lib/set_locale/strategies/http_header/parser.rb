class SetLocale::Strategies::HttpHeader::Parser
  # Taken directly from iain/http_accept_language:
  # https://github.com/iain/http_accept_language/blob/master/lib/http_accept_language/parser.rb
  def self.parse(header)
    header.to_s.gsub(/\s+/, '').split(',').map do |language|
      locale, quality = language.split(';q=')
      raise ArgumentError, 'Not correctly formatted' unless locale =~ /^[a-z\-0-9]+|\*$/i

      locale  = locale.downcase.gsub(/-[a-z0-9]+$/i, &:upcase) # Uppercase territory
      locale  = nil if locale == '*' # Ignore wildcards

      quality = quality ? quality.to_f : 1.0

      [locale, quality]
    end.sort do |(_, left), (_, right)|
      right <=> left
    end.map(&:first).compact
  rescue ArgumentError # Just rescue anything if the browser messed up badly.
    []
  end
end
