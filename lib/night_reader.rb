require './lib/file_reader'
require './lib/letters'

class NightReader
  attr_reader :file_reader
  def initialize
    @reader = FileReader.new
  end

  # def decode_file_to_english
  #   braille = @reader.open_the_file
  #   char_count = braille.length
  #   message_text = decode_input_to_english(braille)

  #  File.write(ARGV[1], message_text)
  #  p "Created '#{ARGV[1]}' containing #{char_count} characters"

  # end

  def split_array_at_new_lines(input)
    input.split("\n")
    
  end

  def scan_input(input)
    input.map do |line|
      line.scan(/../)
    end
  end
  
  # def zip_input(input)
  #   scan_input[0].zip(scan_input[1], scan_input[2])
  # end

end

# night_reader = NightReader.new

# night_reader.decode_file_to_english