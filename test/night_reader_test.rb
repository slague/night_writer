require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class TestNightReader < Minitest::Test

  def test_prepares_braille_input_for_english_translation
    night_reader = NightReader.new
    result = night_reader.prepares_braille_input_for_english_translation("000.00\n.0.000\n..0...")
    assert_equal "000.00.0.000..0...", result
  end





end