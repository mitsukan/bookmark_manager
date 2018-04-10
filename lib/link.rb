require 'pg'

class Link

  def self.all
    begin
      if ENV['RSPEC'] == 'running'
        con = PG.connect :dbname => 'bookmark_manager_test'
      else
        con = PG.connect :dbname => 'bookmark_manager'
      end

      rs = con.exec "SELECT * FROM bookmarks"
      rs.map {|bookmark| bookmark['url']}
    end
  end

  def self.add(link)
    if ENV['RSPEC'] == 'running'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    con.exec "INSERT INTO BOOKMARKS(url) VALUES('#{link}')"
  end
end
