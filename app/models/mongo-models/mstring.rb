class MString < MObject
  include Mongoid::Document

  field :data, type: String

end

