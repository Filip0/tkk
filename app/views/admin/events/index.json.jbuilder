json.array!(@events) do |event|
  json.extract! event, :id, :title, :performer, :start_date, :end_date, :location, :price
  json.url event_url(event, format: :json)
end
