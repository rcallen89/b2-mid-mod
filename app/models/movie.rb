class Movie < ApplicationRecord
  validates_presence_of :name, :year, :genre

  belongs_to :studio
end