def fibs_rec(n)
  case n
  when 1
    [0]
  when 2
    [0,1]
  else
    one_less = fibs_rec(n - 1)
    last = one_less[-1] + one_less[-2]
    one_less + [last]
  end
end













