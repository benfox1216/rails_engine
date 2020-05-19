class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
  
  has_many :items
  
  attribute :data do |object|
    {"id": "#{object.id}",
    "type": "#{object.class}",
    "attributes": {
      "name": "#{object.name}"
      }
    }
  end
end
