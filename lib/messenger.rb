class Messenger

  def start_message
    puts 'Welcome! Please enter any combination of the below words to start a beat. Any other word will not be accepted.'
    print_allowed_words
  end

  def list_commands
    puts 'Instructions!'
    puts '---------------------------------------------------'
    puts 'Type Play to list to your beat'
    puts 'Type Loop to loop your beat'
    puts 'Type Prepend to add a beat to the front'
    puts 'Type Append to add a beat to the end'
    puts 'Type Add to add a beat at a specific position'
    puts 'Type Reset to reset your beat and start over'
    puts 'Type Pop to remove the beat at the end'
    puts 'Type Words to see the list of words you can use'
    puts 'Type Beat to see your current beat'
    puts 'Type Quit if you want to quit'
    puts 'Type Help if you want to see these commands again'
  end

  def print_allowed_words
    puts "\n"
    file = File.read('allowed_words.txt').split("\n")
    puts file.join(", ")
    puts "\n"
  end
end