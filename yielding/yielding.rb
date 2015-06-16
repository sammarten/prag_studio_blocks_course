def three_times
	3.times { yield }
end

three_times { puts "Ho!" }

def three_times
	1.upto(3) do |n|
		yield n
	end
end

three_times do |number|
	puts "#{number} situp"
	puts "#{number} pushup"
	puts "#{number} chinup"
end

def n_times(number)
	1.upto(number) { |n| yield(n) }
end

n_times(10) do |n|
	puts "#{n} situp"
	puts "#{n} pushup"
	puts "#{n} chinup"
end

def progress
  0.step(by:10, to:100) { |n| yield(n) }
end

progress { |percent| puts percent }

