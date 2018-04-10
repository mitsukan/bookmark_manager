require 'link'

describe Link do

  describe '#self.all' do

    it 'Should return the hardcoded bookmark array' do
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'jihinip'
      con.exec "INSERT INTO bookmarks(url) VALUES('http://test1.com')"
      expect(Link.all).to eq ["http://test1.com"]
    end
    
  end

  describe '#self.add(url)' do

    it 'Should be able to add a link to the bookmark' do
      Link.add("http://test2.com")
      expect(Link.all).to eq ["http://test2.com"]
    end

  end

end
