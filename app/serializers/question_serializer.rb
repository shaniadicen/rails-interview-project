# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  private    :boolean          default("f")
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class QuestionSerializer < ActiveModel::Serializer
  belongs_to :user, serializer: UserSerializer
  has_many :answers

  attributes :id, :title, :private, :created_at, :updated_at
end
