class Movie < ApplicationRecord
  belongs_to :director

  has_many :characters, dependent: :destroy

  validates :title, presence: true
  validates :director, presence: true
  validates :year, presence: true
  validates :duration, presence: true
  validates :description, presence: true


end
