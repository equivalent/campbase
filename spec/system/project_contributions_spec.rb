require "rails_helper"

RSpec.describe "Contributions", type: :system do
  include SystemTestHelper

  let!(:user) { create(:user, name: "John") }
  let!(:project) { create(:project, title: "Test Project") }

  def go_to_project
    login(user)
    visit "/projects/#{project.id}"
  end

  it "should be able to see project and see comment form" do
    go_to_project
    expect(page).to have_selector("h1", text: "Test Project")
    expect(page).to have_button("Create Comment")
  end

  it "should be able to add comment to project" do
    go_to_project
    fill_in "comment_description", with: "Test comment"
    click_button "Create Comment"
    expect(page).to have_content("Test comment")
  end

  it "should be able to close and open a project" do
    go_to_project
    expect(page).not_to have_content("Project open")
    expect(page).not_to have_content("Project closed")

    click_button "Close"
    expect(page).to have_content("Project closed")
    expect(page).not_to have_content("Project open")

    click_button "Open"
    expect(page).to have_content("Project closed")
    expect(page).to have_content("Project open")
  end
end
