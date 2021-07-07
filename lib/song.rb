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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    new_song = self.find_by_name(name)
    if new_song
      new_song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_info = self.parse_filename(filename)

    song = self.create_by_name(song_info[:name])
    song.artist_name = song_info[:artist_name]

    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.parse_filename(filename)
    split_filename = filename.split("-")
    song_info = {
      artist_name: split_filename[0].strip,
      name: split_filename[1].split(".")[0].strip

    }
  end

  def self.destroy_all
    self.all.clear
  end
end
