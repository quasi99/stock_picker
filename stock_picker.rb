#stock_picker demo

def stock_picker(array)
  trade = Hash.new(0)
  array.each_with_index do |buy_price, buy_day|
    array.each_with_index do |sell_price, sell_day|
      if sell_day > buy_day && (sell_price > buy_price && sell_price - buy_price > trade[:profit])
        trade = { buy_day: buy_day, sell_day: sell_day, buy_price: buy_price, sell_price: sell_price, profit: sell_price - buy_price }
      end
    end
  end
  puts "For the maximum profit of $#{trade[:profit]}, buy at $#{trade[:buy_price]} on day #{trade[:buy_day] + 1} and sell at $#{trade[:sell_price]} on day #{trade[:sell_day] + 1}."
  trade
end

stock_picker([17,3,6,9,15,8,6,1,10])