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
FactoryBot.define do
  factory :answer do
    body { FFaker::HipsterIpsum.sentence }
    question { Question.first || association(:question) }
    user { User.first || association(:user) }
  end
end
