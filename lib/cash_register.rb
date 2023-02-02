
class CashRegister
    attr_accessor :total, :discount, :items
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_price = 0
    end

    def add_item(title, price, quantity = 1 )
        @total += price * quantity
        @last_price = price * quantity
        quantity.times {@items << title }
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            @total -= (@total * (@discount/100.0))
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @total -= @last_price
        @last_price = 0
        if(@items.length == 0)
            @total = 0.0
        end
    end
end