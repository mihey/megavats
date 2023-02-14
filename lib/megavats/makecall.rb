module Megavats
  module Makecall
    extend self

    def start(user,phone,clid=nil)
      params = {user:user,phone:phone}
      params[:clid] = clid unless clid.nil?
      Megavats::Request.new("/makecall",'Post', true,params).json
    end

  end
end