#
# Roman numerals
#
# Generates roman numerals from integers and vice-versa
#
# A response to Ruby Quiz of the Week #22 - Roman Numerals [ruby-talk:132925]
#
# Author: Dave Burt <dave at burt.id.au>
#
# Created: 7 Mar 2005
#
# Last modified: 8 Mar 2005
#
# Fine print: Provided as is. Use at your own risk. Unauthorized copying is
#             not disallowed. Credit's appreciated if you use my code. I'd
#             appreciate seeing any modifications you make to it.
#

# Contains methods to convert integers to roman numeral strings and vice-versa.
module RomanNumeral
  
  # Maps roman numeral digits to their integer values
  DIGITS = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000,
  }
  
  # The largest integer representable as a roman numerable by this module
  MAX = 3999
  
  # Maps some integers to their roman numeral values
  @@digits_lookup = DIGITS.inject({
    4 => 'IV',
    9 => 'IX',
    40 => 'XL',
    90 => 'XC',
    400 => 'CD',
    900 => 'CM',}) do |memo, pair|
    memo.update({pair.last => pair.first})
  end
  
  # Stolen from O'Reilly's Perl Cookbook 6.23. Regular Expression Grabbag
  REGEXP = /^M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/i
  
  # Converts +int+ to a roman numeral
  def self.from_integer(int)
    return nil if int < 0 || int > MAX
    remainder = int
    result = ''
    @@digits_lookup.keys.sort.reverse.each do |digit_value|
      while remainder >= digit_value
        remainder -= digit_value
        result += @@digits_lookup[digit_value]
      end
      break if remainder <= 0
    end
    result
  end
  
  # Converts +roman_string+, a roman numeral, to an integer
  def self.to_integer(roman_string)
    return nil unless roman_string.is_roman_numeral?
    last = nil
    roman_string.to_s.upcase.split(//).reverse.inject(0) do |memo, digit|
      if digit_value = DIGITS[digit]
        if last && last > digit_value
          memo -= digit_value
        else
          memo += digit_value
          end
        last = digit_value
      end
      memo
    end
  end
  
  # Returns true iif +string+ is a roman numeral.
  def self.is_roman_numeral?(string)
    REGEXP =~ string
  end
end
