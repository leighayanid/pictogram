class AddIndexToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_index :photos, :slug
  end
end
