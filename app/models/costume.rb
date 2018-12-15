# frozen_string_literal: true

class Costume < ApplicationRecord
  def self.import(object_id)
    response = CostumeApiClient.return_json(object_id)
    costume = Costume.new(object_id: response['objectID'], primary_image: response['primaryImage'])
    costume.save
  end
end
