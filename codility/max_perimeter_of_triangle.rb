
def solution array
  array.sort_by! {|e| -e}
  i=0;
  while i<array.length-2 do
    if array[i]<array[i+1]+array[i+2]
      return array[i]+array[i+1]+array[i+2]
    else
      i=i+1
    end
  end
  return 0
end

puts solution([8,5,10,19,30])
