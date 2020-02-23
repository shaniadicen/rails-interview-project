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
require "rails_helper"

describe Answer, type: :model do
  describe "validations" do
    subject { build(:answer) }

    it { is_expected.to validate_presence_of(:body) }
  end

  describe "associations" do
    subject { build(:answer) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:question) }
  end
end
