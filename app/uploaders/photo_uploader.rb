# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :scale => [120, 120]
  end

  version :medium do
    process :scale => [nil, 540]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end
end
