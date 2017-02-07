require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class TestNightWriter < Minitest::Test

  def test_it_prepares_input_for_translation
    night_writer = NightWriter.new
    result = night_writer.prepares_input_for_translation("dog")
    assert_equal ["d", "o", "g"], result 
  end

  def test_create_line
    night_writer = NightWriter.new
    ready_for_translation = night_writer.prepares_input_for_translation("dog")
    result_1 = night_writer.create_line(ready_for_translation, 0)
    result_2 = night_writer.create_line(ready_for_translation, 1)
    assert_equal result_1, "000.00"
    assert_equal result_2, ".0.000"
  end


  def test_encode_input_to_braille
    night_writer = NightWriter.new
    result_1 = night_writer.encode_input_to_braille("dog")
    assert_equal result_1, "000.00\n.0.000\n..0..."
  end

end
