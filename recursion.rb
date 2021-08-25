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
    
end