json.array!(@column_transforms) do |column_transform|
  json.extract! column_transform, :id
  json.url column_transform_url(column_transform, format: :json)
end
