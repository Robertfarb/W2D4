require 'byebug'

def my_min(list)
  smallest_num = nil
  list.each_index do |i1|
    list.each_index do |i2|
      smallest_num = list[i1] if smallest_num.nil?
      smallest_num = list[i2] if smallest_num > list[i2]
      
    end
  end
  
  smallest_num
end

def my_min_n(arr)
  smallest_num = nil
  arr.each do |el|
    smallest_num = el if smallest_num.nil? || smallest_num > el
  end
  smallest_num
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_n(list)

def sub_sum(list)
  result_arr = []
  
  list.each_index do |i1|
    list.each_index do |i2|
      result_arr << list[i1..i2] unless list[i1..i2] == []
    end
  end
  sum_arr = result_arr.map { |el| el.reduce(:+) }
  max_val = sum_arr.max
end

list = [5, 3, -7, 2, -4, 2, 4, 6, -2, -1, 8, -0]
# p sub_sum(list)

def sub_sum_n(list)
  greatest_sum = list.first
  current_greatest_sum = list.first
  
  i = 1
  while i < list.length
    # debugger
    if greatest_sum <= 0
      if list[i] > greatest_sum
        greatest_sum = list[i] 
        current_greatest_sum = list[i]
      end
    else
      if current_greatest_sum < 0
        current_greatest_sum = 0
      end
      current_greatest_sum += list[i]
      greatest_sum = current_greatest_sum if current_greatest_sum > greatest_sum      
    end
    i += 1
  end
  
  greatest_sum
  
  # list.each do |el|
  #   if greatest_sum.nil?
  #     current_greatest_sum = el
  #     greatest_sum = el
  #     next
  #   end
  # 
  #   if current_greatest_sum < 0 && el >= 0
  #     current_greatest_sum = el
  #     next
  #   end
  # 
  #   current_greatest_sum += el
  # end
    
end

# p sub_sum_n(list)
p sub_sum_n([2, 3, -6, 7, -6, 7])
p sub_sum_n([-5, -1, -3])


def first_anagram?(word, target)
  result_arr = word.chars.permutation.to_a
  result_arr.include?(target.chars)
end

def second_anagram?(word, target)
  while word != "" && target != ""
    j = 0
    # debugger
    while j < target.length
      if word[0] == target[j]
        word = word[1..-1]
        target = target[0...j] + target[j + 1..-1]
        j = 0
      else
        j += 1
      end
    end
    return false unless word == "" && target == ""
  end
  true
end

# p second_anagram?("hello", "jlleh")

def third_anagram?(word, list)
  word.chars.sort == list.chars.sort
end

def fourth_anagram?(word, list)
end

p third_anagram?("hefllo", "olleh")

