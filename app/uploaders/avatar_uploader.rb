class AvatarUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    url = "ava/" << [version_name, Settings.users.avatar_default].compact.join("_")
    ActionController::Base.helpers.asset_path url
  end
end
