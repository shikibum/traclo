class RenamePrimaryImageColumnToCostumes < ActiveRecord::Migration[5.2]
  def change
    rename_column :costumes, :primary_image, :original_image_url
  end
end
