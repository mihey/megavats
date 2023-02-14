module Megavats
  module Crud
    extend self

    def list
      Megavats::Request.new("/#{current_path}",'Get',true, {}).json
    end

    def show(id)
      Megavats::Request.new("/#{current_path}/#{id}",'Get',true,{}).json
    end

    def create(data)
      Megavats::Request.new("/#{current_path}",'Post',true, data).json
    end

    def update(id, data)
      Megavats::Request.new("/#{current_path}/#{id}",'Put',true, data).json
    end

    def destroy(id)
      Megavats::Request.new("/#{current_path}/#{id}",'Delete',true,{}).json
    end

    private
    def current_path
      #get name of module that run method which is the same as the method in the API
      self.name.split(':').last.downcase
    end

  end
end