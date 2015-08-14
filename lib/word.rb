class Word
  attr_reader(:name)

  define_method(:initialize) do |name|
    @name = name
    @definitions = []
  end


end
