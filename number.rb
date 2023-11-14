class Number
  def format_number(number)
    millions = number / 1_000_000
    thousands = (number % 1_000_000) / 1_000
    remainder = number % 1_000

    formatted = ""
    formatted += "#{millions} " if millions > 0
    formatted += "#{thousands} " if thousands > 0
    formatted += "#{remainder}" if remainder > 0

    formatted.strip # Usunięcie spacji na początku i końcu
  end
end