require 'rails_helper'
require "#{Rails.root}/app/models/item.rb"
include ItemsHelper

#convert Item model to Class since there's no database and table
RSpec.describe Item, type: :class do

  def generate_items(input_type)
    records = Item.generate_input(input_type)

    computed_record = []
    records.each do |item|
      computed_record.push(compute_tax(item))
    end
     i = Item.new(computed_record)
    return i
  end

  context "validating output for input 1: " do
    it "total tax output should be 1.50" do
      input_id = 1
      result = generate_items(input_id).get_total_tax_price['total_tax'].round(2)
      expect(result).to eq(1.50)
    end

    it "total price output should 29.83" do
      input_id = 1
      result = generate_items(input_id).get_total_tax_price['total_price'].round(2)
      expect(result).to eq(29.83)
    end
  end

  context "validating output for input 2: " do
    it "total tax output should be 7.65" do
      input_id = 2
      result = generate_items(input_id).get_total_tax_price['total_tax'].round(2)
      expect(result).to eq(7.65)
    end

    it "total price output should be 65.15 " do
      input_id = 2
      result = generate_items(input_id).get_total_tax_price['total_price'].round(2)
      expect(result).to eq(65.15)
    end
  end

  context "validating output for input 3: " do
    it "total tax output should be 6.70" do
      input_id = 3
      result = generate_items(input_id).get_total_tax_price['total_tax'].round(2)
      expect(result).to eq(6.70)
    end

    it "total price output should be 74.68" do
      input_id = 3
      result = generate_items(input_id).get_total_tax_price['total_price'].round(2)
      expect(result).to eq(74.68)
    end
  end

end
