class AddContinentToCostumes < ActiveRecord::Migration[5.2]
  def change
    add_column :costumes, :continent, :string
  end
end
