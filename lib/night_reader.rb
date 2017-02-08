require_relative 'file_reader'
require_relative 'letters'
require 'pry'

class NightReader
  attr_reader :file_reader
  
  def initialize
    @reader = FileReader.new
  end

  def decode_file_to_english
    braille = @reader.open_the_file
    char_count = braille.length
    message_text = split_array_at_new_lines(braille)

   File.write(ARGV[1], message_text)
   p "Created '#{ARGV[1]}' containing #{char_count} characters"

  end

  def split_array_at_new_lines(input)
    scan_input(input.split("\n"))
  end

  def scan_input(split_array_at_new_lines)
    scanned_braille = split_array_at_new_lines.map do |line|
      line.scan(/../)
      end
    zip_input(scanned_braille)
  end
  
  def zip_input(scanned_braille)
    zipped_input = scanned_braille[0].zip(scanned_braille[1], scanned_braille[2])
    characters_equal_english_letter(zipped_input)
  end
  
  def characters_equal_english_letter(zipped_input)
    new_line = ""
    zipped_input.each do |character|
      english = LETTERS.key(character)
      new_line << english
    end
    new_line
  end

end


if __FILE__==$0
  result_1 = NightReader.new
  result_1.decode_file_to_english
end