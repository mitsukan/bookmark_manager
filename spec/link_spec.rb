require 'link'

describe Link do


  describe '#self.all' do
    it 'Should return the hardcoded bookmark array' do
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'jihinip'
      con.exec "INSERT INTO bookmarks(url) VALUES('http://makersacademy.com')"
      rs = con.exec "SELECT * FROM bookmarks"
      expect(rs.map {|bookmark| bookmark['url']}).to eq ["http://makersacademy.com"]
    end
  end

end
