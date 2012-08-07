module ApplicationHelper

def photos(photos)
  content_tag :div, :class => "photos" do
    content_tag :ul do
      photos.collect do |photo|
        concat(content_tag(:li, image_tag(photo.photo.url(:thumb).to_s, :class => "images", :size => "120x120", :data => photo.photo.url.to_s)))
      end
    end
  end
end

end
