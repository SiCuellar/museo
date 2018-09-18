require "minitest/autorun"
require "minitest/emoji"
require "./lib/photograph"
require "./lib/artist"

class ArtistTest < Minitest::Test
  def setup
    @a = Artist.new({
    id: "2",
    name: "Ansel Adams",
    born: "1902",
    died: "1984",
    country: "United States"
                      })
  end

  def test_it_exist
    assert_instance_of Artist, @a
  end

end
