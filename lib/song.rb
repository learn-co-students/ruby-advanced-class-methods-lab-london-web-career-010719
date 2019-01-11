
require 'pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def initialize(song)
    @song = song
  end



  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
      new_song = self.new(@song)
      new_song.save
      new_song
  end

  def self.new_by_name(song_name)
    @song = self.new(song_name)
    @song.name = song_name
    @song
  end

  def self.create_by_name(song_name)
    @song = self.new_by_name(song_name)
    @song.save
    @song
  end

  def self.find_by_name(song_name)
    self.all.find {|x| x.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name).nil?
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    artist_name = file_name.split(" - ")[0]
    song_name = file_name.split(" - ")[1].split(".")[0]
    song1 = self.new(song_name)
    song1.name = song_name
    song1.artist_name = artist_name
    song1
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
    new_song
  end

def self.destroy_all
  @@all.clear
end


end
