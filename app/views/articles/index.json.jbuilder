json.array!(@articles) do |article|
  json.extract! article, :id, :content, :name, :image
  json.url article_url(article, format: :json)
end
