class MasterMind

  def generate_code
    digits = Array(1..9)
    computer_code = [1, 1, 1, 1]
    computer_code.map { digits.sample }
  end
  def digits_included?(guess,code)
    at_exact_position = 0
    not_at_exact_position = 0
    guess.each do |digit|
      if code.include?(digit) && guess.index(digit) == code.index(digit)
        p "hi"
        at_exact_position +=1
      elsif code.include?(digit)
        not_at_exact_position +=1
      end
     
    end
    {"Red" => at_exact_position, "White" => not_at_exact_position}
    
  end
end
mastermind = MasterMind.new
secret_code = mastermind.generate_code
p secret_code
puts "Guess The Four Digits Code\n"
guess = gets.chomp.split.map{ |item| item.to_i }
puts mastermind.digits_included?(guess, secret_code)
until guess == secret_code
  puts "Guess The Four Digits Code\n"
  guess = gets.chomp.split('').map{ |item| item.to_i }
  puts mastermind.digits_included?(guess, secret_code)
end


