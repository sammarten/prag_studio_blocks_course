scores = [83, 71, 92, 64, 98, 87, 75, 69]
puts high_scores = scores.select { |s| s > 80}
puts "---"
puts low_scores = scores.reject { |s| s > 80}
puts "---"
puts failing_scores = scores.any? { |s| s < 70 }

puts scores_double = scores.map { |s| s * 2 }

puts scores.reduce(:+)

evens, odds = scores.partition { |s| s.even? }
puts "Evens"
puts evens
puts "Odds"
puts odds