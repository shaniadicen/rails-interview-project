# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :string           not null
#  question_id :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerSerializer < ActiveModel::Serializer
  belongs_to :user, serializer: UserSerializer
  belongs_to :question, serializer: QuestionSerializer

  attributes :id, :body, :user
end
