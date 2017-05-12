class AddLatitudeAndLongitudeToHealthDatum < ActiveRecord::Migration[5.0]
  def change
    add_column :health_data, :latitude, :float
    add_column :health_data, :longitude, :float
  end
end
