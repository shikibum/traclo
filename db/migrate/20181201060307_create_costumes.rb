class CreateCostumes < ActiveRecord::Migration[5.2]
  def change
    create_table :costumes do |t|
      t.integer :objectID

      t.timestamps
    end
  end
end
