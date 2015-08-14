require('rspec')
require('word')
require('definition')
require('pry')

describe(Word) do
  before() do
    Word.clear()
  end


  describe('#name') do
    it('returns the name of the word') do
      test_word = Word.new(:name=>'Namaste')
      expect(test_word.name()).to(eq('Namaste'))
    end
  end

  describe('#id') do
    it('returns the id of a word') do
      test_word = Word.new(:name=>'mellifluous')
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#view') do
    it('returns the array containing all words, empty at first') do
      expect(Word.view()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word to the word_list array') do
      test_word = Word.new(:name=>'illiterate')
      test_word.save()
      expect(Word.view()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('clears the list of words in the word_list array') do
      test_word = Word.new(:name=>'burnished')
      test_word2 = Word.new(:name=>'tarnished')
      test_word.save()
      test_word2.save()
      Word.clear()
      expect(Word.view()).to(eq([]))
    end
  end

  describe('#definitions') do
    it('Returns the array of definition objects that a word object contains, empty at first') do
    test_word = Word.new(:name=>'chlorophyll')
    test_word.save()
    expect(test_word.definitions()).to(eq([]))
    end
  end

  describe('.find') do
    it('finds and returns a word object from its unique id') do
      test_word = Word.new(:name=>'arcane')
      test_word.save()
      test_word2 = Word.new(:name=>'inviolate')
      test_word2.save()
      expect(Word.find(test_word2.id())).to(eq(test_word2))
    end
  end

  describe('#add_definition') do
    it('Adds a definition object to the definitions array of a word') do
      test_definition = Definition.new(:description=>'magical')
      test_word = Word.new(:name=>'arcane')
      test_word.save()
      test_word.add_definition(test_definition)
      # binding.pry
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end
end
