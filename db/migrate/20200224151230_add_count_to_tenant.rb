class AddCountToTenant < ActiveRecord::Migration[5.2]
  def change
    add_column :tenants, :api_count, :integer, default: 0
  end
end
