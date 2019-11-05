dict = {
  "0" => "",
  "00" => "",
  "1" => "ONE",
  "2" => "TWO",
  "3" => "THREE",
  "4" => "FOUR",
  "5" => "FIVE",
  "6" => "SIX",
  "7" => "SEVEN",
  "8" => "EIGHT",
  "9" => "NINE",
  "10" => "TEN",
  "11" => "ELEVEN",
  "12" => "TWELVE",
  "13" => "THIRTEEN",
  "14" => "FOURTEEN",
  "15" => "FIFTEEN",
  "16" => "SIXTEEN",
  "17" => "SEVENTEEN",
  "18" => "EIGHTEEN",
  "19" => "NINETEEN",
  "20" => "TWENTY",
  "30" => "THIRTY",
  "40" => "FORTY",
  "50" => "FIFTY",
  "60" => "SIXTY",
  "70" => "SEVENTY",
  "80" => "EIGHTY",
  "90" => "NINETY",
  "100" => "HUNDRED",
  "1000" => "ONE THOUSAND",
}

sum = 0

(1..1000).each do |i|
  if dict[i.to_s]
    str = dict[i.to_s]
  else
    str = ""
    if i.to_s.length == 3
      hundreds = i.to_s[0]
      str += dict[hundreds] + " " + dict["100"]
    end
    if dict[i.to_s[-2..-1]]
      str += dict[i.to_s[-2..-1]]
    else
      last_digit = i.to_s[-1]
      tens = i.to_s[-2] + "0"
      str += dict[tens] + dict[last_digit]
    end
  end
  if str.include?("HUNDRED") and !str.end_with?("HUNDRED")
    str.gsub!("HUNDRED", "HUNDRED AND ")
  end
  if str == "HUNDRED"
    str = "ONE HUNDRED"
  end
  len = str.gsub(" ", "").length
  sum += len
  puts "#{str}, #{len}"
end

puts sum
