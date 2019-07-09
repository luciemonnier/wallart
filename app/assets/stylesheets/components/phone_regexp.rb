def french_phone_number?(number)
  !number.match(/(\+33\s?||0)6(\s?\d{2}){4}/).nil?
end

puts french_phone_number?("0665363636")
puts french_phone_number?("06 65 36 36 36")

