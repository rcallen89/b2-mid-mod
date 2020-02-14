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
  end
end