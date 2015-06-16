5.times do 
	puts "situp"
	puts "pushup"
	puts "chinup"
end

5.times do |n|
	puts "#{n} situp"
	puts "#{n} pushup"
	puts "#{n} chinup"
end

1.upto(5) do |n|
	puts "#{n} situp"
	puts "#{n} pushup"
	puts "#{n} chinup"
end

1.step(9, 2) do |n|
	puts "#{n} situp"
	puts "#{n} pushup"
	puts "#{n} chinup"
end