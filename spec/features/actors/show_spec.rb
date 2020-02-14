require 'rails_helper'

RSpec.describe 'Actor show page', type: :feature do
  before :each do
    @studio_1 = Studio.create!(name: "Universal")


    @actor_1 = Actor.create!(name: "Dwayne Johnson", age: "47")

    movie_1 = Movie.create!(name: "Hobbs & Shaw", year: "2019", genre: "Action", studio: @studio_1)
    movie_2 = Movie.create!(name: "The Fate of the Furious", year: "2017", genre: "Action", studio: @studio_1)

    actor_movie1 = ActorMovie.create!(actor: @actor_1, movie: movie_1)
    actor_movie2 = ActorMovie.create!(actor: @actor_1, movie: movie_2)
  end

  it 'can show name, age, and a list of their movies' do
    visit "actors/#{@actor_1.id}"

    expect(page).to have_content("Name: Dwayne Johnson")
    expect(page).to have_content("Age: 47")

    expect(page).to have_content("Hobbs & Shaw")
    expect(page).to have_content("The Fate of the Furious")

  end
end