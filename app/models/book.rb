class Book < ApplicationRecord
	attachment :image
	belongs_to :user
	validates :book_title, presence: true
	validates :book_body, presence: true, length: { maximum: 200 }
end
