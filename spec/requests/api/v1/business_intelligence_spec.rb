require 'rails_helper'

describe "Business Intelligence" do
  before :each do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_3 = create(:merchant)
    
    customer = create(:customer)
    
    invoice_1 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id)
    invoice_2 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id)
    invoice_3 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id)
    invoice_4 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id)
    invoice_5 = create(:invoice, merchant_id: merchant_3.id, customer_id: customer.id)
    invoice_6 = create(:invoice, merchant_id: merchant_3.id, customer_id: customer.id)
    
    item_1 = create(:item, merchant_id: merchant_1.id)
    item_2 = create(:item, merchant_id: merchant_1.id)
    item_3 = create(:item, merchant_id: merchant_1.id)
    item_4 = create(:item, merchant_id: merchant_1.id)
    
    item_5 = create(:item, merchant_id: merchant_2.id)
    item_6 = create(:item, merchant_id: merchant_2.id)
    item_7 = create(:item, merchant_id: merchant_2.id)
    item_8 = create(:item, merchant_id: merchant_2.id)
    
    item_9 = create(:item, merchant_id: merchant_3.id)
    item_10 = create(:item, merchant_id: merchant_3.id)
    item_11= create(:item, merchant_id: merchant_3.id)
    item_12 = create(:item, merchant_id: merchant_3.id)
    
    create(:invoice_item, invoice_id: invoice_1.id, item_id: item_1.id)
    create(:invoice_item, invoice_id: invoice_1.id, item_id: item_2.id)
    create(:invoice_item, invoice_id: invoice_2.id, item_id: item_3.id)
    create(:invoice_item, invoice_id: invoice_2.id, item_id: item_4.id)
    
    create(:invoice_item, invoice_id: invoice_3.id, item_id: item_5.id)
    create(:invoice_item, invoice_id: invoice_3.id, item_id: item_6.id)
    create(:invoice_item, invoice_id: invoice_4.id, item_id: item_7.id)
    create(:invoice_item, invoice_id: invoice_4.id, item_id: item_8.id)
    
    create(:invoice_item, invoice_id: invoice_5.id, item_id: item_9.id)
    create(:invoice_item, invoice_id: invoice_5.id, item_id: item_10.id)
    create(:invoice_item, invoice_id: invoice_6.id, item_id: item_11.id)
    create(:invoice_item, invoice_id: invoice_6.id, item_id: item_12.id)
    
    create(:transaction, invoice_id: invoice_1.id)
    create(:transaction, invoice_id: invoice_2.id)
    create(:transaction, invoice_id: invoice_3.id)
    create(:transaction, invoice_id: invoice_4.id)
    create(:transaction, invoice_id: invoice_5.id)
    create(:transaction, invoice_id: invoice_6.id)
  end
  
  it "returns merchants with most revenue" do
    get '/api/v1/merchants/most_revenue?quantity=2'
    
    expect(response).to be_successful
    expect(json[:data].count).to eq(2)
  end
  
  it "returns merchants with most items sold" do
    get '/api/v1/merchants/most_items?quantity=2'
    
    expect(response).to be_successful
    expect(json[:data].count).to eq(2)
  end
end