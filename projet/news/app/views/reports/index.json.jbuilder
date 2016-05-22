json.array!(@reports) do |report|
  json.extract! report, :id, :user_id, :title, :head, :text
  json.url report_url(report, format: :json)
end
