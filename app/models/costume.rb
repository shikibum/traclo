# frozen_string_literal: true

class Costume < ApplicationRecord
  def self.import(object_id)
    costume = Costume.initialize_by_object_id(object_id)
    costume.save
  end

  def self.initialize_by_object_id(object_id)
    response = CostumeApiClient.return_json(object_id)
    Costume.new(
      object_id: response['objectID'],
      primary_image: response['primaryImage'],
      title: response['title'],
      culture: response['culture'],
      country: response['country'],
      region: response['region'],
      object_url: response['objectURL']
    )
  end

  def self.initialize_by_title_url(title_url)
    response = CostumeApiClient.get_image_url(title_url)
    Costume.new(
      primary_image: response.dig('query', 'pages', '-1', 'imageinfo')[0]['url'],
      title: response.dig('query', 'pages', '-1', 'title').delete('ファイル:'),
      object_url: response.dig('query', 'pages', '-1', 'imageinfo')[0]['descriptionurl']
    )
  end
end
