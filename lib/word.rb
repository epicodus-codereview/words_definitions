class Word
  attr_reader(:name, :id, :definitions)

  @@word_list = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @definitions = []
    @id = @@word_list.length().+(1)
  end

  define_singleton_method(:view) do
    @@word_list
  end

  define_singleton_method(:clear) do
    @@word_list = []
  end

  define_singleton_method(:find) do |desired_word_id|
    found_word = nil
    Word.view().each() do |check_word|
      if
        desired_word_id.==(check_word.id())
        found_word = check_word
      end
    end
    found_word
  end

  define_method(:save) do
    @@word_list.push(self)
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

end
