# frozen_string_literal: true

class CostumeApiClient
  def self.return_json(object_id)
    response = Faraday.get "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{object_id}"
    JSON.parse(response.body)
  end

  def self.get_image_url(title_url)
    uri = URI.parse(title_url).path.sub(%r{/wiki/File:(.+)\??}, '\1')
    title = CGI.unescape(uri)
    response = Faraday.get 'https://ja.wikipedia.org/w/api.php', format: 'json', action: 'query', titles: "Image:#{title}", prop: 'imageinfo', iiprop: 'url'
    JSON.parse(response.body)
  end
end
