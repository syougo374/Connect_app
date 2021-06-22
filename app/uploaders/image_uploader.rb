class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fill: [300, 300, "Center"]

  version :thumb100 do
    process resize_to_fit: [100, 100]
  end

  version :thumb150 do
    process resize_to_fit: [150, 150]
  end

  version :thumb200 do
    process resize_to_fit: [200, 200]
  end

  version :thumb250 do
    process resize_to_fit: [250, 250]
  end

  version :thumb300 do
    process resize_to_fit: [300, 300]
  end
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

 
  def extension_allowlist
    %w(jpg jpeg gif png heic)
  end

  def size_range
    0..5.megabytes
  end
end
