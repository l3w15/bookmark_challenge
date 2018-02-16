feature "viewing links" do
  scenario "User can see link titles" do
    visit '/links'
    expect(page).to have_content "procrastinate with facebook"
    expect(page).to have_content "ask google"
  end

  scenario "User can click a link title and it opens a new tab" do
    visit '/links'
    click_on "facebook"
  end

  scenario "User can click on a button to delete a link" do
    visit '/links'
    click_on "delete-1"
    expect(page).to have_content "ask google"
    expect(page).not_to have_content "facebook"
  end

end
