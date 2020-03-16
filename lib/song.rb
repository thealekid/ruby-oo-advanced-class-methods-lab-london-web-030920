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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
    #the argument is what will be invoked in the actual code. 
    #hence why it needs to be called. 
    #self.all is the method that invokes the entire list of songs.
    #|song| are block parameters...it's the location where the search will occur.
    #song_name == song_name is what you're asking it to search against. 
  end
  
  def self.find_or_create_by_name(name)
    # self.find_by_name(name) || self.create_by_name(name)
    # above is a quicker (mathemically brained) method to achieve this but less intuitive for me. 
    song = self.find_by_name(name)
      if song
      song
      else
        self.create_by_name(name)
      end
  end
  
  def self.alphabetical
  @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename) 
    
    song_file = filename.split(/\b\s[-]\s|.mp3/)
    
    new_song = self.create
    
    new_song.artist_name = song_file[0]
    
    new_song.name = song_file[1]
    
    new_song
  end
  
         
  

  def self.create_from_filename(filename)

    song_file = filename.split(/\b\s[-]\s|.mp3/)
    
    new_song = self.create
    
    new_song.artist_name = song_file[0]
    
    new_song.name = song_file[1]
    
    new_song
    
  end
  
  def self.destroy_all
    self.all.clear
  end
  

end