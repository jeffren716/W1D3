def range(start, last)
  return [] if last <= start

  range(start, last - 1) + [last - 1]
end


#puts range(1, 5)
#puts range(2, 1)
#puts range(3, 5)

def exp1(base, num)
  return 1 if num == 0

  base * exp1(base, num - 1)
end

# puts exp1(2, 2)
# puts exp1(2, 3)

def exp2(base, num)
  return 1 if num == 0
  return base if num == 1
  if num.even?
    exp2(base, num / 2) * base
  else
    base * (exp2(base, (num - 1) / 2) * base)
  end
end

# puts exp2(3, 3)
# puts exp2(2, 5)
class Array
  def dup
    # If argument is single array, this makes a copy
    mirror = []
    mirror.concat(self)
    # Returns the array if all elements in the array are not more arrays
    return mirror if mirror.all? {|el| !el.is_a?(Array)} == true
    arr = []
    mirror.each do |el|
      if el.is_a?(Array)
        el.dup
      end
      # If argument is nested array, this makes each array a copy
      copy = []
      copy += el
      arr << copy
    end
    arr
  end
end

# robot_parts = [
# 1, 2, 3
# ]
#
# robot_parts_copy = robot_parts.dup
#
# # shouldn't modify robot_parts
# p robot_parts_copy[1] = "LEDs"
# p robot_parts_copy
# # but it does
# p robot_parts[1]

def fibonacci(num)
  return [] if num < 1
  return [1] if num == 1
  return [1, 1] if num == 2

  prefib = fibonacci(num - 1)
  prefib << (prefib[-1] + prefib[-2])
end

# p fibonacci(10)
# p fibonacci(1)
# p fibonacci(-8)

def subsets(array)
  return [[]] if array.empty?
  tail = array[-1]
  short = subsets(array[0...-1])
  short + short.map {|el| el + [tail]}
  # ans << short << short.dup
  # middle = ans.length / 2
  # ans[middle..-1].each do |el|
  #   el << tail
  # end
  # ans
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(array)
  return [array] if array.size < 2
  perm = []
  array.each do |el|
    permutations(array - [el]).each do |blah|
      perm << ([el] + blah)
    end
  end
  # p array
  perm
end

# Thanks StackOverflow

p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
















def bsearch(array, target)
  middle = array.length / 2
  return middle if array[middle] == target
  return nil if array.length <= 1
  if array[middle] < target
    top_half = array[middle..-1]
    bsearch(top_half, target) + middle
  else
    bottom_half = array[0...middle]
    bsearch(bottom_half, target)
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(array)
  return [] if array.empty?
  return array if array.length == 1
  middle = array.length / 2
  bottom_half = array[0...middle]
  top_half = array[middle..-1]
  merge(merge_sort(bottom_half), merge_sort(top_half))
end

def merge(bot, top)
  array = []
  until bot.length == 0 || top.length == 0 do
    if bot.first <= top.first
      array << bot.shift
    else
      array << top.shift
    end
  end
  array + bot + top
end

# p merge_sort([1,6,3,8,22,3,11,24,54,68,79,80,98,65,46,76,53])

def make_change(amount, coins = [25, 10, 5, 1])

end

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  ans = []
  return [] if amount == 0
  coins.each do |coin|
    if amount % coin != amount
      amount -= coin
      ans << coin
      break
    end
  end
  ans + greedy_make_change(amount)
end

# p greedy_make_change(24, [10, 7, 1])
