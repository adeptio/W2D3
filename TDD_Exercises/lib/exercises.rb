require 'byebug'

class Array

  def my_uniq
    result = []
    each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    (0...length).each do |i1|
      (i1 + 1...length).each do |i2|
        result += [[i1, i2]] if self[i1] + self[i2] == 0
      end
    end
    result
  end
end

  def my_transpose(arr)
    result = []
    arr.length.times do |i|
      result << Array.new
      arr.each do |sub_arr|
        result[i] += [sub_arr[i]]
      end
    end
    result
  end
