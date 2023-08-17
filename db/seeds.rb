puts "Destroying old data..."
Company.destroy_all
Dev.destroy_all
Freebie.destroy_all

puts "Creating companies..."
Company.create(name: "Google", founding_year: 1998)
Company.create(name: "Facebook", founding_year: 2004)
Company.create(name: "Dunder Mifflin", founding_year: 2002)
Company.create(name: "Enron", founding_year: 1995)

puts "Creating devs..."
Dev.create(name: "Rick")
Dev.create(name: "Morty")
Dev.create(name: "Mr. Meseeks")
Dev.create(name: "Gazorpazop")

puts "Creating freebies..."

# ***************************************************************
# * TODO: create freebies! Remember, a freebie belongs to a dev *
# * and a freebie belongs to a company.                         *
# ***************************************************************
# Create freebies Here
# Freebie.create(item_name: "", value: , company_id: , dev_id: )
Freebie.create(item_name: "Pen", value: 2, company_id: 1, dev_id: 2)
Freebie.create(item_name: "Backpack", value: 30, company_id: 3, dev_id: 4)
Freebie.create(item_name: "Notepad", value: 5, company_id: 1, dev_id: 1)
Freebie.create(item_name: "Water Bottle", value: 8, company_id: 2, dev_id: 3)
Freebie.create(item_name: "Flashlight", value: 12, company_id: 4, dev_id: 1)

puts "Seeding done!"
