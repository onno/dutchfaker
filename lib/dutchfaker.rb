$LOAD_PATH.unshift File.dirname(__FILE__)

require 'ext/array'
require 'dutchfaker/address'
require 'dutchfaker/name'
require 'dutchfaker/version'

module DutchFaker
  def numerify(number_string)
    number_string.gsub(/#/) { rand(10).to_s }
  end

  def letterify(letter_string)
    letter_string.gsub(/\?/) { ('a'..'z').to_a.rand }
  end
end