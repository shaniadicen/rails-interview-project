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
require "rails_helper"

describe Question, type: :model do
  describe "validations" do
    subject { build(:question) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:private) }
  end

  describe "associations" do
    subject { build(:question) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:answers) }
  end
end
