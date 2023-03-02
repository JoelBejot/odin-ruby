def merge_sort(array)
  if array.length < 2
    return array
  else
    mid = array.length / 2
    left_array = array[0...mid]
    right_array = array[mid..-1]
    merge_sort(left_array)
    merge_sort(right_array)
    merge(left_array, right_array)
  end
end

def merge(left_array, right_array)
  sorted_array = []
  unless left_array.empty? && right_array.empty? do
    if left_array[0] < right_array[0]
      sorted_array << left_array.shift
    else
      sorted_array << right_array.shift
    end
    p sorted_array
  end
  return sorted_array.concat(left_array).concat(right_array)
end

unsorted_array = [10,3,6,2,8,9,6,123,71,5]
p merge_sort(unsorted_array)
