require "rails_helper"

describe "Relationships API" do
  before :each do
    @merchant = create(:merchant)
  end
  
  it "sends a single item's merchant" do
    item = create(:item, merchant_id: @merchant.id)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{@merchant.id}")
  end

  it "sends a list of all items associated with a merchant" do
    create_list(:item, 3, merchant_id: @merchant.id)

    get "/api/v1/merchants/#{@merchant.id}/items"

    expect(response).to be_successful
    expect(json[:data].count).to eq(3)
  end
end