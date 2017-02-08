require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class TestNightReader < Minitest::Test

  def test_split_array_at_new_lines
    night_reader = NightReader.new
    
    assert_equal ["000.00", ".0.000", "..0..."], night_reader.split_array_at_new_lines("000.00\n.0.000\n..0...")
  end

  def test_scan_input
    night_reader = NightReader.new
    
    assert_equal [["00","0.","00"], [".0",".0","00"], ["..","0.",".."]], night_reader.scan_input(["000.00", ".0.000", "..0..."])
  end

  def test_zip_input
    night_reader = NightReader.new
  
    assert_equal [["00", ".0", ".."], ["0.", ".0", "0."], ["00", "00", ".."]], night_reader.zip_input([["00","0.","00"], [".0",".0","00"], ["..","0.",".."]])
  end

  def test_characters_equal_english_letter
    night_reader = NightReader.new

    assert_equal "dog", night_reader.characters_equal_english_letter([["00", ".0", ".."], ["0.", ".0", "0."], ["00", "00", ".."]])
  end

end