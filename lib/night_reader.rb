require './lib/file_reader'
require './lib/letters'
require 'pry'

class NightReader
  attr_reader :file_reader
  def initialize
    @reader = FileReader.new
  end

  def decode_file_to_english
    braille = @reader.open_the_file
    char_count = braille.length
    message_text = characters_equal_english_letter(input)

   File.write(ARGV[1], message_text)
   p "Created '#{ARGV[1]}' containing #{char_count} characters"

  end

  def split_array_at_new_lines(input)
    input.split("\n")
  end

  def scan_input(ready_to_scan)
    scanned_input = ready_to_scan.map do |line|
      line.scan(/../)
    end
    scanned_input
  end
  
  def zip_input(scanned_input)
    zipped_input = scanned_input[0].zip(scanned_input[1], scanned_input[2])
    zipped_input
  end
  
  def characters_equal_english_letter(zipped_input)
    binding.pry
    new_line = ""
    zipped_input.each do |character|
      english = LETTERS.key(character)
      new_line << english
    end
    new_line
  end

end

# night_reader = NightReader.new

# night_reader.decode_file_to_english