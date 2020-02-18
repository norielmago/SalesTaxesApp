class Item

  def initialize(t)
    @records_with_tax = t
  end

  def self.generate_input(input)
    data = []
    if input.to_i == 1
      data = [
        {
            name: 'Book',
            price: 12.49,
            taxable: false,
            imported: false,
            quantity: 1
        },
        {
            name: 'Music CD',
            price: 14.99,
            taxable: true,
            imported: false,
            quantity: 1
        },
        {
            name: 'Chocolate Bar',
            price: 0.85,
            taxable: false,
            imported: false,
            quantity: 1
        }
      ]
    elsif input.to_i == 2
      data =[
        {
            name: 'Imported Box of Chocolates',
            price: 10.00,
            taxable: false,
            imported: true,
            quantity: 1
        },
        {
            name: 'Imported Bottle of Perfume',
            price: 47.50,
            taxable: true,
            imported: true,
            quantity: 1
        }
      ]
    elsif input.to_i == 3
      data = [
        {
            name: 'Imported Bottle of Perfume',
            price: 27.99,
            taxable: true,
            imported: true,
            quantity: 1
        },
        {
            name: 'Bottle of Perfume',
            price: 18.99,
            taxable: true,
            imported: false,
            quantity: 1
        },
        {
            name: 'Packet of Headache Pills',
            price: 9.75,
            taxable: false,
            imported: false,
            quantity: 1
        },
        {
            name: 'Box of Imported Chocolates',
            price: 11.25,
            taxable: false,
            imported: true,
            quantity: 1
        }
      ]
    end

    return data
  end

  def get_total_tax_price
    items = @records_with_tax
    json = {}

    price_total = 0
    tax_total = 0

    for i in items
      price_total += i[:price]
      tax_total += i['tax_item']
    end
    json['total_tax'] = tax_total
    json['total_price'] = price_total + tax_total

    return json
  end

end
