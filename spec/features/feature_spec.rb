
feature 'viewing the bookmark' do
  scenario 'view bookmark' do
    visit('/')
    expect(page).to have_content('Hello World!')
  end

  scenario 'viewing bookmarks' do
    visit('/bookmarks')
    empty
    connection = PG.connect(dbname: 'bookmark_manager_test')
    result = connection.exec("INSERT INTO bookmarks VALUES (1,'http://www.google.com');")
    expect(page).to have_content('http://www.google.com')
    # expect(page).to have_content('http://www.makersacademy.com')
    # expect(page).to have_content('http://www.destroyallsoftware.com')
  end

  scenario 'adding bookmarks' do
    visit('/bookmarks')
    empty
    click_on 'Add bookmark'
    fill_in "url", with: 'http://www.instagram.com'
    click_button 'submit'
    expect(page).to have_content('http://www.instagram.com')
  end
end
