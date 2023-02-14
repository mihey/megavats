require 'net/http'
require 'json'

module Megavats
  class Request
    SUCCESS_STATUS_CODES = ['200', '204'].freeze
    attr_accessor :path, :action, :params, :url, :json
    def initialize(path,action,run,params={})
      @domain = Megavats.configuration.domain
      @api_key = Megavats.configuration.api_key
      self.path = path
      self.action = action
      self.params = params
      self.url = build_url(path)
      if run
        self.json = fetch
      else
        self.json = {}
      end

    end

    def fetch
      uri = URI(url)
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |https|
        req = Net::HTTP.const_get(action).new(url)
        req["Content-Type"] = "application/json"
        req["X-API-KEY"] = @api_key
        req.body = params.to_json

        handle_response(https.request(req))
      end
    end

    def handle_response(response)
      if SUCCESS_STATUS_CODES.include?(response.code)
        if response.code == '200'
          JSON.parse(response.body)
        else
          {}
        end
      else
        raise MegavatsRequestError, response.body
      end
    end

    def build_url(path)
      "https://#{@domain}.megapbx.ru/crmapi/v1#{path}"
    end
  end
end
