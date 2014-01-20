class AddAddressToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :address, :string
  end
end
