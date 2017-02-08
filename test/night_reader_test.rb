require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class TestNightReader < Minitest::Test

  def test_split_array_at_new_lines
    night_reader = NightReader.new
    result = night_reader.split_array_at_new_lines("000.00\n.0.000\n..0...")
    assert_equal ["000.00", ".0.000", "..0..."], result
  end

  def test_scan_input
    night_reader = NightReader.new
    result = night_reader.scan_input(["000.00", ".0.000", "..0..."])
    assert_equal [["00","0.","00"], [".0",".0","00"], ["..","0.",".."]], result
  end

  def test_zip_input
    skip
    night_reader = NightReader.new
    result = night_reader.zip_input([["00","0.","00"], [".0",".0","00"], ["..","0.",".."]])
    assert_equal [["00", ".0", ".."], ["0.", ".0", "0."], ["00", "00", ".."]] , result
  end

  def test_characters_equal_english_letter
    skip
  end
  # def test_transform_input_string_into_array
  #   night_reader = NightReader.new
  #   result = night_reader.transform_input_string_into_array("000.00.0.000..0...")
  #   assert_equal ["000.00.0.000..0..."], result
  # end


end