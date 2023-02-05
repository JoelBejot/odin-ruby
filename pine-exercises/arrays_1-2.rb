lineWidth = 50
table_of_contents = ["Chapter 1: Numbers", "page 1", "Chapter 2: Letters", "page 72", "Chapter 3, Variables", "page 118"]
puts ("Table of Contents".center(lineWidth))
puts ""
i = 0
while (i < table_of_contents.length)
    puts (table_of_contents[i].ljust(lineWidth/2)) + (table_of_contents[i + 1].rjust(lineWidth/2))
    i += 2
end