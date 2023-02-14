module Megavats
  class Error < StandardError; end

  class APIError < Error; end
  class ConfigurationError < Error; end

  class MegavatsRequestError < APIError; end

end