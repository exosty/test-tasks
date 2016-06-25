def solution(s)
  i=0
  while s.length>1 && i<2 do
    e = s[0]
    s[0]=''
    if s.include?(e)
      s.sub!(e, '')
    else
      i=i+1
    end
  end

  if s.length+i>1
    return 0
  else
    return 1
  end

end
