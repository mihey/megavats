require_relative "crud"

module Megavats
  module Sims
    extend Megavats::Crud
    extend self

    def update;end #sim can't update

    def connect_to_user(telnum,login)
      Megavats::Request.new("/sims/#{telnum}/user/#{login}",'Post', true,{}).json
    end

    def to_company(telnum)
      Megavats::Request.new("/sims/#{telnum}/company",'Post', true,{}).json
    end

    def disable(telnum)
      Megavats::Request.new("/sims/#{telnum}/disable",'Post', true,{}).json
    end

  end
end