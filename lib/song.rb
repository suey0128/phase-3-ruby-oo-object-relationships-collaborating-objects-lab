require "pry"
require_relative "./artist.rb"

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize name
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    #file_name formate = songname - artist - geres
    def self.new_by_filename file_name
        #break down the name and artist
        song_name = file_name.split(" - ")[1]
        artist_name = file_name.split(" - ")[0]
        #create new song
        new_song = Song.new(song_name)
        #associte new_song with the artist using the class method and assign the artsit base on the broken down artist name
        new_song.artist = Artist.find_or_create_by_name(artist_name) #will return artist instance
        new_song
    end

    def artist_name= name #name is string
        #create or find the instance in Artist class
    #    Artist.find_or_create_by_name(name) 
       #have it associate withe the song
       self.artist = Artist.find_or_create_by_name(name)
       name
    end

    
end

# file_name = 'Michael Jackson - Black or White - pop.mp3'
# new_instance = Song.new_by_filename(file_name)

# binding.pry