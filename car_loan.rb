require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=>#{message}")
end

loop do # main loop
  prompt("Welcome to Mortgage Calculator!")

  prompt("please enter loan amount")

  amount = ''
  loop do
    amount = gets.chomp

    if amount.empty? || amount.to_f < 0
      prompt("Please enter a valid number")
    else
      break
    end
  end

  prompt("Please enter the interest rate")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = gets.chomp

    if interest_rate.empty? || interest_rate.to_f < 0
      prompt("Enter a positive number")
    else
      break
    end
  end

  prompt("What is the loan duration (in years)?")

  years = ''
  loop do
    years = gets.chomp

    if years.empty? || years.to_i < 0
      prompt("Enter a valid number")
    else
      break
    end
  end

  apr = interest_rate.to_f / 100
  monthly_interest_rate = apr / 12
  months = years.to_i * 12

  monthly_payment = amount.to_f *
                        (monthly_interest_rate /
                        (1 - (1 + monthly_interest_rate)**(-months.to_i)))

  prompt("Your monthly payment will be #{format('%02.2f', monthly_payment)}")
  prompt(MESSAGES['continue'])
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])
