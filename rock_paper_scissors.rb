VALID_CHOICES = %w(rock paper scissors spock lizard)

def win?(first, second)
  (first == 'rock'     && (second == 'scissors' || second == 'lizard')) ||
  (first == 'paper'    && (second == 'rock' || second == 'spock')) ||
  (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
  (first == 'lizard'   && (second == 'paper' || second == 'spock')) ||
  (first == 'spock'   && (second == 'rock' || second == 'scissors'))
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

player = 0
computer = 0
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

  if win?(choice, computer_choice)
    player += 1
  elsif win?(computer_choice, choice)
    computer += 1
  end

  prompt("you: #{player}")
  prompt("computer: #{computer}")

  if player >= 5
    prompt("You won the match!")
    break
  elsif computer >= 5
    prompt("Computer won")
    break
  end
end

prompt('Thank you play again!')
