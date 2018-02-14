feature "Add link" do
  scenario "User clicks on a button and is directed to add link form" do
    visit '/'
    click_button "Add link"
    expect(page).to have_content "Enter a new link"

  end

  scenario "User adds a link and it is added to the list" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => "http://friedegg.com")
    click_button "Submit link"
    expect(page).to have_link("http://friedegg.com")
  end
end
