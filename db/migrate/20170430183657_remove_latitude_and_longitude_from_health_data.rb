class RemoveLatitudeAndLongitudeFromHealthData < ActiveRecord::Migration[5.0]
  def change
    remove_column :health_data, :latitude, :float
    remove_column :health_data, :longitude, :float
  end
end
