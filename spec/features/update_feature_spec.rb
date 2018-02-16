feature "updating links" do
  scenario "User can update existing links" do
    visit '/links'
    click_on("update-1")
    fill_in("new_title", with: "youtube")
    fill_in("new_url", with: "http://www.youtube.com")
    click_button("Update")
    expect(page).not_to have_link("procrastinate with facebook", href: "http://www.facebook.com")
    expect(page).to have_link("youtube", href: "http://www.youtube.com")
  end
end
