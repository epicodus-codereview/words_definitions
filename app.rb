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

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  description = params.fetch('definition')
  @definition = Definition.new(:description=>description)
  @word.add_definition(@definition)
  erb(:word)
end

# get('/word/clear') do
#   @word = Word.view()
#   Word.clear()
#   erb(:index)
# end

# get and post methods for index page need to have variables defined that it
# will need, such as @@word_list
