class Question < ApplicationRecord
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates(:title, presence: true, uniqueness: true)

  validates(
    :body,
    presence: {
      message: "must be given" # provide custom validation error message
    },
    length: {
      minimum: 2,
      maximum: 2048
    }
  )
end
