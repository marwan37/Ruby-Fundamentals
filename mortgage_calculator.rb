# MORTGAGE CALCULATOR

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i.to_s == number
end

def float?(input)
  input.to_f.to_s == input
end

def valid_apr?(input)
  valid_number?(input) || float?(input)
end

prompt("Welcome to Mortgage Calculator!")

loan_amount = ''
loop do
  prompt("What is the loan amount?")
  loan_amount = gets.chomp

  if valid_number?(loan_amount)
    loan_amount = loan_amount.to_i
    break
  else
    prompt("Please enter a valid number.")
  end
end

monthly_interest_rate = ''
loop do
  prompt("What is the Annual Percentage Rate (APR)? (For '5.5%' type 5.5)")
  monthly_interest_rate = gets.chomp

  if valid_apr?(monthly_interest_rate)
    monthly_interest_rate = monthly_interest_rate.to_f / 12 / 100
    break
  else
    prompt("Please enter a valid number.")
  end
end

loan_duration = ''
loop do
  prompt("What is the loan duration in months?")
  loan_duration = gets.chomp

  if valid_number?(loan_duration)
    loan_duration = loan_duration.to_i
    break
  else
    prompt("Please enter a valid number.")
  end
end

prompt("Calculating monthly mortgage payment...")

interest_c = (1 + monthly_interest_rate)**(-loan_duration)
monthly_payment = loan_amount * (monthly_interest_rate / (1 - interest_c))

prompt("Your monthly payment is $#{monthly_payment.round(2)}")
