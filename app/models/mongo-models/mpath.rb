class MPath < MHash

  has_one :mpath, as: :parent
  field :name, type: String, default: ""
  field :is_root, type: Boolean, default: false

  def full_path
    name + parent.full_path
  end

  def add_child(str)
    child = MPath.create({name: str})
    self.set(str, child)
  end

  def self.create_path(root, path)

  end


end



