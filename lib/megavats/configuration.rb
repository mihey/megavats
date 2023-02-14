module Megavats
  class Configuration
    attr_writer :domain, :api_key
    def initialize
      @domain = nil
      @api_key = nil
    end

    def domain
      raise ConfigurationError, "VATS domain missing!" unless @domain
      @domain
    end

    def api_key
      raise ConfigurationError, "VATS API key missing!" unless @api_key
      @api_key
    end

  end
end
