def prompt(message)
  puts("=>#{message}")
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to calculator! Enter your name:")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("Please enter your name")
  else
    break
  end
end

prompt("Lets begin #{name}!")

loop do # Main loop
  num1 = ''
  loop do
    prompt("Choose a number")
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt("That is not a valid number please try again")
    end
  end

  num2 = ''
  loop do
    prompt("Now choose another")
    num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt("That is not a valid number please try again")
    end
  end

  action_prompt = <<-MSG
    Do you want to
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(action_prompt)

  action = ''
  loop do
    action = gets.chomp

    if %w(1 2 3 4).include?(action)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(action)} the two numbers...")

  result =  case action
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
            end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to go again)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using calculator. Good bye!")
