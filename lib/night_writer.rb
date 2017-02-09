require_relative 'file_reader'
require_relative 'letters'
require 'pry'

class NightWriter
  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end

  def encode_file_to_braille
    text = @reader.open_the_file
    char_count = text.chomp.length
    braille_text = encode_input_to_braille(text)

   File.write(ARGV[1], braille_text)
   p "Created '#{ARGV[1]}' containing #{char_count} characters"
  end

  def encode_input_to_braille(input)
    ready_for_translation = prepares_input_for_translation(input)
    line_1 = create_line(ready_for_translation, 0)
    line_2 = create_line(ready_for_translation, 1)
    line_3 = create_line(ready_for_translation, 2)

    line_1_wrapped = wrap_text(line_1, 80)
    line_2_wrapped = wrap_text(line_2, 80)
    line_3_wrapped = wrap_text(line_3, 80)

    return formatted_braille(line_1_wrapped, line_2_wrapped, line_3_wrapped)
  end

  def formatted_braille(line1, line2, line3)
    formatted_line = ""
    counter = 0
    while counter < line1.length
      segment_1 = line1[counter]
      segment_2 = line2[counter]
      segment_3 = line3[counter]
      formatted_line << "#{segment_1}\n#{segment_2}\n#{segment_3}\n"
      counter += 1
    end
    return formatted_line
  end

  def wrap_text(line, num)
    counter = 0
    line_of_braille = []
    while counter <= line.length
      line_of_braille << line.slice(counter, num)
      counter += num
    end
    return line_of_braille
  end

  def create_line(ready_for_translation, position)
    new_line = ""
    ready_for_translation.each do |letter|
      braille = LETTERS.fetch(letter)
      new_line << braille[position]
      end
    return new_line
  end

  def prepares_input_for_translation(input)
    input.gsub("\n", "").chars
  end

end

if __FILE__==$0
result_1 = NightWriter.new
result_1.encode_file_to_braille
end
