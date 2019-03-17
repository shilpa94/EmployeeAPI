class Employee < ApplicationRecord
  mount_uploader :picture, PictureUploader

  has_many :leave_requests

  validates :email,  uniqueness: { message: "already exists" }
  validates :employee_id, uniqueness: { message: "already exists" }

  searchable do
    text :firstname
    text :email
    text :gender
    # string :firstname
    # string :email
    # string :gender
  end
end
