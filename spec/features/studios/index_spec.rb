require 'rails_helper'

RSpec.describe 'studio index view', type: :feature do
  context 'as a user' do
    before :each do
      @studio_1 = Studio.create!(name: "Universal")
      @studio_2 = Studio.create!(name: "Disney")
    end
    
    it 'can visit the index page and see a list of all movie studios and their movies' do
      visit 'studios/'

      within "#studio-#{@studio_1.id}" do
        expect(page).to have_content("Universal")
      end

      
      within "#studio-#{@studio_2.id}" do
        expect(page).to have_content("Disney")
      end
    end

    it 'can see a list of all the movies at that studio' do
      visit 'studios/'

      movie_1 = @studio_1.movies.create!(name: "Jurassic World", year: "2015", genre: "Action")
      movie_2 = @studio_1.movies.create!(name: "Hobbs & Shaw", year: "2019", genre: "Action")
      movie_3 = @studio_2.movies.create!(name: "Guardians of the Galaxy", year: "2014", genre: "Action")
      movie_4 = @studio_2.movies.create!(name: "Thor", year: "2011", genre: "Action")

      within "#studio-#{@studio_1.id}" do
        expect(page).to have_content("Universal")
        expect(page).to have_content("Jurassic World")
        expect(page).to have_content("Hobbs & Shaw")
      end

      
      within "#studio-#{@studio_2.id}" do
        expect(page).to have_content("Disney")
        expect(page).to have_content("Guardians of the Galaxy")
        expect(page).to have_content("Thor")
      end
    end
  end
end