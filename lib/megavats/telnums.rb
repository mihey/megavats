require_relative "crud"

module Megavats
  module Telnums
    extend Megavats::Crud
    extend self

    def create;end

    def destroy;end

    def disable(telnum)
      Megavats::Request.new("/telnums/#{telnum}/enabled",'Delete', true,{}).json
    end

    def enable(telnum)
      Megavats::Request.new("/telnums/#{telnum}/enabled",'Post', true,{}).json
    end

  end
end