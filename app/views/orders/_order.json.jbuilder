json.extract! order, :id, :user_id, :order_number, :total, :payment_type, :status, :shipping_fee, :tax_fee, :token_key, :created_at, :updated_at
json.url order_url(order, format: :json)
