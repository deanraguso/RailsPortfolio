class AddPositionToFolios < ActiveRecord::Migration[6.1]
  def change
    add_column :folios, :position, :integer
  end
end
