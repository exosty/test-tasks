def solution string
  i=0
  while string.length>1 && i<2 do
    element = string[0]
    string[0]=''
    if string.include?(element)
      string.sub!(element, '')
    else
      i=i+1
    end
  end

  if string.length+i>1
    return 0
  else
    return 1
  end

end

puts solution('abacdafdbcf')
