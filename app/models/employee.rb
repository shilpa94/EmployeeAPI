class Employee < ApplicationRecord
  mount_uploader :picture, PictureUploader

  searchable do
    text :firstname
    text :email
  end
end
