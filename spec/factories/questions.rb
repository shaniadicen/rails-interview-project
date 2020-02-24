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
FactoryBot.define do
  factory :question do
    title { FFaker::HipsterIpsum.sentence.gsub(/\.$/, "?") }
    user { User.first || association(:user) }
  end
end
