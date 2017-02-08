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

  def prepares_braille_input_for_english_translation(input)
    input.gsub("\n", "")
  end



end

# night_reader = NightReader.new

# night_reader.decode_file_to_english