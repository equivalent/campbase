
User.find_or_create_by!(name: "Vomas Talent").tap do |user|
  user.image_url = "https://www.gravatar.com/avatar/c2713a4959692f16d27d2553fb06cc4b.png?r=x&s=128"
  user.save!
end

User.find_or_create_by!(name: "Priya Patel").tap do |user|
  user.image_url = "https://ik.imagekit.io/equivalent/download.jpeg?updatedAt=1681720130243&tr=w-128,h-128"
  user.save!
end

Project.find_or_create_by!(title: "Empty Project").tap do |project|
  project.description = "Our project is to develop a web application that simplifies the property management process for real estate agents and landlords, providing an intuitive platform to track rent payments, maintenance requests, lease agreements, and other important property-related information."
  project.save!
end

Project.find_or_create_by!(title: "Project with some conversation").tap do |project|
  project.description = "Our team is building a web application that will provide real-time data analytics and insights to property investors, helping them to make informed decisions about buying, selling, and managing real estate assets based on market trends and performance"
  project.save!
  project.entries.create!(entryable: Event.create!(occasion: "project_closed"))

  project.entries.create!(entryable: Comment.create!(description: "lorem ipsum dolor sit amet"))
end
