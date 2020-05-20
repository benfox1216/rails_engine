class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
  
  has_many :items
  
  attribute :merchant_description do |object|
    {"id": "#{object.id}",
    "type": "#{object.class}",
    "attributes": {
      "name": "#{object.name}"
      }
    }
  end
end
