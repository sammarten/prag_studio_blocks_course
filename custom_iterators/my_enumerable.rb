module MyEnumerable
  def my_map
    new_array = []
    each do |value|
      new_array << yield(value)
    end
    new_array
  end

  def my_select
    new_array = []
    each do |value|
      new_array << value if yield(value)
    end
    new_array
  end

  def my_reject
    new_array = []
    each do |value|
      new_array << value if !yield(value)
    end
    new_array
  end

  def my_detect
    each do |value|
      return value if yield(value)
    end    
  end

  def my_any?
    each do |value|
      return true if yield(value)
    end
    return false
  end

  # playlist.my_reduce(0) { |sum, song| sum + song.duration }
  def my_reduce(init_val)
    persist = init_val
    each do |value|
      persist = yield(persist, value)
    end
    persist
  end
end

class Song
  attr_reader :name, :artist, :duration
  FILE_TYPES = ["mp3", "wav", "aac"]

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def tagline
    "#{@name} - #{artist}"
  end

  def filename
    @name.gsub(" ", "-").downcase + "-" + @artist.gsub(" ", "-").downcase
  end

  def each_filename
    FILE_TYPES.each { |f| yield filename + "." + f }
  end
end

class Playlist
  include MyEnumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each { |s| yield s }
  end

  def play_songs
    each { |s| s.play }
  end

  def each_tagline
    each { |s| yield s.tagline }
  end

  def each_by_artist(artist)
    my_select { |s| s.artist == artist }.each { |s| yield s }
  end
end

song1 = Song.new("Say It Ain't So", "Weezer", 4.1)
song2 = Song.new("Shattered", "O.A.R.", 4.2)
song3 = Song.new("Gettin' It", "Too $hort", 5)

favorites = Playlist.new("Favorites")
favorites.add_song(song1)
favorites.add_song(song2)
favorites.add_song(song3)

favorites.each { |song| song.play }
favorites.play_songs

gettin = favorites.my_select { |s| s.name =~ /Gettin/ }
p gettin

total_time = favorites.my_map { |s| s.duration }.reduce(:+)
puts "Total time: #{total_time}"

favorites.each_tagline { |tagline| puts tagline }

favorites.each_by_artist("Weezer") { |song| song.play }

song1.each_filename { |filename| puts filename }
puts song1.filename

non_weezer = favorites.my_reject { |s| s.artist == "Weezer" }
p non_weezer

p favorites.my_detect { |s| s.artist == "Weezer" }

p favorites.my_any? { |s| s.artist == "Weezer" }
p favorites.my_any? { |s| s.artist == "Wheezer" }

total_duration = favorites.my_reduce(0) { |sum, song| sum + song.duration }
p total_duration
