feature "comments" do

  scenario "User can see link comments below links" do
    visit '/links'
    click_on "comment-1"
    fill_in("new_comment", with: "I hate facebook!")
    expect(page).to have_content "I hate facebook!"
  end

end
