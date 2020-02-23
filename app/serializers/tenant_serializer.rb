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
class TenantSerializer < ActiveModel::Serializer
  attributes :id, :name, :api_key, :created_at, :updated_at
end
