require 'pry'

def cipher_to_ascii(cipher)
  cipher.map(&:chr).join
end

def ascii_to_cipher(*cipher)
  key = cipher.map(&:ord)
end

def xor_cipher(cipher, key)
  index = 0
  cipher.map do |c|
    c_new = c ^ key[index]
    index = (index + 1) % key.length
    c_new
  end
end

cipher = File.open('./cipher.txt').read.split(',').map(&:to_i)

alphabet = 'abcdefghijklmnopqrstuvwxyz'.chars

alphabet.each do |i|
  alphabet.each do |j|
    alphabet.each do |k|
      key = ascii_to_cipher(i, j, k)
      decrypted_message = xor_cipher(cipher, key)
      decrypted_words = cipher_to_ascii(decrypted_message)
      if decrypted_words.include?("Euler")
        puts cipher_to_ascii(key).inspect
        puts decrypted_words.inspect
        puts decrypted_message.sum
      end
    end
  end
end
