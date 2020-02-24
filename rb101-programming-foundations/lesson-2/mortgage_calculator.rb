# mortgage_calculator.rb
#
# inputs:
# the loan amount (p)
# the Annual Percentage Rate (APR)
# the loan duration in years(y)
#
# outputs:
# monthly interest rate (j = APR / 12)
# loan duration in months (n = y * 12)
# monthly payment (m = p * (j / (1 - (1 + j)**(-n))))

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def clear_screen
  system('clear') || system('cls')
end

def messages(key)
  MESSAGES[key]
end

def prompt(key, parameter = nil)
  message = messages(key)
  if parameter
    Kernel.puts("=> #{message} #{parameter}")
  else
    Kernel.puts("=> #{message}")
  end
end

def int_verified?(number)
  /^[0-9]*$/.match(number)
end

def float_verified?(number)
  /^[-+]?[0-9]*\.?[0-9]+$/.match(number)
end

def loan_amount_veryfied?(number)
  float_verified?(number) && number.to_f > 0
end

def apr_veryfied?(apr)
  float_verified?(apr) && apr.to_f > 0
end

def loan_duration_y_veryfied?(duration)
  float_verified?(duration) && duration.to_f > 0
end

def loan_duration_m_veryfied?(duration)
  int_verified?(duration) && duration.to_f > 0
end

def once_again_veryfied?(choose)
  /^[YyNn]/.match(choose)
end

def read_loan_amount
  loan_amount = nil

  loop do
    prompt('ask_loan_amount')
    loan_amount = Kernel.gets().chomp()
    if loan_amount_veryfied?(loan_amount)
      break
    else
      prompt('loan_amount_error')
    end
  end

  loan_amount.to_f
end

def read_apr
  apr = nil

  loop do
    prompt('ask_apr')
    prompt('apr_example')
    apr = Kernel.gets().chomp()
    if apr_veryfied?(apr)
      break
    else
      prompt('apr_error')
    end
  end

  apr.to_f / 100
end

def read_loan_duration_in_years
  loan_duration_y = nil

  loop do
    prompt('ask_loan_duration_y')
    loan_duration_y = Kernel.gets().chomp()
    if loan_duration_y_veryfied?(loan_duration_y)
      break
    else
      prompt('loan_duration_y_error')
    end
  end

  loan_duration_y.to_f
end

def read_loan_duration_in_months
  loan_duration_m = nil

  loop do
    prompt('ask_loan_duration_m')
    loan_duration_m = Kernel.gets().chomp()
    if loan_duration_m_veryfied?(loan_duration_m)
      break
    else
      prompt('loan_duration_m_error')
    end
  end

  loan_duration_m.to_f
end

def cal_monthly_payment(annual_percentage_rate, loan_duration_m, loan_amount)
  monthly_interest_rate = annual_percentage_rate / 12
  monthly_payment = loan_amount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_m)))
  monthly_payment
end

def once_again?
  response = nil

  loop do
    prompt('again')
    response = Kernel.gets().chomp()
    if once_again_veryfied?(response)
      break
    else
      prompt('again_error')
    end
  end

  once_again = response.downcase() == 'y'

  once_again
end

clear_screen
# main loop
loop do
  clear_screen
  prompt('welcome')
  prompt('divide')

  loan_amount = read_loan_amount
  annual_percentage_rate = read_apr
  loan_duration_m = read_loan_duration_in_months

  monthly_payment = cal_monthly_payment(
    annual_percentage_rate, loan_duration_m, loan_amount
  )
  prompt('show_result', format('%02.2f', monthly_payment))

  break unless once_again?
end

prompt('thanks')
prompt('bye')
