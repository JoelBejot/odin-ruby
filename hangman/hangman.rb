require 'io/console'
require './display_methods.rb'

class Hangman
  include Gallows

  attr_accessor :name

  $counter = {player: 0, computer: 0}

  def initialize
    @name = name
    @secret_word = ""
    @round = 0
    @guesses = []
    @wrong_guesses_count = 0
    @wrong_guesses = ""
    @right_guesses = []
    @over = false
  end

  def game
    again = true
    self.display_title
    self.begin?
    self.load_game?
    while again
      self.display_rules
      self.pick_word
      self.display_hangman(@round)
      self.display_guesses
      @round += 1
      while @round < 7 && @over == false
        correct = false
        guess = self.make_guess(guess)
        correct = self.compare_guess(guess)
        self.display_hangman(@round)
        self.display_guesses
        @over = self.over?
        unless correct
          @round += 1
        end
      end
    self.who_won?(@over)
    self.save_game?
    again = self.play_again?
    initialize
    end
  end

  protected
  def begin?
    start_game = false
    answer = nil
    unless start_game
      puts "Do you want to play Hangman? (y/n)"
      answer = STDIN.getch.downcase
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
    answer = STDIN.getch.downcase
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
      @guesses << guess
      @guesses.each { |letter| print "#{letter} "}
      puts ""
      puts ""
      guess
    end
  end

  def compare_guess(guess)
    correct = false
    @secret_word.each_with_index do |letter, index|
      if guess == letter
        @right_guesses[index] = guess
        correct = true
      end
    end
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

  def who_won?(winner)
    if winner == true
      puts "Congratulations! You guessed the word."
      puts ""
      $counter[:player] += 1
    else
      puts "The computer won this time."
      puts "The word was \"#{@secret_word.join}.\""
      puts ""
      $counter[:computer] += 1
    end
    puts "The current score is #{name}: #{$counter[:player]}, Computer: #{$counter[:computer]}"
    puts ""
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    again = STDIN.getch.downcase
    validate_boolean(again)
    if again == "n"
      puts "See you next time!"
      puts ""
      exit
    else 
      return true
    end
  end

  def save_game?
    puts "Would you like to save your progress? (y/n)"
    save = STDIN.getch.downcase
    validate_boolean(save)
    if save == "y"
      puts "Saving..."
      puts ""
      Dir.mkdir("saved_game") unless Dir.exists? "saved_game"
      filename = "saved_game/hangman_save.rb"
      data = "#{$counter}\n#{@name}"
      File.write(filename, data, mode: "w")
      save = false
    end
  end

  def load_game?
    print "Would you like to open the saved game? (y/n) "
    open_game = STDIN.getch.downcase
    validate_boolean(open_game)
    puts ""
    if open_game == "y"
      data = File.readlines("saved_game/hangman_save.rb", chomp: true)
      $counter = eval(data[0])
      @name = data[1]
      puts ""
      puts "Welcome back, #{@name}!"
      puts "Current score: #{$counter[:player]}, Computer: #{$counter[:computer]}"
      puts ""
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
        answer = STDIN.getch.downcase
        puts ""
      end
    end
  end
end


game = Hangman.new
game.game