require 'rails_helper'

describe "Merchants API" do
  before :each do
    @merchant = create(:merchant)
  end
  
  it "sends a list of merchants" do
    create_list(:merchant, 2)

    get '/api/v1/merchants'

    expect(response).to be_successful
    expect(json[:data].count).to eq(3)
  end
  
  it "sends a single merchant" do
    get "/api/v1/merchants/#{@merchant.id}"
    
    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@merchant.id}")
  end
  
  it "sends a list of all items associated with a merchant" do
    create_list(:item, 3, merchant_id: @merchant.id)

    get "/api/v1/merchants/#{@merchant.id}/items"

    expect(response).to be_successful
    expect(json[:data].count).to eq(3)
  end
  
  it "sends a single merchant in response to a name query" do
    create(:merchant, name: @merchant.name)
    create(:merchant)
    
    name = @merchant.name.upcase.slice(0..2)
    
    get "/api/v1/merchants/find?name=#{name}"

    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@merchant.id}")
  end
  
  it "gives an error message in response to a query that doesn't exist" do
    create(:merchant, name: @merchant.name)
    create(:merchant)
    
    name = "ajpdjf"
    
    get "/api/v1/merchants/find?name=#{name}"

    expect(response).to be_successful
    expect(json).to eq({error: 'No results'})
  end
  
  xit "sends a single merchant in response to a date query" do
    @merchant = create(:merchant)
    create(:merchant, name: @merchant.name)
    create(:merchant)
    
    name = @merchant.name.upcase.slice(0..2)
    
    get "/api/v1/merchants/find?name=#{name}"
    
    expect(response).to be_successful
    expect(json[:data].count).to eq(1)
  end
  
  xit "sends a single merchant in response multiple queries" do
    merchant = create(:merchant)
    create(:merchant, name: merchant.name)
    create(:merchant)
    
    name = merchant.name.upcase.slice(0..2)
    
    get "/api/v1/merchants/find?name=#{name}"
    
    expect(response).to be_successful
    expect(json[:data].count).to eq(1)
  end
end