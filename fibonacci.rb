top_number = 100
a = 1
b = 0
temp = 0
sequence_numbers = []

while top_number >= 1 and a < 4000000
    temp = a
    a = a + b
    b = temp
    top_number -= 1
    sequence_numbers << b
end

filtered_numbers = sequence_numbers.select { |num| num.even? }

total = 0
i = 0
while i < filtered_numbers.length
    total = total + filtered_numbers[i]
    i += 1
end

puts "The total of all even Fibonacci numbers less than four million is " + total.to_s + "."
