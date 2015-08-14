require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('expects to see an index page with some words') do
    visit('/')
    expect(page).to have_content('Welcome to the Word List')
  end
end

describe('the path of adding a word to the word list', {:type => :feature}) do
  it('Adds a word to the word list') do
    visit('/')
    click_link('Add a word')
    fill_in('word', :with => 'Superb')
    click_button('Submit')
    expect(page).to have_content('Superb')
  end
end

describe('the path of viewing a word', {:type => :feature}) do
  it('Adds a word, then goes and views that word') do
    visit('/')
    click_link('Add a word')
    fill_in('word', :with => 'Fantastic')
    click_button('Submit')
    click_link('Fantastic')
    expect(page).to have_content('Fantastic')
  end
end

describe('the path of viewing a words definitions', {:type => :feature}) do
  it('Adds a word, then goes and views that words definitions, adds one, sees it') do
    visit('/')
    click_link('Add a word')
    fill_in('word', :with => 'NWA')
    click_button('Submit')
    click_link('NWA')
    fill_in('definition', :with => 'Gangsters')
    click_button('Submit')
    expect(page).to have_content('Gangsters')
  end
end


# describe('the path of clearing the word list', {:type => :feature}) do
#   it('adds a word, and then clears the list of words on the page') do
#     visit('/')
#     click_link('Add a word')
#     fill_in('word', :with => 'lackadaisical')
#     click_button('Submit')
#     click_link('Clear words')
#     !expect(page).to have_content('lackadaisical')
#   end
# end
