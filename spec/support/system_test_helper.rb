module SystemTestHelper
  def login(user)
    visit "/"
    expect(page).to have_content(user.name)
    expect(page).to have_selector "#user_#{user.id}"
    within "article#user_#{user.id}" do
      click_link("Login")
    end
    expect(page).to have_content("Logged in!")
  end
end
