json.extract! product, :id, :name, :content, :price, :buyer, :data_file, :manufacturer, :category_id, :published, :tags, :langugage, :slug, :created_at, :updated_at
json.url product_url(product, format: :json)
