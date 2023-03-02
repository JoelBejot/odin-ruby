dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  #create empty hash
  string_counts = Hash.new

  #iterate through valid words
  dictionary.each do |entry|

    #look through string to see if dictionary words are in it
    if string.downcase.include?(entry)

      #use scan method to match pattern from dictionary words
      instances = string.downcase.scan(entry)

      # get a number associated with how many times a word was found
      count = instances.count

      #push all information into the hash
      string_counts[entry] = count
    end
  end
  puts string_counts
end

substrings("Howdy partner, sit down! How's it going?", dictionary)