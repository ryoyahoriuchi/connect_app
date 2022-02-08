class Connect < ApplicationRecord
    validates :name, :email, :content, presence: true
    mount_uploader :imagetext, ImageUploader
end
