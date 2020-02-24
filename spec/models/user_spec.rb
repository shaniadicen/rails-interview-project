# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

describe User, type: :model do
  describe "validations" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:name) }
  end

  describe "associations" do
    subject { build(:user) }

    it { is_expected.to have_many(:answers) }
    it { is_expected.to have_many(:questions) }
  end
end
