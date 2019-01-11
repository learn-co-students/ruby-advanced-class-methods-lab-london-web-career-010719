require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  # def initialize(name)
  #   @name = name
  # end


  def self.create
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
      new_song = self.new
      new_song.name = name
      new_song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end



  def self.find_by_name(name)
    self.all.find {|song| name == song.name}
  end


  def self.find_or_create_by_name(name)
    song = find_by_name(name)
  song ||= create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    artist_name = file_name.split(" - ")[0]
    name = file_name.split(" - ")[1].split(".")[0]
    new_song = self.new
    new_song.name = name
    new_song.artist_name = artist_name
    new_song
  end



  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @@all << song
    song

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all = []
  end


end




p "end"














 
