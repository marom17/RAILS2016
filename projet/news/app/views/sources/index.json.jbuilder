json.array!(@sources) do |source|
  json.extract! source, :id, :type, :firstname, :lastname, :name
  json.url source_url(source, format: :json)
end
