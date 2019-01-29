# frozen_string_literal: true

class CostumeApiClient
  def self.return_json(object_id)
    response = Faraday.get "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{object_id}"
    JSON.parse(response.body)
  end

  def self.get_image_url(title_url)
    response = Faraday.get 'https://ja.wikipedia.org/w/api.php', format: 'json', action: 'query', titles: "Image:#{title_url}", prop: 'imageinfo', iiprop: 'url'
    JSON.parse(response.body)
  end
end
