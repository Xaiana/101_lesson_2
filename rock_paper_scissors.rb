VALID_CHOICES = %w(rock paper scissors)

def win?(first, second)
  (first == 'rock'     && second == 'scissors') ||
  (first == 'paper'    && second == 'rock') ||
  (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won :(")
  else
    prompt("Its a tie")
  end
end

def test_method
  prompt('test message')
end

def prompt(message)
  puts("=> #{message}")
end

test_method

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Thats not a vailid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you play again!')
