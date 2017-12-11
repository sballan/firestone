# TODO: BASE CLASS for mongo-models
require_relative './mpath.rb'

class MObject
	include Mongoid::Document
	has_one :path, class_name: "MPath", as: :data

	def self.create_at_path(path_names, data)
		path = MPath.create_path(path_names)
		self.create(path: path, data: data)
	end
	
end