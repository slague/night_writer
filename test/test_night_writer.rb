require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class FileReaderTest < Minitest::Test
   def test_it_opens_the_file
   end
end


class TestNightWriter < Minitest::Test

  def test_encode_file_to_braille
#something goes here
  end

  def test_encode_input_to_braille
    practice = NightWriter.new
    assert_equal
      practice.encode_input_to_braille("Hello, world!") ,
      "..0.0.0.0.0......00.0.0.00..
       ..00.00.0..00...00.0000..000
       .0....0.0.0......00.0.0...0."
  end

end
