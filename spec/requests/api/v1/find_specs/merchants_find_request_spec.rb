require 'rails_helper'

describe "Merchants Find API" do
  before :each do
    @merchant = create(:merchant)
    create(:merchant, name: @merchant.name)
    create(:merchant)
  end
  
  it "sends a single merchant in response to a name query" do
    name = @merchant.name.upcase.slice(0..2)
    
    get "/api/v1/merchants/find?name=#{name}"

    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@merchant.id}")
  end

  it "sends a single merchant in response to a date query" do
    date = @merchant.created_at.to_s(format = :default).split(" ").first
    
    get "/api/v1/merchants/find?created_at=#{date}"
    
    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@merchant.id}")
  end

  it "sends a single merchant in response to multiple queries" do
    name = @merchant.name.upcase.slice(0..2)
    date = @merchant.created_at.to_s(format = :default).split(" ").first
    
    get "/api/v1/merchants/find?name=#{name}&created_at=#{date}"
    
    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@merchant.id}")
  end

  it "gives an error message in response to a query that doesn't exist" do
    name = "ajpdjf"
    
    get "/api/v1/merchants/find?name=#{name}"

    expect(response).to be_successful
    expect(json).to eq({error: 'No results'})
  end
end