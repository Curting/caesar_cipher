# Caesar cipher encrypts a message by shifting each letter x positions forward
# When you shift beyond z it begins from a again
# 
# "B".ord => 66
# 66.chr => B

def caesar_cipher(message, shift)
  encrypted = message.scan(/./).map do |letter|
    # If the element is a letter
    if (letter =~ /\w/) == 0
      # If it's upcase and shifting beyond Z
      if (letter.ord >= 65 && letter.ord <= 90) && letter.ord.+(shift) > 90
        # I minus 1 because a difference of 1 is A and not B
        difference = (letter.ord + shift) % 90 - 1
        letter = 65.+(difference).chr
      # If it's downcase and shifting beyond z
      elsif (letter.ord >= 97 && letter.ord <= 122) && letter.ord.+(shift) > 122
        # I minus 1 because a difference of 1 is a and not b
        difference = (letter.ord + shift) % 122 - 1
        letter = 97.+(difference).chr
      else
        # It takes the letter, turns it to a number, add the shift and turns it back to chr
        letter.ord.+(shift).chr
      end
    else
      # If the element is not a letter (like ! and -) just keep it as is
      letter
    end
  end

  encrypted.join
end