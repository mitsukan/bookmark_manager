feature "show all the hardcoded bookmarks" do
  scenario 'display google bookmark' do
    visit '/'
    expect(page).to have_content("http://google.com")
  end

  scenario 'display makers bookmark' do
    visit '/'
    expect(page).to have_content("http://makersacademy.com")
  end

  scenario 'display destroy all software bookmark' do
    visit '/'
    expect(page).to have_content("http://destroyallsoftware.com")
  end
end
