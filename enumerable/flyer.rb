class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

puts "Frequent Flyer Customers"
puts flyers.select { |f| f.miles_flown >= 3000 }
puts "---"
puts "Need more incentives"
puts flyers.select { |f| f.miles_flown < 3000 }
puts "---"
puts "Have any flyers achieve platinum status?"
puts flyers.any? { |f| f.status == :platinum }
puts "---"
puts "First bronze status flyer to call"
puts flyers.detect { |f| f.status == :bronze }
puts "---"
platinum, others = flyers.partition { |f| f.status == :platinum }
puts "Platinum flyers"
puts platinum
puts "Others"
puts others
puts "---"
puts flyers.map { |f| "#{f.name} (#{f.status.upcase})" }
puts "---"
puts flyers.map { |f| "#{f.name} - #{f.miles_flown * 1.6} kilometers"}
puts "---"
puts "Total Miles"
puts flyers.map { |f| f.miles_flown }.reduce(:+)
puts "---"
puts "Total Kilometers"
puts flyers.map { |f| f.miles_flown * 1.6 }.reduce(:+)
puts "---"
puts "Total Kilometers for Bronze members"
puts flyers.select { |f| f.status == :bronze }.map { |f| f.miles_flown * 1.6 }.reduce(:+)
puts "---"
puts "Flyer with the Most Miles"
puts flyers.max_by { |f| f.miles_flown }.name

