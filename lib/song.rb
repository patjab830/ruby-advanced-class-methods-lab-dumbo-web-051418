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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find { |song| song.name == title }
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) == nil ? self.create_by_name(title) : self.find_by_name(title)
  end

  def self.alphabetical
    self.all.sort { |x, y| x.name <=> y.name }
  end

  def self.new_from_filename(filename)
    split1 = filename.split(" - ")
    split2 = split1[1].split(".")
    song = self.new_by_name(split2[0])
    song.artist_name = split1[0]
    song
  end

  def self.create_from_filename(filename)
    split1 = filename.split(" - ")
    split2 = split1[1].split(".")
    song = self.create_by_name(split2[0])
    song.artist_name = split1[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
