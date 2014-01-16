class CreateGeoScenes < ActiveRecord::Migration
  def change
    create_table :geo_scenes do |t|

      t.timestamps
    end
  end
end
