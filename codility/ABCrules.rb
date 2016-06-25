def solution(s)
    s.scan(/[AB]*(A)[AB]*|[BC]*(C)[BC]*|(B+)/).join('')
end
puts solution('ACBABACBACBACBACBCBACACBACBAABBAAAABABACC')
