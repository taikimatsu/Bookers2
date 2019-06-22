class Book < ApplicationRecord

	belongs_to :user
	validates :title, presence: true
	validates :body, length: { in: 1..199 }

end
