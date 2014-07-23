json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :title, :description, :image, :user_id
  json.url portfolio_url(portfolio, format: :json)
end
