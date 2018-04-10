require 'pg'

class Link

  def self.all
    begin
      con = PG.connect :dbname => 'bookmark_manager', :user => 'jihinip'
      rs = con.exec "SELECT * FROM bookmarks"
      rs.map {|bookmark| bookmark['url']}
      
    rescue PG::Error => e
      puts e.message
    ensure
      con.close if con
    end
  end

end
