class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :unit_price, :merchant_id
  
  belongs_to :merchant
  
  attribute :data do |object|
    {"id": "#{object.id}",
    "type": "#{object.class}",
    "attributes": {
      "name": "#{object.name}",
      "description": "#{object.description}",
      "unit_price": "#{object.unit_price}",
      "merchant_id": "#{object.merchant_id}"
      }
    }
  end
end
