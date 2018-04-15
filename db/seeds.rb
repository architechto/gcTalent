5.times do |contact|
	Contact.create!(
		name: "contact name #{contact}",
		added_by: "sample person",
		seniority: "manager",
		type_work: "brand",
		location: "Toronto",
		linkedin: "https://www.linkedin.com"
	)
end
