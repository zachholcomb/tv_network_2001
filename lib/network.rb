class Network
  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters #I know find_all is best use case but couldn't make it work so went to each.
    main_characters_list = []
    @shows.each do |show|
      show.characters.each do |character|
         if character.salary > 500_000 && character.name == character.name.upcase
           main_characters_list << character
         end
      end
    end
    main_characters_list
  end

  def actors_by_show
    actors_by_show_hash = {}
    @shows.each do |show|
      actors_by_show_hash[show] = show.actors
    end
    actors_by_show_hash
  end

  def shows_by_actor
    shows_by_actor = {}
    @shows.each do |show|
      @characters.each do |character|
        if shows_by_actor[character.actor]
          shows_by_actor[character.actor] << show
        else
          shows_by_actor[character.actor] = show
        end
      end
      shows_by_actor
    end
  end
end
