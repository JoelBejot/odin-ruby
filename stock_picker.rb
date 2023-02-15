def stock_picker(array)
  sorted_array = array.sort

  #sell price sorted_array[-1] unless that is array[0], then go to sorted_array[-2]
  sorted_array[-1] != array[0] ? sell_price = sorted_array[-1] : sell_price = sorted_array[-2]
  sell_index = array.index(sell_price)

  #buy price is min number of index smaller than sell index
  #discard numbers ff sell index
  short_array = array[0..sell_index]
  buy_price = short_array.min
  buy_index = array.index(buy_price)

  return "#{[buy_index, sell_index]} for a profit of $#{sell_price} - $#{buy_price} == $#{sell_price - buy_price}"
end

prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
p stock_picker(prices)
#Idk if this works with all edge cases, but it works with the given array.
