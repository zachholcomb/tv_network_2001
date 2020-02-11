require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < Minitest::Test
  def setup
    @nbc = Network.new("NBC")
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])

  end

  def test_it_exists_and_has_attributes
    assert_instance_of Network, @nbc
    assert_equal "NBC", @nbc.name
  end

  def test_it_starts_with_no_shows
    assert_equal [], @nbc.shows
  end

  def test_it_can_add_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

end




#
# pry(main)>
#
# pry(main)>
#
# pry(main)> nbc.shows
# # => [#<Show:0x00007fe5f8398970...>, #<Show:0x00007fe5f88b0a20...>]
#
# pry(main)> nbc.main_characters
# # => [#<Character:0x00007f98a4ba8dc8...>]
#
# pry(main)> nbc.actors_by_show
# # => {
#       #<Show:0x00007fe5f8398970...> => ["David Hasselhoff", "William Daniels"],
#       #<Show:0x00007fe5f88b0a20...> => ["Amy Poehler", "Nick Offerman"]
# #    }
