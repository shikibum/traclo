class AddTitleToCostumes < ActiveRecord::Migration[5.2]
  def change
    add_column :costumes, :title, :string
    add_column :costumes, :culture, :string
    add_column :costumes, :country, :string
    add_column :costumes, :region, :string
    add_column :costumes, :object_url, :string
  end
end
