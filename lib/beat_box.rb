require './lib/node'
require './lib/linked_list'
require './lib/messenger'

class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
    @messenger = Messenger.new
  end

  def append(data)
    allowed_words = File.read('allowed_words.txt').split("\n")
    data_array = data.split(' ')
    allowed_data_array = data_array.select do |word|
      allowed_words.include?(word)
    end
    allowed_data_array.each do |element|
      list.append(element)
    end
  end
  
  def prepend(data)
    allowed_words = File.read('allowed_words.txt').split("\n")
    data_array = data.split(' ')
    allowed_data_array = data_array.select do |word|
      allowed_words.include?(word)
    end
    allowed_data_array.each do |element|
      list.prepend(element)
    end
  end

  def insert(position, data)
    allowed_words = File.read('allowed_words.txt').split("\n")
    data_array = data.split(' ')
    allowed_data_array = data_array.select do |word|
      allowed_words.include?(word)
    end
    list.insert(position, allowed_data_array)
  end

  def count
    list.count
  end

  def play
    beats = @list.to_string
    `say -r 500 -v Boing #{beats}`
  end

  def start
    @messenger.start_message
    @messenger.list_commands
    commands = %w[play loop prepend append add reset pop words beat help]
    continue = true
    while continue
      user_answer = gets.chomp.downcase
      case user_answer
      when 'play'
        if @list.head == nil
          puts 'There is no beat to play'
        else
          play
        end
      when 'loop'
        if @list.head == nil
          puts 'There is no beat to play'
        else
          loop_play
        end
      when 'prepend'
        user_prepend
      when 'append'
        user_append
      when 'add'
        user_insert
      when 'reset'
        @list.head = nil
      when 'pop'
        @list.pop
      when 'words'
        @messenger.print_allowed_words
      when 'beat'
        puts @list.to_string
      when 'help'
        @messenger.list_commands
      when 'quit'
        continue = false
      end
      if commands.include?(user_answer)
        puts "\n"
        puts "Enter your next command!"
      elsif user_answer == 'quit'
      else 
        puts "\n"
        puts "That's not a command!"
      end
    end
  end

  def user_prepend
    puts 'Enter a string of words that you would like to add to the beat.'
    data = gets.chomp.downcase
    prepend(data)
  end

  def user_append
    puts 'Enter a string of words that you would like to add to the beat.'
    data = gets.chomp.downcase
    append(data)
  end

  def user_insert
    puts 'Enter a number indicating the position you want to add a beat to'
    position = gets.chomp.to_i
    data = gets.chomp.downcase
    insert(position, data)
  end

  def loop_play
    puts 'Enter the number of times you want to loop your beat'
    number_of_loops = gets.chomp.to_i
    number_of_loops.times do
      play
    end
  end
end