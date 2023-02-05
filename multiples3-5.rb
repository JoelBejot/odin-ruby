accumulator = 0
i = 0
while (i < 1000)
    if (i % 3 == 0 or i % 5 == 0)
        a = i
        accumulator = accumulator + a
    end
    i += 1
end

puts accumulator.to_s