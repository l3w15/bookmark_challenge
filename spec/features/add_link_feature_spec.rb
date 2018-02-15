feature "Add link" do

  let(:good_link) { double "a link and title", url: "http://www.friedegg.com",
                    title: "friedegg"}
  let(:bad_link) { "http:||www.foovar.com" }

  scenario "User clicks on a button and is directed to add link form" do
    visit '/'
    click_button "Add link"
    expect(page).to have_content "Enter a new link"

  end

  scenario "User adds a link and it is added to the list" do
    visit '/'
    click_button "Add link"
    fill_in("url", :with => good_link.url)
    fill_in("title", :with => good_link.title)
    click_button "Submit link"
    expect(page).to have_link(good_link.title)
    expect(page).not_to have_content "not a valid link"
  end

  scenario "User gets a flash error message if the link is not a valid url" do
    visit '/'
    click_button "Add link"
    fill_in("url", :with => bad_link)
    click_button "Submit link"
    expect(page).to have_content "Sorry, \"#{bad_link}\" is not a valid link"
  end
end
