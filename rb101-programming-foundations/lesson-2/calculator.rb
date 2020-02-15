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

def messages(key, language)
  MESSAGES[language][key]
end

def prompt(key, language = 'en', para = nil)
  message = messages(key, language)
  if para
    Kernel.puts("=> #{message} #{para}")
  else
    Kernel.puts("=> #{message}")
  end
end

def valid_float_number?(num)
  /^[-+]?[0-9]*\.?[0-9]+$/.match(num)
end

def operation_to_message(op)
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
    break if /^[1-2]$/.match(lang)
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

language = pick_language
prompt('welcome', language)

name = nil
loop do # name loop
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name', language)
  else
    break
  end
end

prompt("hi", language, name)

number1 = nil
number2 = nil

loop do # main loop
  loop do
    prompt('first_number', language)
    number1 = Kernel.gets().chomp()

    if valid_float_number?(number1)
      break
    else
      prompt('invalid_number', language)
    end
  end

  loop do
    prompt('second_number', language)
    number2 = Kernel.gets().chomp()

    if valid_float_number?(number2)
      break
    else
      prompt('invalid_number', language)
    end
  end

  prompt("operator_prompt", language)
  operator = nil

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('choose_operator', language)
    end
  end

  prompt(operation_to_message(operator), language)

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

  prompt("result", language, result)
  prompt('ask_for_another', language)
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('goodbye_message', language)
