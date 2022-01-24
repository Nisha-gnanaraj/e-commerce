json.extract! store, :id, :name, :price, :offer_price, :product_image, :description, :created_at, :updated_at
json.url store_url(store, format: :json)
