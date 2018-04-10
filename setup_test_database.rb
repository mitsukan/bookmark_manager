require 'pg'

con = PG.connect :dbname => 'bookmark_manager_test'
con.exec "TRUNCATE TABLE bookmarks;"
