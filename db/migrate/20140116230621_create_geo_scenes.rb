class CreateGeoScenes < ActiveRecord::Migration
  def change
    create_table :geo_scenes do |t|
      t.belongs_to :scene 
      t.belongs_to :geolocation

      t.timestamps
    end
  end
end
