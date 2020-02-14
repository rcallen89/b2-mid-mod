require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name } 
    it { should validate_presence_of :year } 
    it { should validate_presence_of :genre } 
  end

  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe '#actors_by_age' do
    it 'should list actors by their age' do
      studio_1 = Studio.create!(name: "Universal")
      movie_1 = Movie.create!(name: "Hobbs & Shaw", year: "2019", genre: "Action", studio: studio_1)

      actor_1 = Actor.create!(name: "Dwayne Johnson", age: "47")
      actor_2 = Actor.create!(name: "Jason Stathem", age: "52")
      actor_3 = Actor.create!(name: "Vanessa Kirby", age: "31")

      actor_movie1 = ActorMovie.create!(actor: actor_1, movie: movie_1)
      actor_movie2 = ActorMovie.create!(actor: actor_2, movie: movie_1)
      actor_movie3 = ActorMovie.create!(actor: actor_3, movie: movie_1)

      expect(movie_1.actors_by_age).to eq([actor_3, actor_1, actor_2])
    end
  end
end