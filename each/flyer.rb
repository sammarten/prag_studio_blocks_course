class Flyer
	attr_reader :name, :email, :miles_flown

	def initialize(name, email, miles_flown)
		@name = name
		@email = email
		@miles_flown = miles_flown
	end

	def to_s
		"#{name} (#{email}): #{miles_flown}"
	end
end

flyers = []
1.upto(5) do |n|
	flyers << Flyer.new("Flyer #{n}", "flyer#{n}@example.com", n * 1000)
end

flyers.each { |f| puts "#{f.name} - #{f.miles_flown} miles" }

total_miles = flyers.map { |f| f.miles_flown}.reduce(:+)
puts "Total miles flown: #{total_miles}"

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }
promotions.each { |k,v| puts "Earn #{v} miles by flying #{k}!"}

flyers.each do |f|
	promotions.each do |k,v|
		puts "#{f.name} could earn #{v * f.miles_flown} miles by flying #{k}!"
	end
end
