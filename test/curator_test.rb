require "minitest/autorun"
require "minitest/emoji"
require "./lib/Curator"
require "./lib/photograph"
require "./lib/artist"

class CuratorTest < Minitest::Test

  def test_it_exist
     curator = Curator.new

     assert_instance_of Curator, curator
  end

  def test_it_has_attributes
    curator = Curator.new

    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_it_can_add_photos
    curator = Curator.new

    photo_1 = {
    id: "1",
    name: "Rue Mouffetard, Paris (Boy with Bottles)",
    artist_id: "1",
    year: "1954"
              }

    photo_2 = {
    id: "2",
    name: "Moonrise, Hernandez",
    artist_id: "2",
    year: "1941"
              }

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    assert_instance_of Photograph, curator.photographs.first
    assert_equal 2, curator.photographs.count
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name

  end

  def test_it_can_add_artist
    curator = Curator.new

    artist_1 = {
    id: "1",
    name: "Henri Cartier-Bresson",
    born: "1908",
    died: "2004",
    country: "France"
    }

    artist_2 = {
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"
    }

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    assert_instance_of Artist, curator.artists.first
    assert_equal 2 , curator.artists.count
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name
  end

  def test_it_can_find_artist_by_id
    curator = Curator.new

    artist_1 = {
    id: "1",
    name: "Henri Cartier-Bresson",
    born: "1908",
    died: "2004",
    country: "France"
    }

    artist_2 = {
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"
    }

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    actual = curator.find_artist_by_id("1")
    assert_instance_of Artist, actual
    assert_equal "1", actual.id
  end

  def test_it_can_find_photograph_by_id
    curator = Curator.new

    photo_1 = {
    id: "1",
    name: "Rue Mouffetard, Paris (Boy with Bottles)",
    artist_id: "1",
    year: "1954"
              }

    photo_2 = {
    id: "2",
    name: "Moonrise, Hernandez",
    artist_id: "2",
    year: "1941"
              }

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    actual = curator.find_photograph_by_id("2")
    assert_instance_of Photograph, actual
    assert_equal "2", actual.id
  end


end
