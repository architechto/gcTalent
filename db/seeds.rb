5.times do |contact|
	Contact.create!(
		name: "contact name #{contact}",
		added_by: "sample person",
		seniority: "manager",
		type_work: "brand",
		location: "Toronto",
		specialty: "This, that, such",
		linkedin: "https://www.linkedin.com"
	)
end

puts "5 contacts created"

3.times do |specialty|
	Contact.last.specialties.create!( 
		name: "specialty #{specialty}",
		contact_id: Contact.last.id
	)
end

puts "3 technologies created"

5.times do |skill|
	Skill.create!(
		name: "skill #{skill}"
	)
end

puts "5 skills created"