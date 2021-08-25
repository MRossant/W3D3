require "byebug"

def range(start_idx, end_idx)
    return [] if end_idx <= start_idx
    [start_idx] + range(start_idx + 1, end_idx)
end

# p range(1, 5)

def iter_sum(array)
    sum = 0
    array.each do |num|
        sum += num
    end
    sum
end

def rec_sum(array)
    return 0 if array.empty?
    array.pop + rec_sum(array)
end

# p rec_sum([1,2,3,4])
# p iter_sum([1,2,3,4])

def exp_1(b, n)
    return 1 if n == 0
    b * exp_1(b, n - 1)
end

# p exp_1(2, 3)

def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        # incursive step for when n is even
        exp_2(b, n / 2) ** 2
    else
        # incursive step for when n is odd
        b * (exp_2(b, (n - 1) / 2) ** 2)
    end
end

# p exp_2(2, 2400)

class Array
    
    def deep_dup
        new_copy = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_copy << ele.deep_dup
            else
                new_copy << ele
            end
        end
        new_copy
    end

end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# robot_parts_copy = robot_parts.deep_dup
# p robot_parts_copy
# robot_parts_copy[1] << "LEDs"
# p robot_parts_copy[1]
# p robot_parts[1]

def recur_fib(n)
    return 1 if n == 1
    return 1 if n == 2
    fib(n - 1) + fib(n - 2)
end

def iter_fib(n)
    if n == 1
        return [1]
    elsif n == 2
        return [1, 1]
    end

    arr = [1, 1]
    (2..n).each do |idx|
        arr << arr[idx - 1] + arr[idx - 2]
    end
    arr
end

# p iter_fib(5)
# 1 1 2 3 5 8

def bsearch(array, target)
    return nil if array.empty?

    mid_idx = array.length / 2
    if array[mid_idx] == target
        return mid_idx
    elsif array[mid_idx] > target
        bsearch(array[0...mid_idx], target)
    elsif array[mid_idx] < target
        if bsearch(array[mid_idx + 1..-1], target) == nil
            return nil
        else
            (mid_idx + 1) + bsearch(array[mid_idx + 1..-1], target)
        end
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# def merge(arr_1, arr_2)
#     merged = []
#     length = [arr_1.length, arr_2.length].max
#     (0...length).each do |i|
#         if arr_1[i] == nil 
#             if arr_2[i] < arr_1[-1]
#                 temp = merged.pop
#                 merged << arr_2[i]
#                 merged << temp
#             else
#                 merged << arr_2[i]
#             end 
#         elsif arr_2[i] == nil
#             if arr_1[i] < arr_2[-1]
#                 temp = merged.pop
#                 merged << arr_1[i]
#                 merged << temp
#             else
#                 merged << arr_1[i]
#             end
#         elsif arr_1[i] < arr_2[i]
#             merged << arr_1[i]
#             merged << arr_2[i]
#         else
#             merged << arr_2[i]
#             merged << arr_1[i]
#         end
#     end
#     merged
# end

def merge(arr_1, arr_2)
    merged = []

    arr_1_idx = 0
    arr_2_idx = 0

    sorted = false

    until sorted
        if arr_1[arr_1_idx] == nil
            merged += arr_2[arr_2_idx..-1]
            sorted = true
        elsif arr_2[arr_2_idx] == nil
            merged += arr_1[arr_1_idx..-1]
            sorted = true
        elsif arr_1[arr_1_idx] < arr_2[arr_2_idx]
            merged << arr_1[arr_1_idx]
            arr_1_idx += 1
        else
            merged << arr_2[arr_2_idx]
            arr_2_idx += 1
        end
    end

    merged
end

# p merge(arr_1, arr_2)

def merge_sort(arr)
    return [] if arr.empty?
    return arr if arr.length == 1

    mid_idx = arr.length / 2
    left = arr[0...mid_idx]
    right = arr[mid_idx..-1]
    left_sorted = merge_sort(left)
    right_sorted = merge_sort(right)
    merge(left_sorted, right_sorted)
end

# arr = [38, 27, 43, 3, 9, 82, 10]
# p merge_sort(arr)


