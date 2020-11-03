require './lib/bookmarks'
require 'pg'
RSpec.describe Bookmarks do
  describe '#all' do
    it 'shows a list in an array' do

      empty
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec("INSERT INTO bookmarks VALUES (1,'http://www.google.com');")
      @bookmarks = Bookmarks.all
      expect(@bookmarks).to include('http://www.google.com')
      # expect(@bookmarks).to include('http://www.makersacademy.com')
      # expect(@bookmarks).to include('http://www.destroyallsoftware.com')
    end
  end
end
