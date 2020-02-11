class Show
  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    total_show_salary = 0
    @characters.each do |character|
      total_show_salary += character.salary
    end
    total_show_salary
  end

  def highest_paid_actor
    @characters.max_by { |character| character.salary }.actor

  end

  def actors
    @characters.map { |character| character.actor }
  end
end
