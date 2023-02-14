module Megavats
  module Blacklist
    extend self

    def telnums
      Megavats::Request.new("/blacklist/telnums",'Get', true,{}).json
    end

    def add
      Megavats::Request.new("/blacklist/telnums",'Post', true,{}).json
    end

    def delete(telnums=[])
      params = telnums.map {|t| "telnum=#{t}"}.join('&')
      Megavats::Request.new("/blacklist/telnums?#{params}",'Delete', true,{}).json
    end

    def block_anonymous_status
      Megavats::Request.new("/blacklist/block-anonymous",'Get', true,{}).json
    end

    def block_anonymous_enable
      Megavats::Request.new("/blacklist/block-anonymous",'Post', true,{}).json
    end

    def block_anonymous_disable
      Megavats::Request.new("/blacklist/block-anonymous",'Delete', true,{}).json
    end

  end
end