require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=>#{message}")
end

def integer?(num)
/^\d+$/.match(num)
end

def float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  action = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  action
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Lets begin #{name}!")

loop do # Main loop
  num1 = ''
  loop do
    prompt(MESSAGES['number'])
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  num2 = ''
  loop do
    prompt(MESSAGES['number2'])
    num2 = gets.chomp

    if valid_number?(num2)
      break
    else
      prompt(MESSAGES['valid_number'])
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
      prompt(MESSAGES['valid_action_prompt'])
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
  prompt(MESSAGES['continue'])
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])
