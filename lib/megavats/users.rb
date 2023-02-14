require_relative "crud"

module Megavats
  module Users
    extend Megavats::Crud
    extend self

    def groups(login)
      Megavats::Request.new("/users/#{login}/groups",'Get', true, {}).json
    end

    def group_subscription_status(login,group_id)
      Megavats::Request.new("/users/#{login}/subscription?group_id=#{group_id}",'Get', true,{}).json
    end

    def group_subscription_on(login,group_id)
      Megavats::Request.new("/users/#{login}/subscription?group_id=#{group_id}",'Post', true,{}).json
    end

    def group_subscription_off(login,group_id)
      Megavats::Request.new("/users/#{login}/subscription?group_id=#{group_id}",'Delete', true,{}).json
    end

    def group_subscription_all_on(login)
      Megavats::Request.new("/users/#{login}/subscription",'Post', true,{}).json
    end

    def group_subscription_all_off(login)
      Megavats::Request.new("/users/#{login}/subscription",'Delete', true,{}).json
    end

    def dnd_status(login)
      Megavats::Request.new("/users/#{login}/dnd",'Get', true,{}).json
    end

    def dnd_on(login)
      Megavats::Request.new("/users/#{login}/dnd",'Post', true,{}).json
    end

    def dnd_off(login)
      Megavats::Request.new("/users/#{login}/dnd",'Delete', true,{}).json
    end

  end
end