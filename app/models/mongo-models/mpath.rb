class MPath
	belong_to :parent, class_name: "MPath", inverse_of: :children, validate: false
	has_many :children, class_name: "MPath", inverse_of: :parent, validate: false

  field :name, type: String, validate: true
	field :is_root, type: Boolean, default: false
	
	# Belongs to an MObject
	belongs_to: :data, polymorphic: true

	before_create do
		if self.is_root
			raise if MPath.where(name: self.name, is_root: true).size > 0
		end
	end



	# def self.root_with_name(name)
	# 	root = MPath.where(is_root: true, name: name)
	# 	if root.size == 0
	# 		# create! to raise error if there are validation errors
	# 		root = MPath.create!(is_root: true, name: name)
	# 	elsif root.size == 1
	# 		root = root.first
	# 	else
	# 		raise "Can't have two roots!"
	# 	end
	# 	root
	# end

	# def self.child_with_name(parent, child_name)
	# 	child = MPath.where(parent: parent, name: child_name)
	# 	if child.size == 0
	# 		child = MPath.create!(parent: parent, name: child_name)
	# 	elsif child.size = 1
	# 		child = child.first
	# 	else
	# 		raise "Can't have two children with the same name!"
	# 	end
	# end

	def self.create_path(path_names)
		root_name = path_names.shift
		current = self.first_or_create(is_root: true, name: root_name)

		path_names.each do |p|
			current = self.first_or_create(parent: current, name: p)
		end
	end

	

end

