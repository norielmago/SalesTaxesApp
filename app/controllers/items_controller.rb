class ItemsController < ApplicationController
  layout 'application'
  include ItemsHelper

  def index
    @items = []

  end

  def generate_input
    records = Item.generate_input(params[:input_type])
    render json: records.as_json
  end

  def purchase_generate_receipt
    records = []
    for id in params[:input_ids]
      items = Item.generate_input(id)
      for i in items
        records.push(i)
      end
    end

    # get tax for each items
    @records_with_tax = []
    records.each do |item|
      @records_with_tax.push(compute_tax(item))
    end

    item = Item.new(@records_with_tax)

    result = item.get_total_tax_price

    render json: {item_list: records, total_price: result['total_price'].round(2), total_tax: result['total_tax'].round(2)}
  end


end
