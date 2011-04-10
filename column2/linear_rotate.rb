#!/usr/bin/env ruby
require 'pp'

def gcd(a, b)
  if [a,b].min == 0
    return 0
  end

  val = 1
  max = [a, b].max
  for i in 1..max
    if a % i == 0 and b % i == 0
      val = i
    end
  end
  return val
end


def rotate(v, i)
  n = v.size

  offset = 0
  x = 0
  t = v[0]

  gcd_i_n = gcd(i,n)
  counter = 0
  while offset < gcd_i_n
    counter = counter + 1
    to = (x*i + offset) % n
    from = (x*i + i + offset) % n

    if from == offset
      v[to] = t
      offset = offset + 1
      t = v[offset]
    else
      v[to] = v[from]
    end

    x = x + 1
  end
puts counter
  return v
end


v = [0,1,2,3,4,5,6,7,8,9,10,11]
i = 3

pp rotate(Array.new(v), 3)
pp rotate(rotate(Array.new(v), 2), 1)

pp rotate([0,1,2,3,4,5,6,7,8,9,10,11,12], 7)
