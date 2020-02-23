# == Schema Information
#
# Table name: tenants
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  api_key    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

describe Tenant, type: :model do
  describe "validates" do
    subject { build(:tenant) }

    it { is_expected.to validate_presence_of(:name) }
  end

  describe "callbacks" do
    it "generates api_key" do
      tenant = build(:tenant)
      tenant.save

      expect(tenant.api_key.blank?).to eq(false)
    end
  end
end
