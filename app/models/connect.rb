class Connect < ApplicationRecord
  validates :content, presence: true
  mount_uploader :imagetext, ImageUploader
  belongs_to :user
end
