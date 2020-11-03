require 'pg'
class Bookmarks

 def self.all
   if ENV['ENVIRONMENT'] == 'test'
     p ENV['ENVIRONMENT']
     connection = PG.connect(dbname: 'bookmark_manager_test')
   else
     connection = PG.connect(dbname: 'bookmark_manager')
   end

   result = connection.exec("SELECT * FROM bookmarks;")
   result.map { |bookmark| bookmark['url'] }
 end

 def self.add(url)
   if ENV['ENVIRONMENT'] == 'test'
     p ENV['ENVIRONMENT']
     connection = PG.connect(dbname: 'bookmark_manager_test')
   else
     connection = PG.connect(dbname: 'bookmark_manager')
   end
   result = connection.exec("INSERT INTO bookmarks(url) VALUES ('#{url}');")
 end
end
