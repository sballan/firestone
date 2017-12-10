class MHash
  include Mongoid::Document

  field :data, type: Hash

  def get(key)
    data[key]
  end

  def set(key, value)
    data[key] = value
    save
  end

  def delete(key)
    data.delete(key)
    save
  end
end