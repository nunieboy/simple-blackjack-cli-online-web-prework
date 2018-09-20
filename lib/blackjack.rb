require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(number)
  puts "Your cards add up to #{number}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_total = deal_card + deal_card
  display_card_total(card_total)
  return card_total
end

def hit?(number)
  prompt_user
  answer = get_user_input
  if answer == "s"
    number
  elsif answer == "h"
    number = number + deal_card
  else
    invalid_command
  end
end

def invalid_command
  puts "Please enter a valid command"
  prompt_user
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  number = initial_round
  new_number = hit?(number)
  display_card_total(new_number)
  until new_number > 21
    new_number = hit?(new_number)
    display_card_total(new_number)
    binding.pry
  end
  end_game(new_number)
end
