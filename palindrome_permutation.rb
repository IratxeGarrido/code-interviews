# My solution
def has_palindrome_permutation?(the_string)

  # Check if any permutation of the input is a palindrome.
  string_length = the_string.length
  odd_char = 0
  the_string.each_char do |element|
    if the_string.count(element) % 2 != 0 && string_length.even?
      return false
    elsif the_string.count(element) % 2 != 0 && string_length.odd? && odd_char == 0
      odd_char += 1
    elsif the_string.count(element) % 2 != 0 && string_length.odd? && odd_char == 1
      return false
    end
  end
  true
end

# def palindrome?(permutation)
#   last_element_index = permutation.length - 1
#   middle_element_index = permutation.length / 2
#   for index in 0..middle_element_index
#     return false if permutation[index] != permutation[last_element_index]

#     index += 1
#     last_element_index -= 1
#   end
#   true
# end

# Their solution
# require 'set'

# def has_palindrome_permutation?(the_string)

#   # Track characters we've seen an odd number of times.
#   unpaired_characters = Set.new

#   (0...the_string.length).each do |i|
#     char = the_string[i]

#     if unpaired_characters.include? char
#       unpaired_characters.delete(char)
#     else
#       unpaired_characters.add(char)
#     end
#   end

#   # The string has a palindrome permutation if it
#   # has one or zero characters without a pair.
#   unpaired_characters.length <= 1
# end

















# Tests

def run_tests
  desc = 'permutation with odd number of chars'
  result = has_palindrome_permutation?('aabcbcd')
  assert_true(result, desc)

  desc = 'permutation with even number of chars'
  result = has_palindrome_permutation?('aabccbdd')
  assert_true(result, desc)

  desc = 'no permutation with odd number of chars'
  result = has_palindrome_permutation?('aabcd')
  assert_false(result, desc)

  desc = 'no permutation with even number of chars'
  result = has_palindrome_permutation?('aabbcd')
  assert_false(result, desc)

  desc = 'empty string'
  result = has_palindrome_permutation?('')
  assert_true(result, desc)

  desc = 'one character string'
  result = has_palindrome_permutation?('a')
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests
