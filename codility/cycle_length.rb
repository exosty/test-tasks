def solution a

  i=0
  while a[i]<a.length
    temp=a[i]
    a[i]+=a.length
    i=temp
  end

  count=0
  while a[i]>=a.length
    count+=1
    a[i]-=a.length
    i=a[i]
  end
  return count

end

puts solution([1,2,3,4,5,6,0])
