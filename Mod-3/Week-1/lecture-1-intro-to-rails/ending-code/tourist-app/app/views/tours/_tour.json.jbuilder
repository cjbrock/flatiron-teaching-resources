json.extract! tour, :id, :name, :location, :activities, :cost, :start_time, :end_time, :tour_date, :full, :created_at, :updated_at
json.url tour_url(tour, format: :json)
