class Course < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :quizzes, dependent: :destroy
  
    validates :title, presence: true
    validates :description, presence: true
  end
  