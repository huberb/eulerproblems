def find()
    (1..500).each do |a|
        (1..500).each do |b|
            (1..500).each do |c|
                if a*a + b*b == c*c and a + b + c == 1000
                    puts a,b,c
                    puts a*b*c
                    return
                end
            end
        end
    end
end

find
