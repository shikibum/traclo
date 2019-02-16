# frozen_string_literal: true

class AddColumnToCostume < ActiveRecord::Migration[5.2]
  def change
    add_column :costumes, :picture, :string
  end
end
