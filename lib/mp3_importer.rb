require "pry"
class MP3Importer

    attr_accessor :path

    def initialize path
        @path = path
    end

    #turn the path in to an array of names
    def files 
        arr = Dir["./spec/fixtures/mp3s/**/*.mp3"]
        arr.map{|file| file.split("/")[4]}
    end

    def import
        self.files.map{|file_name| Song.new_by_filename(file_name)}
    end

end

test_music_path = "./spec/fixtures/mp3s"
music_importer = MP3Importer.new(test_music_path)

# binding.pry