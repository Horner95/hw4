class AddImageUrlToEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :image_url, :string
  end
end
