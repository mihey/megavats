# frozen_string_literal: true

require_relative "megavats/version"
require_relative "megavats/configuration"
require_relative "megavats/exceptions"
require_relative "megavats/request"
require_relative "megavats/crud"
require_relative "megavats/users"
require_relative "megavats/sims"
require_relative "megavats/groups"
require_relative "megavats/telnums"
require_relative "megavats/blacklist"
require_relative "megavats/makecall"
require_relative "megavats/history"


module Megavats
  extend self
  attr_writer :configuration, :connection
  def configuration
    @configuration ||= Configuration.new
  end

  def connection
    @connection ||= Connection.new
  end

  def configure
    yield configuration
  end

end
