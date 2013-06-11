require 'eventmachine'
require 'base64'
require File.expand_path('em-connectify/connectify.rb', File.dirname(__FILE__))
require File.expand_path('em-connectify/connect.rb', File.dirname(__FILE__))
require File.expand_path('em-connectify/errors.rb', File.dirname(__FILE__))

unless Base64.respond_to?(:strict_encode64)
  # Backport from ruby-1.9 to ruby-1.8 (which doesn't support pack('m0') either)
  def Base64.strict_encode64(str)
    Base64.encode64(str).gsub("\n", "")
  end
end
