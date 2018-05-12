class Contact < ApplicationRecord
	validates_presence_of :name, :seniority, :type_work, :location, :specialty, :linkedin, :added_by
	has_many :specialties
end
