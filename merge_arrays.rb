def merge_arrays(my_array, alices_array)
  # Combine the sorted arrays into one large sorted array.
  merged_array_size = my_array.length + alices_array.length
  merged_array = Array.new(merged_array_size)

  my_array_current_index = 0
  alices_array_current_index = 0
  merged_array_current_index = 0

  while merged_array_current_index < merged_array_size
    is_my_array_exhausted = my_array_current_index >= my_array.length
    is_alices_array_exhausted = alices_array_current_index >= alices_array.length
    if !is_my_array_exhausted &&
      (is_alices_array_exhausted ||
      (my_array[my_array_current_index] < alices_array[alices_array_current_index]))
      merged_array[merged_array_current_index] = my_array[my_array_current_index]
      my_array_current_index += 1
    else
      merged_array[merged_array_current_index] = alices_array[alices_array_current_index]
      alices_array_current_index += 1
    end
  merged_array_current_index += 1
  end
  merged_array
end




# Tests

def run_tests
  desc = 'both arrays are empty'
  actual = merge_arrays([], [])
  expected = []
  assert_equal(actual, expected, desc)

  desc = 'first array is empty'
  actual = merge_arrays([], [1, 2, 3])
  expected = [1, 2, 3]
  assert_equal(actual, expected, desc)

  desc = 'second array is empty'
  actual = merge_arrays([5, 6, 7], [])
  expected = [5, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'both arrays have some numbers'
  actual = merge_arrays([2, 4, 6], [1, 3, 7])
  expected = [1, 2, 3, 4, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'arrays are different lengths'
  actual = merge_arrays([2, 4, 6, 8], [1, 7])
  expected = [1, 2, 4, 6, 7, 8]
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
