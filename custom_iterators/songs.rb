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

song1 = Song.new("Say It Ain't So", "Weezer", 4.1)
song2 = Song.new("Shattered", "O.A.R.", 4.2)
song3 = Song.new("Gettin' It", "Too $hort", 5)

class Playlist
  include Enumerable

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
  	select { |s| s.artist == artist }.each { |s| yield s }
  end
end

favorites = Playlist.new("Favorites")
favorites.add_song(song1)
favorites.add_song(song2)
favorites.add_song(song3)

favorites.each { |song| song.play }
favorites.play_songs

gettin = favorites.select { |s| s.name =~ /Gettin/ }
p gettin

total_time = favorites.map { |s| s.duration }.reduce(:+)
puts "Total time: #{total_time}"

favorites.each_tagline { |tagline| puts tagline }

favorites.each_by_artist("Weezer") { |song| song.play }

song1.each_filename { |filename| puts filename }
puts song1.filename