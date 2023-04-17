Project.find_or_create_by!(title: "Project 1", description: "Description 1")
a = Project.find_or_create_by!(title: "Project 2", description: "Description 2", status: "closed")
# a.entries.create!(entryable: Event.create!(occasion: "project_closed"))
a.entries.create!(entryable: Comment.create!(description: "lorem ipsum dolor sit amet"))
