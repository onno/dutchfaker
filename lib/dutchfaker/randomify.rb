module DutchFaker
  module Randomify
    def numerify(number_string)
      number_string.gsub(/#/) { rand(10).to_s }
    end

    def letterify(letter_string)
      letter_string.gsub(/\?/) { ('a'..'z').to_a.rand }
    end
  end
end