require 'rspec'

class Cipher
  def caesar_cipher(string, num)
    # declare empty arrays
    num_arr = []
    wrapped_arr = []
    back_to_strings = []

    # turn string into array, turn letters into numbers, and iterate over elements of array
    caesar_arr = string.split(//)
    caesar_arr.each { |letter| num_arr.push(letter.ord) }

    # logic for taking only letters, and wrapping them, either positive or negative
    num_arr.each do |el|
      if el.between?(65, 90)
        el += num
        el -= 26 while el > 90
        el += 26 while el < 65
      elsif el.between?(97, 122)
        el += num
        el -= 26 while el > 122
        el += 26 while el < 97
      end
      wrapped_arr << el
    end

    # change numbers back into letters, and join them into a string
    wrapped_arr.each { |n| back_to_strings << n.chr }
    string = back_to_strings.join
    string
  end
end

# #test short strings, long strings, positive and negative numbers, small and large numbers
caesar = Cipher.new
p caesar.caesar_cipher("abcABC", 0)
p caesar.caesar_cipher("What a string!", 5)
p caesar.caesar_cipher("What a string!", -5)
# p caesar_cipher("Let's see what it can do with a longer string?!?!?", 26)
# p caesar_cipher("Let's see what it can do with a longer string?!?!?", 26)
# p caesar_cipher("Now with a huge number", 1000)
# p caesar_cipher("Now with a huge number", -1000)
