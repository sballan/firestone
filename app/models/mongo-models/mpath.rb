class MPath

	belong_to :parent, class_name: "MPath", inverse_of: :children
	has_many :children, class_name: "MPath", inverse_of: :parent

  field :name, type: String
	field :is_root, type: Boolean, default: false
	
	belongs_to: :data, polymorphic: true

  def self.create_path(root, path)

  end


end



