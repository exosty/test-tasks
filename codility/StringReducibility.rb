def solution(s)
    s.scan(/[AB]*(A)[AB]*|[BC]*(C)[BC]*|(B+)/).join('')
end
#any part of string containing only A and B symbols transforms into A
#any part of string containing only C and B symbols transforms into C
