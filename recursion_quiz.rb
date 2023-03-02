# Define a recursive function that finds the factorial of a number

def factorial(number)
  if number == 1
    1
  else
    number * factorial(number - 1)
  end
end

def palindrome?(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome?(string[1..-2])
    else
      false
    end
  end
end

def bottle_of_beer(num)
  if num == 0
    p "No more bottles of beer on the wall"
  else
    p "#{num} bottles of beer on the wall,"
    sleep(0.1)
    p "#{num} bottles of beer,"
    sleep(0.1)
    p "take one down, pass it around"
    sleep(0.1)
    p "#{num-1} bottles of beer on the wall."
    sleep(0.1)
    bottle_of_beer(num-1)
  end
end

p factorial(3)
p factorial(10)
p palindrome?("Hi there")
p palindrome?("racecar")
# p bottle_of_beer(1)
# p bottle_of_beer(99)