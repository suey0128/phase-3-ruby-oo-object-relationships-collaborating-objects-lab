require "pry"
# require_relative "./song.rb"

class Artist

    attr_accessor :name

    @@all=[]

    def initialize name
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song song
        song.artist = self
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def self.find_or_create_by_name name #name is string here 
        #how to tell if an artist exists? 
        # if this name exists, return arry containning that artsite, length 1
        if @@all.select{|artist| artist.name === name}.length === 1
            #find the name if the artist exists, return the instance
            @@all.select{|artist| artist.name === name}[0]
        else 
            #create a new artist if the name is not exist, return the instance
            self.new(name)
        end
    end

    def print_songs
        #use the song method above to access all the song under this artist, iterate thru the arr and puts names
        self.songs.map{|song| puts song.name}
    end




end

# artist = Artist.new('Michael Jackson')
# dirty_diana = Song.new("Dirty Diana")
# billie_jean = Song.new("Billie Jean")
# piano_man = Song.new("Piano Man")
# artist.add_song(dirty_diana)
# artist.add_song(billie_jean)

# binding.pry