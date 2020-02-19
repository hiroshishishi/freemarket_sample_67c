class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :item
  mount_uploader :src, ImageUploader
end
