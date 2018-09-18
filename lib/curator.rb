require "./lib/photograph"
require "./lib/artist"
require 'pry'

class Curator
  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo_params)
    photo = Photograph.new(photo_params)
    @photographs << photo
  end

  def add_artist(artist_params)
    artist = Artist.new(artist_params)
    @artists << artist
  end

  def find_artist_by_id(id)
    artist_with_id = @artists.find_all do |artist|
      artist.id == id
    end
    artist_with_id.first
  end

  def find_photograph_by_id(id)
    photograph_with_id = @photographs.find_all do |photo|
      photo.id == id
    end
    photograph_with_id.first
  end

  def find_photographs_by_artist(artist_object)
    artist_id = artist_object.id
    @photographs.find_all do |photo|
      photo.artist_id == artist_id
    end
  end

  def artists_with_multiple_photographs
    artist_id_hash = @photographs.group_by do |photo|
      photo.artist_id
    end

    artist_id_hash.map do |artist_id, photo_object_array|
      if photo_object_array.count > 1
        find_artist_by_id(artist_id)
      end
    end.compact
  end


end