class Array
  def find_all_indexes(value)
    indexes = []
    self.each_index{|i| indexes.push(i) if self[i] == value}
    indexes
  end
end
class MasterMind

  def generate_code
    digits = Array(0..9)
    computer_code = [1, 1, 1, 1]
    computer_code.map { digits.sample }
  end

  def digits_included?(guess,code)
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
mastermind = MasterMind.new
secret_code = mastermind.generate_code
p secret_code
guess = nil
until guess == secret_code
  puts "Guess The Four Digits Code\n"
  guess = gets.chomp.split('').map{ |item| item.to_i }
  until mastermind.isValidGuess?(guess)
    puts "Error: Please Enter Four Digits"
    puts "Guess The Four Digits Code\n"
    guess = gets.chomp.split('').map{ |item| item.to_i }
  end

  puts mastermind.digits_included?(guess, secret_code)
end


