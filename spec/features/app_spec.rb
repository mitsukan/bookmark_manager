feature "Homepage links for view and add" do

  scenario "Has a welcome screen" do
    visit '/'
    expect(page).to have_content("Bookmark Manager++ PRO PREMIUM v69")
  end

  scenario 'has a link for /view' do
    visit '/'
    click_button 'View Bookmarks'
    expect(page).to have_content("Saved Bookmarks")
  end

  scenario 'has a link for /add' do
    visit '/'
    click_button 'Add Bookmark'
    expect(page).to have_content("Please provide a bookmark to add:")
  end

end
