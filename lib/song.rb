require 'pry'
class Song
    attr_accessor :name, :artist
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        file_array = file.split(" - ")
        artist = file_array[0]
        title = file_array[1]
        new_song = self.new(title)
        new_song.artist = Artist.new(artist)
        return new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end


