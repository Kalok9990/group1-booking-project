json.extract! booking, :id, :scaffold_controller, :description, :date_in, :date_out, :created_at, :updated_at
json.url booking_url(booking, format: :json)
