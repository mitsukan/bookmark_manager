feature "Adds a bookmark" do

  scenario "From homepage to adding bookmark" do
    visit '/'
    click_button "Add Bookmark"
    fill_in :link, with: "http://test4.com"
    click_button "Submit"
    expect(page).to have_content("http://test4.com")
  end

end
