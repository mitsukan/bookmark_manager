feature "show all the hardcoded bookmarks" do

  scenario 'display destroy all software bookmark' do
    visit '/'
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec "INSERT INTO BOOKMARKS(url) VALUES('http://test.com')"
    rs = con.exec "SELECT * FROM BOOKMARKS"
    rs.map {|bookmark| bookmark['url]']}
    expect(page).to have_content("http://test.com")
  end

end
