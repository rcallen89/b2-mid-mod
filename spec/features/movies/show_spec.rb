require 'rails_helper'

RSpec.describe "Movie Show Page", type: :feature do
  before :each do
    @studio_1 = Studio.create!(name: "Universal")
    @movie_1 = Movie.create!(name: "Hobbs & Shaw", year: "2019", genre: "Action", studio: @studio_1)

    @actor_1 = Actor.create!(name: "Dwayne Johnson", age: "47")
    @actor_2 = Actor.create!(name: "Jason Stathem", age: "52")
    @actor_3 = Actor.create!(name: "Vanessa Kirby", age: "31")

    actor_movie1 = ActorMovie.create!(actor: @actor_1, movie: @movie_1)
    actor_movie2 = ActorMovie.create!(actor: @actor_2, movie: @movie_1)
    actor_movie3 = ActorMovie.create!(actor: @actor_3, movie: @movie_1)
  end

  it 'shows the movie name, year, genre and a list of actors by age' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content('Name: Hobbs & Shaw')
    expect(page).to have_content('Year: 2019')
    expect(page).to have_content('Genre: Action')

    within "#actors" do
      expect(page).to have_content("Vanessa Kirby\nDwayne Johnson\nJason Stathem")
    end
  end
  
end