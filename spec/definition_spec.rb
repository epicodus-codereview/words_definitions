require('definition')
require('rspec')

describe(Definition) do
  describe('#description') do
    it('will return the definition, the description') do
      test_definition = Definition.new(:description=>'contains pigment')
      expect(test_definition.description()).to(eq('contains pigment'))
    end
  end
end
