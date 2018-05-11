class Contact < ApplicationRecord
	has_many :specialties
	include PgSearch
end
