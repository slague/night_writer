require './file_reader'
require './letters'
require 'pry'

class NightWriter
  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end

  def encode_file_to_braille
    text = @reader.open_the_file
    char_count = text.length
    braille_text = encode_input_to_braille(text)



   File.write(ARGV[1], braille_text)
   p "Created '#{ARGV[1]}' containing #{char_count} characters"

  end

  def encode_input_to_braille(input)
    ready_for_translation = prepares_input_for_translation(input)
    line_1 = create_line(ready_for_translation, 0)
    line_2 = create_line(ready_for_translation, 1)
    line_3 = create_line(ready_for_translation, 2)
    "#{line_1}\n#{line_2}\n#{line_3}"
  
  end

  def prepares_input_for_translation(input)
    input.gsub("\n", "").chars
  end
    
  def create_line(ready_for_translation, position)
    new_line = ""
    ready_for_translation.each do |letter|
      braille = LETTERS.fetch(letter)
      new_line << braille[position]
      end
    new_line
  end  

end

result_1 = NightWriter.new

result_1.encode_file_to_braille