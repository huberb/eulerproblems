require('date')

date = DateTime.new(1901, 1, 1)
count = 0
while date < DateTime.new(2001, 1, 1)
  if date.wday == 6 and date.day == 1
    count += 1
    puts date
  end
  date += 1
end

puts count
