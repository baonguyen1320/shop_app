# frozen_string_literal: true

require 'carrierwave'

class CkeditorAttachmentFileUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave

  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  # storage :file

  storage :fog

  def fog_public
    true
  end

  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  def remember_cache_id(new_file)
    @cache_id_was = cache_id
  end

  def delete_tmp_dir(new_file)
    # make sure we don't delete other things accidentally by checking the name pattern
    if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
      FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
    end
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "public/ckeditor/attachments/#{model.id}"
    # "uploads/ckeditor/attachments/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    Ckeditor.attachment_file_types
  end
end
