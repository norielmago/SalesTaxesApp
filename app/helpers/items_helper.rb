module ItemsHelper

  def compute_tax(item)
    tax = 0
    tax += 10 if item[:taxable]
    tax += 5 if item[:imported]
    tax_item = round_up_to_nearest_5((tax * (item[:price].to_f).round(2))/100)
    item['tax_item'] = tax_item
    item['taxable_price'] = (tax_item + item[:price].to_f).round(2)
    return item
  end

  def round_up_to_nearest_5(float)
    number = float.to_s.split(".")
    whole_number = number[0]
    decimal_decimal = number[1] + (number[1].length < 2 ? '0' : '' )
    decimal_num = 0

    if decimal_decimal[1].to_i == 0
      decimal_num = 0
    elsif decimal_decimal[1].to_i <= 5
      decimal_num = 5
    elsif decimal_decimal[0].to_i == 9
      whole_number += 1
      decimal_decimal[0] = '0'
      decimal_num = 0
    else
      decimal_decimal[0] = (1 + decimal_decimal[0].to_i).to_s
      decimal_num = 0
    end

    tax = whole_number.to_i + ((decimal_decimal[0] + decimal_num.to_s).to_i * 0.01)

    return tax
  end


end
