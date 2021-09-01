# Inputs are strings, where big is at least as long as little
# Returns true if the reverse of little is found in big
# Otherwise returns false
# You are allowed to use string methods
def reverseSubstring(big, little)
  return big.include? little.reverse
end
# Inputs are integers
# Returns true if x is not equal to y and either x*y < 100 or x+y > 50
# Otherwise returns false
# Use a single conditional statement
def cheesyTest(x, y)
  return x != y && (x * y < 180 || x + y > 50)
end
# Inputs are an array of strings, using a star argument, and a character
# Returns an array containing all the strings that evaluate to less than c
# Case insensitive
def smallerStrings(*strings, c)
  return strings.select {|s| s.downcase < c.downcase}
end
# Inputs are integers such that end > start
# Returns an array of integers and strings: "fizz", "buzz", and "fizzbuzz"
# For each number in (start, end):
# fizz is inserted into the array if the number is divisible by 3
# buzz is inserted into if the number is divisible by 5
# fizzbuzz is inserted into the list if the number is divisible by both
# the number is inserted if it is divisible by neither
def fizzbuzz(start, fin)
  arr = []
  for i in (start..fin)
    if i % 15 == 0
      arr << 'fizzbuzz'
    elsif i % 3 == 0
      arr << 'fizz'
    elsif i % 5 == 0 
      arr << 'buzz'
    else
      arr << i 
    end
  end
  return arr
end
# Input is an integer
# Returns true if the number is a perfect number
# (the number's proper divisors sum to the number)
# Otherwise returns false
# For extra fun, see how many perfect numbers you can find using your function
def isPerfect(x)
  arr = []
  for i in (1..x-1)
    if x % i == 0 
      arr << i
    end
  end
  return arr.uniq.sum == x
end
# Input is an array of integers
# Returns the array sorted in ascending order
# This is done by shuffling the array then checking to see if it's sorted
# Do not use built-in shuffling or sorting functions
def bozosort(arr)
    upper = arr.length - 1
    until (0..arr.length - 2).all? {|i| arr[i] <= arr[i + 1] }
      for i in (0..upper)
        random = rand(upper)
        temp = arr[random]
        arr[random] = arr[i]
        arr[i] = temp
      end
    end
  return arr
end 

puts('Testing reverseSubstring:')
puts("Case %s, %s: #{reverseSubstring("bloop", "poo") == true}" % ["bloop", "poo"])
puts("Case %s, %s: #{reverseSubstring("bloop", "qwer") == false}\n\n" % ["bloop", "qwer"])

puts('Testing cheesyTest:')
puts("Case %d, %d: #{cheesyTest(40, 30) == true}" % [40, 30])
puts("Case %d, %d: #{cheesyTest(20, 30) == false}\n\n" % [20, 30])

puts('Testing smallerStrings:')
puts("Case 'a', 's', 'd', 'f', 'g', 'h', 'g': #{smallerStrings('a', 's', 'd', 'f', 'g', 'h', 'g') == ["a", "d", "f"]}" % [])
puts("Case 'boop', 'PoTaTo', 'orange, 'I', 'noot NOOT', 'h': #{smallerStrings('boop', 'PoTaTo', 'orange', 'I', 'noot NOOT', 'h') == ["boop", "PoTaTo", "I"]}\n\n" )

puts('Testing fizzbuzz:')
puts("Case %d, %d: #{fizzbuzz(0, 100) == ["fizz", 1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizz", 16, 17, "fizz", 19, "buzz", "fizz", 22, 23, "fizz", "buzz", 26, "fizz", 28, 29, "fizz", 31, 32, "fizz", 34, "buzz", "fizz", 37, 38, "fizz", "buzz", 41, "fizz", 43, 44, "fizz", 46, 47, "fizz", 49, "buzz", "fizz", 52, 53, "fizz", "buzz", 56, "fizz", 58, 59, "fizz", 61, 62, "fizz", 64, "buzz", "fizz", 67, 68, "fizz", "buzz", 71, "fizz", 73, 74, "fizz", 76, 77, "fizz", 79, "buzz", "fizz", 82, 83, "fizz", "buzz", 86, "fizz", 88, 89, "fizz", 91, 92, "fizz", 94, "buzz", "fizz", 97, 98, "fizz", "buzz"]}" % [0, 100])
puts("Case %d, %d: #{fizzbuzz(1, 17) == [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz", 13, 14, "fizz", 16, 17]}\n\n" % [1, 17])

puts('Testing isPerfect:')
puts("Case %d: #{isPerfect(6) == true}" % [6])
puts("Case %d: #{isPerfect(100) == false}\n\n" % [100])

puts('Testing bozosort:')
puts("Case [1, 3, 2, 6, 4, 8]: #{bozosort([1, 3, 2, 6, 4, 8]) == [1, 2, 3, 4, 6, 8]}" % [6])
puts("Case [5, 34, 61, 1234, 1324, 2345, 2456, 3567, 7456]: #{bozosort([1234, 7456, 1324, 2456, 3567,2345, 61, 34, 5]) == [5, 34, 61, 1234, 1324, 2345, 2456, 3567, 7456]}\n\n")
