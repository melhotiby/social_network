json.array!([@photo]) do |json, photo|
  json.name            	photo.photo
  json.size            	photo.photo.size
  json.current_path  		photo.photo.current_path
  json.url           		photo.photo.url
  json.thumbnail_url   	photo.photo.url(:thumb)
end
