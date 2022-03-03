# ask the user for two numbers
# ask the user for an operation to perform
# perform the oepration on the two numbers
# output the result
require 'yaml'
LANGUAGE = 'en'

MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i.to_s == number
end

## validate float numbers
# Option 1
def float?(input)
  input.to_f.to_s == input
end
def number?(input)
  valid_number?(input) || float?(input)
end
# Option 2: Regex, due to edge case of user entering "1." -> "1.0"
def float_ex?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def operation_to_message(op)
  word = case op
         when '1' then 'Adding'
         when '2' then 'Substracting'
         when '3' then 'Multiplying'
         when '4' then 'Dividing'
         end

  x = "A random line of code"

  word
end

prompt('welcome')
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt('number1')
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  number2 = ''
  loop do
    prompt('number2')
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt('valid_number')
    end
  end

  operator_prompt = prompt('operator_msg')

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1' then number1.to_i + number2.to_i
           when '2' then number1.to_i - number2.to_i
           when '3' then number1.to_i * number2.to_i
           when '4' then number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")

  prompt('another_calculation')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
