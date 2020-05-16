require 'csv'
require 'pry'

desc 'Clear and seed the development database'
task :seed => :environment do
  Customer.delete_all
  InvoiceItem.delete_all
  Invoice.delete_all
  Item.delete_all
  Merchant.delete_all
  Transaction.delete_all
  
  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
  
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'customers.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  
  csv.each do |row|
    c = Customer.new
    c.first_name = row['first_name']
    c.last_name = row['last_name']
    c.created_at = row['created_at']
    c.updated_at = row['updated_at']
    c.save
  end
  
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'merchants.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  
  csv.each do |row|
    c = Merchant.new
    c.name = row['name']
    c.created_at = row['created_at']
    c.updated_at = row['updated_at']
    c.save
  end
  
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'invoices.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  
  csv.each do |row|
    c = Invoice.new
    c.customer_id = row['customer_id']
    c.merchant_id = row['merchant_id']
    c.status = row['status']
    c.created_at = row['created_at']
    c.updated_at = row['updated_at']
    c.save
  end
  
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'items.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  
  csv.each do |row|
    c = Item.new
    c.name = row['name']
    c.description = row['description']
    c.unit_price = row['unit_price']
    c.merchant_id = row['merchant_id']
    c.created_at = row['created_at']
    c.updated_at = row['updated_at']
    c.save
  end
  
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'invoice_items.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  
  csv.each do |row|
    c = InvoiceItem.new
    c.item_id = row['item_id']
    c.invoice_id = row['invoice_id']
    c.quantity = row['quantity']
    c.unit_price = row['unit_price']
    c.created_at = row['created_at']
    c.updated_at = row['updated_at']
    c.save
  end
  
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'transactions.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  
  csv.each do |row|
    c = Transaction.new
    c.invoice_id = row['invoice_id']
    c.credit_card_number = row['credit_card_number']
    c.credit_card_expiration_date = row['credit_card_expiration_date']
    c.result = row['result']
    c.created_at = row['created_at']
    c.updated_at = row['updated_at']
    c.save
  end

  puts "There are now #{Customer.count} rows in the customers table"
  puts "There are now #{Merchant.count} rows in the Merchant table"
  puts "There are now #{Invoice.count} rows in the Invoice table"
  puts "There are now #{Item.count} rows in the Item table"
  puts "There are now #{InvoiceItem.count} rows in the InvoiceItem table"
  puts "There are now #{Transaction.count} rows in the Transaction table"
end
