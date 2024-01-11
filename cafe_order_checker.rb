def first_come_first_served?(take_out_orders, dine_in_orders, served_orders)
  # Check if we're serving orders first-come, first-served
  index_take_out = 0
  index_dine_in = 0
  max_index_take_out = take_out_orders.length - 1
  max_index_dine_in = dine_in_orders.length - 1

  served_orders.each do |order|
    # if we still have orders in take_out_orders
    # and the current order in take_out_orders is the same
    # as the current order in served_orders
    if index_take_out <= max_index_take_out && order == take_out_orders[index_take_out]
      index_take_out += 1
      # if we still have orders in dine_in_orders
      # and the current order in dine_in_orders is the same
      # # as the current order in served_orders
    elsif index_dine_in <= max_index_dine_in && order == dine_in_orders[index_dine_in]
      index_dine_in += 1
    else
      return false
    end
  end

  # check for any extra orders at the end of take_out_orders or dine_in_orders
  return false if index_take_out < take_out_orders.length || index_dine_in < dine_in_orders.length
  true
end

# Tests

def run_tests
  desc = 'both registers have same number of orders'
  result = first_come_first_served?([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6])
  assert_true(result, desc)

  desc = 'registers have different lengths'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 2, 6, 3, 5])
  assert_false(result, desc)

  desc = 'one register is empty'
  result = first_come_first_served?([], [2, 3, 6], [2, 3, 6])
  assert_true(result, desc)

  desc = 'served orders is missing orders'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 6, 3, 5])
  assert_false(result, desc)

  desc = 'served orders has extra orders'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8])
  assert_false(result, desc)

  desc = 'one register has extra orders';
  result = first_come_first_served?([1, 9], [7, 8], [1, 7, 8]);
  assert_false(result, desc)

  desc = 'one register has unserved orders';
  result = first_come_first_served?([55, 9], [7, 8], [1, 7, 8, 9]);
  assert_false(result, desc)

  desc = 'order numbers are not sequential'
  result = first_come_first_served?([27, 12, 18], [55, 31, 8], [55, 31, 8, 27, 12, 18])
  assert_true(result, desc)

end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
