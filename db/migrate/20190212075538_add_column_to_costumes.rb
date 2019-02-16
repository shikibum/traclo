# frozen_string_literal: true

class AddColumnToCostumes < ActiveRecord::Migration[5.2]
  def change
    add_column :costumes, :image, :string
  end
end
