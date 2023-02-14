module Megavats
  module History
    extend self

    def outer(params={})
      Megavats::Request.new("/history/json",'Get', true, params).json
    end

    def inner(params={})
      Megavats::Request.new("/history/inner/json",'Get', true, params).json
    end

  end
end