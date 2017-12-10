class MList < MObject
  include Mongoid::Document

  field :data, type: Array, default: []

  def pop(fetch=true)
		item = self.data.pop

		if item.instance_of? BSON::ObjectId && fetch
			item = MObject.find item 
		end

		save
		item
  end

	def push(str)
		str = str.id if str.instance_of? BSON::ObjectId
    self.data.push(str)
    save
  end

  def shift(fetch=true)
		item = self.data.shift

		if item.instance_of? BSON::ObjectId && fetch
			item = MObject.find item 
		end
		
		save
		item
  end

	def unshift(str)
		str = str.id if str.instance_of? BSON::ObjectId
    self.data.unshift(str)
    save
	end
	
	def at(index, fetch=true)
		item = self.data[index]

		if item.instance_of? BSON::ObjectId && fetch
			item = MObject.find item 
		end

		item
	end
end