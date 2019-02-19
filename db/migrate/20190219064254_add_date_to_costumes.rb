class AddDateToCostumes < ActiveRecord::Migration[5.2]
  def change
    add_column :costumes, :date, :string
    add_column :costumes, :date_japanese, :string
  end
end
