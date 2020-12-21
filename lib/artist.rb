require 'pry'
class Artist
    
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select do |song_instance|
            song_instance.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        find_artist = @@all.find do |artist_instance|
            artist_instance.name == name
        end
        if find_artist != nil
            find_artist
        else
            self.new(name)
        end
    end

    def print_songs
        self.songs.each do |artists_songs|
            puts artists_songs.name
        end
    end

end