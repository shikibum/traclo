# frozen_string_literal: true

class CreateCostumes < ActiveRecord::Migration[5.2]
  def change
    create_table :costumes do |t|
      t.integer :object_id
      t.string :primary_image

      t.timestamps
    end
  end
end
