json.extract! cart, :id, :token_key, :string, :email, :tag, :created_at, :updated_at
json.url cart_url(cart, format: :json)
