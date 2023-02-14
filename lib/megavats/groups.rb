require_relative "crud"

module Megavats
  module Groups
    extend Megavats::Crud
    extend self

    def users(group_id)
      Megavats::Request.new("/groups/#{group_id}/users",'Post', true,{}).json
    end
  end

end