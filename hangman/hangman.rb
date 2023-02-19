require 'io/console'
require './display_methods.rb'

class Hangman
  include Gallows

  attr_accessor :name

  def initialize
    @secret_word = ""
    @round = 0
    @wrong_guesses_count = 0
    @wrong_guesses = ""
    @right_guesses = []
  end

  def game
    over = false
    # self.display_title
    # self.begin?
    # self.display_rules
    self.pick_word
    self.display_hangman(@round)
    self.display_guesses
    @round += 1
    while @round < 7 && over == false
      correct = false
      guess = self.make_guess(guess)
      correct = self.compare_guess(guess)
      self.display_hangman(@round)
      self.display_guesses
      over = self.over?
      p over
      # if @wrong_guesses stays the same, @round does not increment
      
      # if @round = 7, exit while loop
      unless correct
        @round += 1
      end
      p @round
    end
    # when should we offer to save game?
    # savegame = File.new
  end

  def begin?
    start_game = false
    answer = nil
    unless start_game
      puts "Do you want to play Hangman? (y/n)"
      answer = gets.chomp.downcase
      puts ""
      validate_boolean(answer)
      if answer == "n"
        puts "Until next time!" 
        puts ""
        exit
      end
      puts "OK! Let's begin."
      puts ""
      puts "What would you like to be called?"
      @name1 = gets.chomp
      puts ""
      puts "OK #{@name1}."
      start_game = true
    end
  end

  def display_rules
    understand = nil
    puts "Do you need to see the rules? (y/n)"
    answer = gets.chomp.downcase
    puts ""
    validate_boolean(answer)
    return if answer == "n"
    puts "Here are the rules:"
    sleep(0.5)
    puts "This is Hangman, designed to be played by one person."
    sleep(0.5)
    puts "The computer will choose a random word, and you have to guess the word, letter by letter."
    puts "Press any key to continue."
    STDIN.getch
    puts "The computer will draw the hangman, and if you guess wrong seven times, the game will be over."
    puts "You will have the option to save your game at different points."
    puts ""
  end

  def pick_word
    dictionary = File.read('google-10000-english-no-swears.txt').split("\n")
    small_dictionary = []
    dictionary.each do |word|
      if word.length >= 5 && word.length <= 12
        small_dictionary << word
      end
      
    end
    @secret_word = small_dictionary.sample.split(//)
    @secret_word.length.times do 
      @right_guesses << "_"
    end
    p @secret_word
    p @right_guesses

  end

  def make_guess(guess)
    valid = false
    puts "Please guess a letter."
    unless valid
      guess = STDIN.getch.downcase
      if guess =~ /[a-z]/
        valid = true
      elsif guess =~ /[^a-z]/
        puts "Please guess a letter (a-z)."
      end
      guess
    end
  end

  def compare_guess(guess)
    correct = false
    @secret_word.each_with_index do |letter, index|
      # puts "Letter: #{letter}, Index: #{index}"
      # if any of the characters in @secret_word are the same as the character that is guessed, 
      # add that letter to the @right_guesses array in the index where it is found
      if guess == letter
        @right_guesses[index] = guess
        correct = true
      end
    end
    p @right_guesses
    correct
  end

  def over?
    if @right_guesses == @secret_word
      puts "Congrats! You solved the secret word."
      puts ""
      return true
    else
      return false
    end
  end

  def validate_boolean(answer)
    while answer
      case answer
      when "y"  
        return
      when "yes"
        return "y"
      when "n"
        return
      when "no"
        return "n"
      else 
        puts "Please enter a valid response. (y/n)"
        answer = gets.chomp.downcase
        puts ""
      end
    end
  end

end

game = Hangman.new.game