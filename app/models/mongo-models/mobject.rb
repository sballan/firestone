# TODO: BASE CLASS for mongo-models


class MObject
	include Mongoid::Document
	has_one :mpath, as: :data
	
end