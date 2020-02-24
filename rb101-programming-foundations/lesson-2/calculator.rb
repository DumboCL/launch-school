# calclator.rb
#
# features
# 1. ask the user for two numbers
# 2. ask the user for an operation to perform
# 3. perform the operation on the two numbers
# 4. output the result
# 5. give a loop to let user to choose want to continue or not
#
# bonus features
# 1. come up with a better way to validate numbers
# 2. number validation
# 3. extracting messages
# 4. internationalise messages

require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('calculator_messages.yml')

language = nil

def clear_screen
  system('clear') || system('cls')
end

def messages(key, language)
  MESSAGES[language][key]
end

def prompt(key, language = 'en', message_param = nil)
  message = messages(key, language)
  if message_param
    Kernel.puts("=> #{message} #{message_param}")
  else
    Kernel.puts("=> #{message}")
  end
end

def valid_float_number?(num)
  /^[-+]?[0-9]*\.?[0-9]+$/.match(num)
end

def valid_language_input?(lang)
  /^[1-2]$/.match(lang)
end

def processing_message(op)
  message = case op
            when '1'
              'add'
            when '2'
              'subtract'
            when '3'
              'multiply'
            when '4'
              'divide'
            end
  message
end

def pick_language
  prompt("language")
  lang = nil

  loop do
    lang = gets().chomp
    break if valid_language_input?(lang)
    prompt("language_error")
  end
  language = case lang
             when '1'
               'en'
             when '2'
               'ch'
             end
  language
end

def get_number(number_key, language)
  number = nil

  loop do
    prompt(number_key, language)
    number = Kernel.gets().chomp()

    if valid_float_number?(number)
      break
    else
      prompt('invalid_number', language)
    end
  end

  number
end

def get_operator(language)
  operator = nil
  prompt("operator_prompt", language)

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('choose_operator', language)
    end
  end

  operator
end

def get_name(language)
  prompt('welcome', language)
  name = nil

  loop do
    name = Kernel.gets().chomp()

    if name.empty?()
      prompt('valid_name', language)
    else
      break
    end
  end

  name
end

def get_result(operator, number1, number2)
  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end

  result
end

clear_screen
language = pick_language
username = get_name(language)

loop do # main loop
  clear_screen
  prompt("hi", language, username)
  number1 = get_number('first_number', language)
  number2 = get_number('second_number', language)
  operator = get_operator(language)

  prompt(processing_message(operator), language)

  result = get_result(operator, number1, number2)

  prompt("result", language, result)
  prompt('ask_for_another', language)
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('goodbye_message', language)
