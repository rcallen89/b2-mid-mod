require 'rails_helper'

RSpec.describe Studio, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name } 
  end

  describe 'relationships' do
    it { should have_many :movies }
  end
end