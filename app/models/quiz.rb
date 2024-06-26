class Quiz < ApplicationRecord
  belongs_to :course

  validates :question, presence: true
  validates :answer, presence: true
end
