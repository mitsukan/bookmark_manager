feature "Adds a bookmark" do

  scenario "From homepage to adding bookmark" do
    visit '/'
    click_button "Add Bookmark"
    fill_in :link, with: "http://test4.com"
    click_button "Submit"
    expect(page).to have_content("http://test4.com")
  end

  scenario "Reject invalid bookmark submission attempt" do
    visit '/'
    click_button "Add Bookmark"
    fill_in :link, with: "testgarbage"
    click_button "Submit"
    expect(page).to have_content("Invalid URL entered.")

  end

end
