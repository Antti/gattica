module Gattica
  module HashExtensions

    def to_query
      require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
      self.map do |key, value|
        "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
      end.sort * '&'
    end

  end
end