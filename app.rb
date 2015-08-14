require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')


get('/') do
  @list = Word.view()
  erb(:index)
end

post('/') do
  @list = Word.view()
  name = params.fetch('word')
  word = Word.new(:name=>name)
  word.save()
  erb(:index)
end

get('/word/add') do
  erb(:word_add)
end

# get and post methods for index page need to have variables defined that it
# will need, such as @@word_list
