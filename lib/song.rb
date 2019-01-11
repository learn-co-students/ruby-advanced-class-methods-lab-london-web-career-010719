require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name (name)
    song = Song.new
    song.name= name
    #@@all << song
    song
  end

  def self.create_by_name (name)
    song = Song.new
    song.name= name
    @@all << song
    song
  end

  def self.find_by_name (name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}.uniq
  end

  def self.new_from_filename (filename)
    artist_name = filename[0..filename.index("-")-2]
    song_name = filename[filename.index("-")+2..filename.index(".")-1]
    song = Song.new
    song.name= song_name
    song.artist_name= artist_name
    song
  end

  def self.create_from_filename (filename)
    artist_name = filename[0..filename.index("-")-2]
    song_name = filename[filename.index("-")+2..filename.index(".")-1]
    song = Song.new
    song.name= song_name
    song.artist_name= artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end 
end
