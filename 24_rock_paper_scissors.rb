VALID_CHOICES = %w(r p s l sp)

text_choice = {
  r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', sp: 'spock'
}

win_combinations = {
  r: ['s', 'l'],
  p: ['r', 'sp'],
  s: ['l', 'p'],
  l: ['sp', 'p'],
  sp: ['s', 'r']
}

def prompt(message)
  puts("=> #{message}")
end

def clear
  puts "amit"
  if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
  end
end

def win?(first, second, win_combination_hash)
  win_combination_hash.key?(first.to_sym) &&
    win_combination_hash[first.to_sym].include?(second)
end

def display_results(player, computer, win_combination_hash)
  if win?(player, computer, win_combination_hash)
    "You won!"
  elsif win?(computer, player, win_combination_hash)
    "Computer won!"
  else
    "It's a tie!"
  end
end

loop do
  player_score = 0
  computer_score = 0

  def score_check(player, computer)
    player == 3 || computer == 3
  end

  while !score_check(player_score, computer_score)
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("(r = rock, p = paper, s = scissors, l = lizard, sp = spock)")
      choice = gets.chomp

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    player_sym = text_choice[choice.to_sym]
    computer_sym = text_choice[computer_choice.to_sym]
    prompt("You chose #{player_sym}; Computer chose #{computer_sym}")

    puts display_results(choice, computer_choice, win_combinations)
    case display_results(choice, computer_choice, win_combinations)
    when "You won!" then player_score += 1
    when "Computer won!" then computer_score += 1
    end

    puts "Your score: #{player_score}, Computer score: #{computer_score}"

    sleep 3
    clear

    if player_score == 3
      puts "Match is over. You are the grand winner!"
    elsif computer_score == 3
      puts "Match is over. Computer is the grand winner!"
    end
  end

  prompt("Do you want to start over? (type 'Y' for yes)")
  start_over = gets.chomp
  break unless start_over.downcase.start_with?('y')
  clear
end

prompt("Thank you for playing. Goodbye!")
