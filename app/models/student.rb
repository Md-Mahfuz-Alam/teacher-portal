class Student < ApplicationRecord
  belongs_to :user
  has_many :student_details, dependent: :destroy

  validates :name, presence: true

end
