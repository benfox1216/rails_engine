require 'rails_helper'

describe "Items Find API" do
  before :each do
    merchant = create(:merchant)
    @item = create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
  end
  
  it "sends a single item in response to a name query" do
    name = @item.name.upcase.slice(0..2)
    
    get "/api/v1/items/find?name=#{name}"

    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@item.id}")
  end

  it "sends a single item in response to a date query" do
    date = @item.created_at.to_s(format = :default).split(" ").first
    
    get "/api/v1/items/find?created_at=#{date}"
    
    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@item.id}")
  end

  it "sends a single item in response to multiple queries" do
    name = @item.name.upcase.slice(0..2)
    date = @item.created_at.to_s(format = :default).split(" ").first
    
    get "/api/v1/items/find?name=#{name}&created_at=#{date}"
    
    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@item.id}")
  end

  it "gives an error message in response to a query that doesn't exist" do
    name = "ajpdjf"
    
    get "/api/v1/items/find?name=#{name}"

    expect(response).to be_successful
    expect(json).to eq({error: 'No results'})
  end
end