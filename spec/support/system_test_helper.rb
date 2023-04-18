module SystemTestHelper
  def login(user)
    visit "/"
    expect(page).to have_content(user.name)
    click_link("Login")
    expect(page).to have_content("Logged in!")
  end
end
