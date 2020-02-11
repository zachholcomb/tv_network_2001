require 'rspec'
require 'pry'
require 'simplecov'
SimpleCov.start
require './lib/character'
require './lib/show'
require './lib/network'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end


RSpec.describe 'tv network spec' do
  before :each do
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
    @mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    @baywatch = Show.new("Baywatch", "Gregory Bonann", [@mitch])
    @nbc = Network.new("NBC")
  end

  describe 'Iteration 1' do
    it '1. Character #new' do
      expect(Character).to respond_to(:new).with(1).argument
      expect(@kitt).to be_an_instance_of(Character)
    end

    it '2. Character #name' do
      expect(@kitt).to respond_to(:name).with(0).argument
      expect(@kitt.name).to eq("KITT")
    end

    it '3. Character #actor' do
      expect(@kitt).to respond_to(:actor).with(0).argument
      expect(@kitt.actor).to eq("William Daniels")
    end

    it '4. Character #salary' do
      expect(@kitt).to respond_to(:salary).with(0).argument
      expect(@kitt.salary).to eq(1000000)
    end
  end

  describe 'Iteration 2' do
    it '1. Show #new' do
      expect(Show).to respond_to(:new).with(3).argument
      expect(@knight_rider).to be_an_instance_of(Show)
    end

    it '2. Show #name' do
      expect(@knight_rider).to respond_to(:name).with(0).argument
      expect(@knight_rider.name).to eq("Knight Rider")
    end

    it '3. Show #creator' do
      expect(@knight_rider).to respond_to(:creator).with(0).argument
      expect(@knight_rider.creator).to eq("Glen Larson")
    end

    it '4. Show #characters' do
      expect(@knight_rider).to respond_to(:characters).with(0).argument
      expect(@knight_rider.characters).to eq([@michael_knight, @kitt])
    end

    it '5. Show #total_salary' do
      expect(@knight_rider).to respond_to(:total_salary).with(0).argument
      expect(@knight_rider.total_salary).to eq(2600000)
    end

    it '6. Show #highest_paid_actor' do
      expect(@knight_rider).to respond_to(:highest_paid_actor).with(0).argument
      expect(@knight_rider.highest_paid_actor).to eq("David Hasselhoff")
    end

    it '7. Show #actors' do
      expect(@knight_rider).to respond_to(:actors).with(0).argument
      expect(@knight_rider.actors).to eq(["David Hasselhoff", "William Daniels"])
    end
  end

  describe 'Iteration 3' do
    it '1. Network #new' do
      expect(Network).to respond_to(:new).with(1).argument
      expect(@nbc).to be_an_instance_of(Network)
    end

    it '2. Network #name' do
      expect(@nbc).to respond_to(:name).with(0).argument
      expect(@nbc.name).to eq("NBC")
    end

    it '3. Network #shows' do
      expect(@nbc).to respond_to(:shows).with(0).argument
      expect(@nbc.shows).to eq([])
    end

    it '4. Network #add_show' do
      expect(@nbc).to respond_to(:add_show).with(1).argument
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)
      expect(@nbc.shows).to eq([@knight_rider, @parks_and_rec])
    end

    it '5. Network #main_characters' do
      expect(@nbc).to respond_to(:add_show).with(1).argument
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)
      expect(@nbc.main_characters).to eq([@kitt])
    end

    it '6. Network #actors_by_show' do
      expect(@nbc).to respond_to(:add_show).with(1).argument
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)
      expect(@nbc.actors_by_show).to eq({ @knight_rider => ["David Hasselhoff", "William Daniels"], @parks_and_rec => ["Amy Poehler", "Nick Offerman"] })
    end
  end

  describe 'Iteration 4' do
    before :each do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)
      @nbc.add_show(@baywatch)
    end

    it '1. Network #shows_by_actor' do
      expect(@nbc).to respond_to(:add_show).with(1).argument
      expect(@nbc.shows_by_actor).to eq({"David Hasselhoff" => [@knight_rider, @baywatch], "William Daniels" => [@knight_rider], "Amy Poehler" => [@parks_and_rec], "Nick Offerman" => [@parks_and_rec]})
    end

    it '2. Network #prolific_actors' do
      expect(@nbc).to respond_to(:add_show).with(1).argument
      expect(@nbc.prolific_actors).to eq(["David Hasselhoff"])
    end
  end
end
