json.array!(@sliders) do |slider|
  json.extract! slider, :id, :title, :description, :image, :user_id
  json.url slider_url(slider, format: :json)
end
