# frozen_string_literal: true

class CreateCostumes < ActiveRecord::Migration[5.2]
  def change
    create_table :costumes do |t|
      t.integer :object_id
      t.string :primary_image
      t.string :title
      t.string :title_japanese
      t.string :culture
      t.string :culture_japanese
      t.string :country
      t.string :country_japanese
      t.string :region
      t.string :region_japanese
      t.string :object_url

      t.timestamps
    end
  end
end
