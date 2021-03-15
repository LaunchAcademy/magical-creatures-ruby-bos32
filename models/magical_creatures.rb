class MagicalCreatures
  attr_reader :name, :magic_ability, :age
  def initialize(name, magic_ability, age = nil)
    @name = name
    @magic_ability = magic_ability
    @age = age
  end

  def ancient?
    age.nil? || @age > 200
  end
end