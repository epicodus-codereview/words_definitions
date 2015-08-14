require('rspec')
require('word')

describe(Word) do
  describe('#name') do
    it('returns the name of the word') do
      test_word = Word.new('Namaste')
      expect(test_word.name()).to(eq('Namaste'))
    end
  end
end
