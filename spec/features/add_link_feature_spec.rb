feature "Add link" do

  let(:good_link) { double "a link and title", url: "http://www.friedegg.com",
                    title: "friedegg" }
  let(:bad_url) { "http:||www.foovar.com" }
  let(:apostrophe_link_title) { double "a link and title with apostrophe",
        url: "http://www.facebook.com", title: "don't use facebook" }

  scenario "User clicks on a button and is directed to add link form" do
    visit '/links'
    click_button "Add link"
    expect(page).to have_content "Enter a new link"

  end

  scenario "User adds a link and it is added to the list" do
    visit '/links'
    click_button "Add link"
    fill_in("url", :with => good_link.url)
    fill_in("title", :with => good_link.title)
    click_button "Submit link"
    expect(page).to have_link(good_link.title)
    expect(page).not_to have_content "not a valid link"
  end

  scenario "User gets a flash error message if the link is not a valid url" do
    visit '/links'
    click_button "Add link"
    fill_in("url", :with => bad_url)
    click_button "Submit link"
    expect(page).to have_content "Sorry, \"#{bad_url}\" is not a valid link"
  end

  # scenario "It allows a user to use apostrophes in a title" do
  #   visit '/'
  #   click_button "Add link"
  #   fill_in("url", :with => apostrophe_link_title.url)
  #   fill_in("title", :with => apostrophe_link_title.title)
  #   click_button "Submit link"
  #   expect(page).to have_link(apostrophe_link_title.title)
  #   expect(page).not_to have_content "not a valid link"
  # end
end
