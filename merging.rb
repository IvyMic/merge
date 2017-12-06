def merge_sort(arr)
  sol_arr = []
  return arr if arr.length < 2

  #slice the array from the start to half way through
  first_half = merge_sort(arr.slice(0, (arr.length/2)))
  #slice it from the middle to the last element
  second_half = merge_sort(arr.slice((arr.length/2), arr.length-1))

  until first_half.empty? || second_half.empty?
    #if the first half is bigger, push the second half value to the sol arr
    sol_arr << (first_half[0] > second_half[0] ? second_half.shift : first_half.shift)
  end
  #concat step
  sol_arr + second_half + first_half
end
merge_sort([2,5,3,4,9,7,5,2,1]).inspect


#twofunction way
#merge_sort2 is just a clearer implementation/version of merge_sort
def merge_sort2(arr)
  return arr if arr.length < 2

  midway = (arr.length / 2).floor
  #split array into two halves
  first_half = merge_sort2(arr[0..midway-1])
  second_half = merge_sort2(arr[midway..arr.length])
  merge(first_half,second_half)
end

def merge(first_half,second_half)
  if first_half.empty?
    second_half
  elsif second_half.empty?
    first_half
  elsif first_half[0] < second_half[0]
    [first_half[0]] + merge(first_half[1..first_half.length], second_half) # [first_half[0]] is in array form to allow for concat
  else
    [second_half[0]] + merge(first_half, second_half[1..second_half.length])
  end
end

merge_sort2([2,5,3,4,9,7,5,2,1]).inspect

=begin
  - continuously split the arr into smaller arr halves and sort them
  - merge the sorted arrays into one
=end
