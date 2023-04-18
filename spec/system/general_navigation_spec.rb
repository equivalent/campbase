require "rails_helper"

RSpec.describe "General app navigation", type: :system do
  include SystemTestHelper

  let!(:user) { create(:user, name: "John") }
  let!(:project) do
    create(:project, title: "Test Project").tap do |project|
      create(:entry, entryable: create(:event, occasion: "project_closed"), project: project)
    end
  end

  describe "User navigating around the page" do
    it do
      login(user)
      expect(page).to have_content("Test Project")
      click_link("Show")

      expect(page).to have_selector("h1", text: "Test Project")
      expect(page).to have_content("Project closed")
      expect(page).to have_button("Create Comment")
    end
  end
end
