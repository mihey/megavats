module Megavats
  module History
    AVAILABLE_PARAMS = [:start,:end,:period,:type,:limit]

    extend self


    def outer(params={})
      Megavats::Request.new("/history/json#{params_string(params)}",'Get', true, {}).json
    end

    def inner(params={})
      Megavats::Request.new("/history/inner/json#{params_string(params)}",'Get', true, {}).json
    end

    def params_string(params)
      arr = []
      params.keys.each do |key|
        arr << "#{key}=#{params[key]}" if Megavats::History::AVAILABLE_PARAMS.include?(key)
      end
      arr.size > 0 ? "?#{arr.join('&')}" : ''
    end

  end
end