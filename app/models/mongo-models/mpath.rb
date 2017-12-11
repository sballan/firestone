class MPath
	include Mongoid::Document
	
	belongs_to :parent, class_name: "MPath", inverse_of: :children, optional: true
	has_many :children, class_name: "MPath", inverse_of: :parent, validate: false

  field :name, type: String
	field :is_root, type: Boolean, default: false
	
	# Belongs to an MObject
	belongs_to :data, polymorphic: true, optional: true

	before_create do
		if self.is_root
			raise "Duplicate root" if MPath.where(name: self.name, is_root: true).size > 0
		else
			raise "Must have a parent if not root" if self.parent.nil?
		end
	end

	

	def self.create_path(path_names)
		root_name = path_names.shift
		current = self.find_or_create_by(is_root: true, name: root_name)

		path_names.each do |p|
			current = self.find_or_create_by(parent: current, name: p)
		end
		current
	end

	

end

