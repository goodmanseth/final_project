class AddProviderCityToHealthData < ActiveRecord::Migration[5.0]
  def change
    add_column :health_data, :provider_city, :string
  end
end
