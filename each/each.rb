cards = ["Jack", "Queen", "King", "Ace", "Joker"]
cards.each { |c| puts "#{c.upcase}"}

cards = ["Jack", "Queen", "King", "Ace", "Joker"]
cards.each { |c| puts "#{c.upcase} - #{c.length}"}

shuffled = cards.shuffle
shuffled.each { |c| puts "#{c.upcase}"}

cards.reverse_each { |c| puts "#{c.upcase}"}

scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}
scores.each do |key, value|
	puts "#{key} scored a #{value}!"
end