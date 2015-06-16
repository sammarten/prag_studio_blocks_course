def h1
  puts "<h1>" + yield + "</h1>"
end

h1 { "Breaking News!" }

def h2
  puts "<h2>" + yield + "</h2>"
end

h2 { "Massive Ruby Discovered" }

def tag(name)
	print "<#{name}>" 
	print yield
	print "</#{name}>\n"
end

tag(:h1) { "Breaking News!" }
tag(:h2) { "Massive Ruby Discovered" }

tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end

puts "---"

def with_debugging
  puts "Starting..."
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

def with_expectation(value)
  puts "Running test..."
  if value == result = yield 
	puts "Passed." 
  else
	puts "Failed!"
	puts "Expected #{value}, but got #{result}."
  end
end

with_expectation(5) { 2 + 2 }

with_expectation("Sams") { "Sam" + "s" }

def time_it(name)
	start = Time.now
	yield
	puts "#{name} took #{Time.now - start} seconds"
end

time_it("Sleepy code") do
  # run some code
  sleep(1)
end

def time_it(name)
  elapsed_time = Benchmark.realtime do
    yield
  end
  puts "#{name} took #{elapsed_time}"
end