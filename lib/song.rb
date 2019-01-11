require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

       def initialize
       end

      def self.all
        @@all
      end

      def save
        self.class.all << self
      end

      def self.create
             song = self.new
             song.save
            self.all << song
            song
            # binding.pry

      end

      def self.new_by_name(name)
        song = self.new
        song.name = name
        song
      end

      def self.create_by_name(name)
        song = self.new
        song.name = name
        song.save
        song

      end



      def self.find_by_name(name)

          @@all.find do |song|
              song.name  == name
          end
      end

      def self.find_or_create_by_name(name)

        if !self.find_by_name(name)
          self.create_by_name(name)
        end
          self.find_by_name(name)

      end

      def self.alphabetical

        @@all.sort_by {|song| song.name}.uniq

      end

      def self.new_from_filename(file_name)
          file = file_name.chomp(".mp3")
          file = file.split(" - ")
          song = self.new
          song.name = file[1]
          song.artist_name = file[0]
          song

      end

      def self.create_from_filename(file_name)
        file = file_name.chomp(".mp3")
        file = file.split(" - ")
        song = self.new
        song.name = file[1]
        song.artist_name = file[0]
        song.save
        song

      end

      def self.destroy_all

          @@all.clear

      end

end
