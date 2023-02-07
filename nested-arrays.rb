def blank_seating_chart(number_of_rows, seats_per_row)
  # return a 2d array to represent a seating chart that contains
  # number_of_rows nested arrays, each with seats_per_row entries of nil to
  # represent that each seat is empty.

  # Example: blank_seating_chart(2, 3) should return:
  # [
  #   [nil, nil, nil],
  #   [nil, nil, nil]
  # ]

  # NOTE: if one of the nested arrays is changed, the others should **not**
  # change with it
    Array.new(number_of_rows) {Array.new(seats_per_row)}
end
p "blank_seating_chart: " + blank_seating_chart(2,3).to_s

def add_seat_to_row(chart, row_index, seat_to_add)
  # take a chart (2d array)  and add seat_to_add to the end of the row that is
  # at row_index index of the chart, then return the chart
    
    seat_to_add.times { chart[row_index].push(nil) }
    chart 
end
p "add_seat_to_row: " + add_seat_to_row(blank_seating_chart(2,2), 0, 2).to_s

def add_another_row(chart, row_to_add)
  # take a chart and add row_to_add to the end of the chart,
  # then return the chart.
    chart.push(row_to_add)
    chart
end

p "add_another_row: " + add_another_row(blank_seating_chart(2, 2), [nil, nil, nil, nil]).to_s

def delete_seat_from_row(chart, row_index, seat_index)
  # take a chart and delete the seat at seat_index of the row at row_index of
  # the chart, then return the chart

  # Hint: explore the ruby docs to find a method for deleting from an array!
    chart[row_index].delete_at(seat_index)
    chart
end

p "delete_seat_from_row: " + delete_seat_from_row(blank_seating_chart(3, 3), 0, 0).to_s

def delete_row_from_chart(chart, row_index)
  # take a chart and delete the row at row_index of the chart,
  # then return the chart
    chart.delete_at(row_index)
    chart
end

p "delete_row_from_chart: " + delete_row_from_chart(blank_seating_chart(3,3), 0).to_s

def count_empty_seats(chart)
  # take a chart and return the number of empty (nil) seats in it

  # NOTE: `chart` should **not** be mutated
  flat_chart = chart.flatten
  flat_chart.count { |el| el == nil }
end

p "count_empty_seats: " + count_empty_seats(blank_seating_chart(3,3)).to_s

def find_favorite(array_of_hash_objects)
  # take an array_of_hash_objects and return the hash which has the key/value
  # pair :is_my_favorite? => true. If no hash returns the value true to the key
  # :is_my_favorite? it should return nil

  # array_of_hash_objects will look something like this:
  # [
  #   { name: 'Ruby', is_my_favorite?: true },
  #   { name: 'JavaScript', is_my_favorite?: false },
  #   { name: 'HTML', is_my_favorite?: false }
  # ]

  # TIP: there will only be a maximum of one hash in the array that will
  # return true to the :is_my_favorite? key
  array_of_hash_objects.each do |object|
    object.each_pair do
      |key, value|
      return "key: #{key}, value: #{value}" if value == true
    end
  end
  return nil 
  
  end

  array_of_hashes = [
    { name: 'Ruby', is_my_favorite?: true },
    { name: 'JavaScript', is_my_favorite?: false },
    { name: 'HTML', is_my_favorite?: false }
  ]
p find_favorite(array_of_hashes)