require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class TestNightReader < Minitest::Test



# def test_opens_file_and_reads_content_as_one_long_string
# end
#
# def test_segments_input_string_to_braille_letters-aka-the value in the LETTERS hash
# end
#
# def test_finds_each_value_in_LETTERS_and_replaces_with_key

  def  test_braille_to_text
    night_reader = NightReader.new
    result_1 = night_reader.braille_to_text("000.00\n.0.000\n..0...")
    assert_equal result_1, "dog"
  end




end
