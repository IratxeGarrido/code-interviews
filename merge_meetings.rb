# Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.

# To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as an array ↴ of integers [start_time, end_time]. These integers represent the number of 30-minute blocks past 9:00am.

# For example:

#   [2, 3]  # Meeting from 10:00 – 10:30 am
# [6, 9]  # Meeting from 12:00 – 1:30 pm

# Ruby
# Write a method merge_ranges() that takes an array of multiple meeting time ranges and returns an array of condensed ranges.

# For example, given:

#   [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

# Ruby
# your method would return:

#   [[0, 1], [3, 8], [9, 12]]

# Ruby
# Do not assume the meetings are in order. The meeting times are coming from multiple teams.

# Write a solution that's efficient even when we can't put a nice upper bound on the numbers representing our time ranges. Here we've simplified our times down to the number of 30-minute slots past 9:00 am. But we want the method to work even for very large numbers, like Unix timestamps. In any case, the spirit of the challenge is to merge meetings where start_time and end_time don't have an upper bound.

def merge_ranges(meetings)
  sorted_meetings = meetings.sort
    # Merge meeting ranges.
    merged_meetings = [sorted_meetings[0]]

    sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|
      last_merged_meeting_start, last_merged_meeting_end = merged_meetings[-1]

      if last_merged_meeting_end >= current_meeting_start
        merged_meetings[-1] = [last_merged_meeting_start,
        [current_meeting_end, last_merged_meeting_end].max]
      else
        merged_meetings << [current_meeting_start, current_meeting_end]
      end
    end
    merged_meetings
end

def run_tests
  desc = 'meetings overlap'
  actual = merge_ranges([[1, 3], [2, 4]])
  expected = [[1, 4]]
  assert_equal(actual, expected, desc)

  desc = 'meetings touch'
  actual = merge_ranges([[5, 6], [6, 8]])
  expected = [[5, 8]]
  assert_equal(actual, expected, desc)

  desc = 'meeting contains other meeting'
  actual = merge_ranges([[1, 8], [2, 5]])
  expected = [[1, 8]]
  assert_equal(actual, expected, desc)

  desc = 'meetings stay separate'
  actual = merge_ranges([[1, 3], [4, 8]])
  expected = [[1, 3], [4, 8]]
  assert_equal(actual, expected, desc)

  desc = 'multiple merged meetings'
  actual = merge_ranges([[1, 4], [2, 5], [5, 8]])
  expected = [[1, 8]]
  assert_equal(actual, expected, desc)

  desc = 'meetings not sorted'
  actual = merge_ranges([[5, 8], [1, 4], [6, 8]])
  expected = [[1, 4], [5, 8]]
  assert_equal(actual, expected, desc)

  desc = 'oneLongMeetingContainsSmallerMeetings'
  actual = merge_ranges([[1, 10], [2, 5], [6, 8], [9, 10], [10, 12]])
  expected = [[1, 12]]
  assert_equal(actual, expected, desc)

  desc = 'sample input'
  actual = merge_ranges([[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]])
  expected = [[0, 1], [3, 8], [9, 12]]
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
