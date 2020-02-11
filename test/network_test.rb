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
    @mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    @baywatch = Show.new("Baywatch", "Gregory Bonann", [@mitch])
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

  def test_it_can_find_main_characters
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    assert_equal [@kitt], @nbc.main_characters
  end

  def test_it_can_sort_actor_names_by_show
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    test_hash = {
      @knight_rider => ["David Hasselhoff", "William Daniels"],
      @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
                }
    assert_equal test_hash, @nbc.actors_by_show
  end

  def test_it_can_sort_shows_by_actors
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    @nbc.add_show(@baywatch)

  test_shows_by_actor =  {
         "David Hasselhoff" => [@knight_rider, @baywatch],
         "William Daniels" => [@knight_rider],
         "Amy Poehler" => [@parks_and_rec],
         "Nick Offerman" => [@parks_and_rec]
       }

    assert_equal test_shows_by_actor, @nbc.shows_by_actor
  end

  def test_it_can_find_prolific_actors
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    @nbc.add_show(@baywatch)
    assert_equal ["David Hasselhoff"], @nbc.prolific_actor
  end

end
