class MList
  include Mongoid::Document

  field :data, type: Array, default: []

  def pop
    self.data.pop
    save
  end

  def push(str)
    self.data.push(str)
    save
  end

  def shift
    self.data.shift
    save
  end

  def unshift(str)
    self.data.unshift(str)
    save
  end
end