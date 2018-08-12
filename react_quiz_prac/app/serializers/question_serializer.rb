class QuestionSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :body,
    :created_at,
    :updated_at
  )

  belongs_to(:user, key: :author)
  has_many(:answers)

  # class AnswerSerializer < ActiveModel::Serializer
  #   attributes :id, :body, :created_at, :updated_at
  
  #     belongs_to(:user, key: :author)
  # end
  
end
