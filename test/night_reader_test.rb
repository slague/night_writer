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
    ready_to_scan = night_reader.split_array_at_new_lines("000.00\n.0.000\n..0...")
    result = night_reader.scan_input(ready_to_scan)
    assert_equal [["00","0.","00"], [".0",".0","00"], ["..","0.",".."]], result
  end

  def test_zip_input
    night_reader = NightReader.new
    ready_to_scan = night_reader.split_array_at_new_lines("000.00\n.0.000\n..0...")
    scanned_input = night_reader.scan_input(ready_to_scan)
    result = night_reader.zip_input(scanned_input)
    assert_equal [["00", ".0", ".."], ["0.", ".0", "0."], ["00", "00", ".."]] , result
  end

  def test_characters_equal_english_letter
    night_reader = NightReader.new
    ready_to_scan = night_reader.split_array_at_new_lines("000.00\n.0.000\n..0...")
    scanned_input = night_reader.scan_input(ready_to_scan)
    zipped_input = night_reader.zip_input(scanned_input)
    result_1 = night_reader.characters_equal_english_letter(zipped_input)
    assert_equal "dog", result_1
  
    night_reader = NightReader.new
    ready_to_scan = night_reader.split_array_at_new_lines("0.0.0..0.0..0.0.00\n0.00.00000..00...0\n..0...0.0...0.000.")
    scanned_input = night_reader.scan_input(ready_to_scan)
    zipped_input = night_reader.zip_input(scanned_input)
    result_2 = night_reader.characters_equal_english_letter(zipped_input)
    assert_equal "brett run", result_2


  end

end