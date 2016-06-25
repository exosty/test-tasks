
def solution(a)
  a.sort_by! {|e| -e}

  i=0;
  while i<a.length-2 do
    if a[i]<a[i+1]+a[i+2]
      return a[i]+a[i+1]+a[i+2]
    else
      i=i+1
    end
  end

  return -1
end
# n(logn)+(n-2) => complexity n(logn)
