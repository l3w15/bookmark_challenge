feature "Add link" do

  let(:good_link) { "http://www.friedegg.com" }
  let(:bad_link) { "http:||www.foovar.com" }

  scenario "User clicks on a button and is directed to add link form" do
    visit '/'
    click_button "Add link"
    expect(page).to have_content "Enter a new link"

  end

  scenario "User adds a link and it is added to the list" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => good_link)
    click_button "Submit link"
    expect(page).to have_link(good_link)
    expect(page).not_to have_content "not a valid link"
  end

  scenario "User gets a flash error message if the link is not a valid url" do
    visit '/'
    click_button "Add link"
    fill_in("new_link", :with => bad_link)
    click_button "Submit link"
    expect(page).to have_content "Sorry, \"#{bad_link}\" is not a valid link"
  end
end
