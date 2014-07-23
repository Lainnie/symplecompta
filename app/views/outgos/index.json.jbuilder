json.array!(@outgos) do |outgo|
  json.extract! outgo, :id
  json.url outgo_url(outgo, format: :json)
end
