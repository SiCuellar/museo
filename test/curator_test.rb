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

  def test_it_can_find_photo_by_artist
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
    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
     id: "4",
     name: "Child with Toy Hand Grenade in Central Park",
     artist_id: "3",
     year: "1962"
    }

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
    artist_3 = {
     id: "3",
     name: "Diane Arbus",
     born: "1923",
     died: "1971",
     country: "United States"
    }

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    diane_arbus = curator.find_artist_by_id("3")
    actual = curator.find_photographs_by_artist(diane_arbus)

    assert_equal 2, actual.count
    assert_equal "Identical Twins, Roselle, New Jersey", actual.first.name
  end

  def test_it_returns_artist_with_multiple_photograhs
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
    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
     id: "4",
     name: "Child with Toy Hand Grenade in Central Park",
     artist_id: "3",
     year: "1962"
    }

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
    artist_3 = {
     id: "3",
     name: "Diane Arbus",
     born: "1923",
     died: "1971",
     country: "United States"
    }

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    actual = curator.artists_with_multiple_photographs
    assert_instance_of Array, actual
    assert_equal 1, actual.count
    assert_equal "Diane Arbus", actual.first.name
    assert_equal "1923", actual.first.born
  end

end