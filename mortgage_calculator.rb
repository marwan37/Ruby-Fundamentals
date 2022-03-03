# MORTGAGE CALCULATOR

def prompt(message)
  puts "=> #{message}"
end

def integer?(number)
  number.to_i.to_s == number && input.to_i > 0 && !input.empty?
end

def float?(input)
  input.to_f.to_s == input && input.to_f > 0 && !input.empty?
end

def valid_number?(input)
  integer?(input) || float?(input)
end

puts <<-TITLE
---------------------------------------
    Welcome to Mortgage Calculator!
---------------------------------------

TITLE

loop do
  loan_amount = ''
  loop do
    prompt("What is the full loan amount?")
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_i
      break
    else
      prompt("Please enter a valid number. Don't type currency symbols.")
    end
  end

  monthly_interest_rate = ''
  loop do
    prompt("What is the Annual Percentage Rate (APR)?")
    prompt("(Example: 5 for 5% or 7.5 for 7.5%)")
    monthly_interest_rate = gets.chomp

    if valid_number?(monthly_interest_rate)
      monthly_interest_rate = monthly_interest_rate.to_f / 12 / 100
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  loan_duration = ''
  loop do
    prompt("What is the loan duration (in years)?")
    loan_duration = gets.chomp

    if valid_number?(loan_duration)
      loan_duration = loan_duration.to_i * 12
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  prompt("Calculating monthly mortgage payment...")

  interest_c = (1 + monthly_interest_rate)**(-loan_duration)
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - interest_c))

  prompt("Your monthly payment is: $#{monthly_payment.round(2)}")

  prompt("Would you like to make another calculation? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.starts_with?('y')
end

prompt("Thank you for using Mortgage Calculator!")
