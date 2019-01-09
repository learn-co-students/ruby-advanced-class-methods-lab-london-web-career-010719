require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    name_array = file_name.split(/[-.]/).collect {|x| x.strip}
    name = name_array[1]
    artist = name_array[0]
    new_song = self.new_by_name(name)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file_name)
    name_array = file_name.split(/[-.]/).collect {|x| x.strip}
    name = name_array[1]
    artist = name_array[0]
    new_song = self.create_by_name(name)
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
