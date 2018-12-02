class CostumeApiClient
  def return_json(object_id)
    response = Faraday.get "https://collectionapi.metmuseum.org/public/collection/v1/objects/#{object_id}"
    JSON.parse(response.body)
  end
end
