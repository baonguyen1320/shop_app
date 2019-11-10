json.extract! user, :id, :name, :address, :address2, :city, :state, :country, :zipcode, :phone, :language, :created_at, :updated_at
json.url user_url(user, format: :json)
