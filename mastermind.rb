class MasterMind

  def generate_code
    digits = Array(0..9)
    computer_code = [1, 1, 1, 1]
    computer_code.map { digits.sample }
  end

  def give_feedback(guess,code)
    at_exact_position = 0
    not_at_exact_position = 0
    guess.each_with_index do |digit,index|
     if digit == code[index]
      at_exact_position +=1
     elsif code.include?(digit)
      not_at_exact_position +=1
     end
    end
    {"Red" => at_exact_position, "White" => not_at_exact_position}
  end
  def isValidGuess?(guess)
    guess.length == 4 && guess.all? { |digit| digit.is_a?(Integer)}
  end
end

def code_breaker
  puts "You are the code breaker"
  mastermind = MasterMind.new
  secret_code = mastermind.generate_code
  guess = nil
  trials = 12
  until guess == secret_code || trials.zero?
    puts "Guess The Four Digits Code\n"
    puts "You have #{trials} trials"
    guess = gets.chomp.split('').map{ |item| item.to_i }
    until mastermind.isValidGuess?(guess)
      puts "Error: Please Enter Four Digits"
      puts "Guess The Four Digits Code\n"
      guess = gets.chomp.split('').map{ |item| item.to_i }
    end
    trials -=1

    puts mastermind.give_feedback(guess, secret_code)
  end

  p "The secret code is #{ secret_code}"
  code_generator
end

def code_generator
  puts "Your the code generator"
  puts "Please Enter Your Secret Code"
  secret_code = gets.chomp.split('').map{ |item| item.to_i }
  trials = 0
  computer_guess = nil
  player_feedback = "n"
  until player_feedback == 'y' || trials == 12
    computer_guess = MasterMind.new.generate_code
    p computer_guess
    puts "Does the guess matches your code y/n #{trials}"
    player_feedback = gets.chomp
    trials+=1
    sleep 0.5
  end
  puts "done in #{trials} trials"
  code_breaker
end
puts "Please choose your rule (x-code breaker or y-code generator) x/y"
choice = gets.chomp


if choice == 'x'
  code_breaker
else
  code_generator
end