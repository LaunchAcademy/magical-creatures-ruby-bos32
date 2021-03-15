require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?

require_relative "./models/magical_creatures.rb"

set :bind, '0.0.0.0'  # bind to all interfaces

# The MAGICAL_CREATURES variable is an array of hashes, and can be accessed from an of your routes.
MAGICAL_CREATURES = [
  {
    name: "unicorn",
    ability: "Its horn is said to have the power to render poisoned water potable and heal sickness.",
    age: 140
  },
  {
    name: "dragon",
    ability: "Breathes fire and has a hide of scales that is near impenetrable.",
    age: 587
  },
  {
    name: "phoenix",
    ability: "When it is old and weary, its body ignites in flame and it arises anew from the ashes of its predecessor.",
    age: nil
  }, {
    name: "centaur"
  }
]

get "/" do
  erb :index
end

get "/creatures" do
  #this is for parts 1-4
  # @magical_creatures = MAGICAL_CREATURES
  #this is for parts 5+
  @magical_creatures = MAGICAL_CREATURES.map do |creature|
    MagicalCreatures.new(creature[:name], creature[:ability], creature[:age])
  end

  erb :creatures
end

get "/creatures/:creature_name" do
  creature_name = params[:creature_name]
  #this is for parts 5+
  MAGICAL_CREATURES.each do |creature|
    if creature[:name] == creature_name
      @creature = MagicalCreatures.new(creature[:name], creature[:ability], creature[:age])
    end
  end

  get "/creatures/unicorn" do
  end

  #this is for parts 1-4
  # MAGICAL_CREATURES.each do |creature|
  #   if creature[:name] == creature_name
  #     @creature = creature
  #   end
  # end

  erb :creature_show
end