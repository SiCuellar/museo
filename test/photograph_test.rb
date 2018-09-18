require "minitest/autorun"
require "minitest/emoji"
require "./lib/photograph"

class PhotographTest < Minitest::Test
  def setup
    @p = Photograph.new({
    id: "1",
    name: "Rue Mouffetard, Paris (Boy with Bottles)",
    artist_id: "4",
    year: "1954"})
  end

  def test_it_exist
    assert_instance_of Photograph, @p
  end

  def test_it_has_attributes
    assert_equal "1", @p.id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @p.name
    assert_equal "4", @p.artist_id
    assert_equal "1954", @p.year
  end
end
