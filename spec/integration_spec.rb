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
