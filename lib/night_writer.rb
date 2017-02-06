class FileReader

  def open_the_file
    filename = ARGV[0]
    File.read(filename)
  end
end


class NightWriter
  attr_reader :file_reader

  def initialize
    @reader = FileReader.new
  end

  def encode_file_to_braille
    text = @reader.open_the_file
    char_count = text.length
    braille_text = encode_input_to_braille(text)

   File.write(ARGV[1], braille_text)
   p "Created '#{ARGV[1]}' containing #{char_count} characters"

  end

  def encode_input_to_braille(input)
    letters = {
      "a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], "d" => ["00",".0",".."],
      "e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], "h" => ["0.","00",".."],
      "i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], "l" => ["0.","0.","0."],
      "m" => ["00","..","0."], "n" => ["00",".0","0."], "o" => ["0.",".0","0."], "p" => ["00","0.","0."],
      "q" => ["00","00","0."], "r" => ["0.","00","0."], "s" => [".0","0.","0."], "t" => [".0","00","0."],
      "u" => ["0.","..","00"], "v" => ["0.","0.","00"], "w" => [".0","00",".0"], "x" => ["00","..","00"],
      "y" => ["00",".0","00"], "z" => ["0.",".0","00"],

      "!" => ["..","00","0."], "'" => ["..","..","0."], "," => ["..","0.",".."], "-" => ["..","..","00"],
      "." => ["..","00",".0"], "?" => ["..","0.","00"], " " => ["..","..",".."],

      "A" => ["..0.", "....", ".0.."], "B" => ["..0.", "..0.", ".0.."], "C" => ["..00", "....", ".0.."],
      "D" => ["..00", "...0", ".0.."], "E" => ["..0.", "...0", ".0.."], "F" => ["..00", "..0.", ".0.."],
      "G" => ["..00", "..00", ".0.."], "H" => ["..0.", "..00", ".0.."], "I" => ["...0", "..0.", ".0.."],
      "J" => ["...0", "..00", ".0.."], "K" => ["..0.", "....", ".00."], "L" => ["..0.", "..0.", ".00."],
      "M" => ["..00", "....", ".00."], "N" => ["..00", "...0", ".00."], "O" => ["..0.", "...0", ".00."],
      "P" => ["..00", "..0.", ".00."], "Q" => ["..00", "..00", ".00."], "R" => ["..0.", "..00", ".00."],
      "S" => ["...0", "..0.", ".00."], "T" => ["...0", "..00", ".00."], "U" => ["..0.", "....", ".000"],
      "V" => ["..0.", "..0.", ".000"], "W" => ["...0", "..00", ".0.0"], "X" => ["..00", "..0.", ".000"],
      "Y" => ["..00", "...0", ".000"], "Z" => ["..0.", "...0", ".000"]

    }

      #for capital letters, thare has to be someway to say add [.., .., .0] to each line
      #should this be a seperate file?


    input_to_letters = input.gsub("\n", "").chars
    line_1 = ""
    input_to_letters.each do |letter|
      braille = letters.fetch(letter)
      line_1.concat(braille.fetch(0))
      end

    line_2 = ""
    input_to_letters.each do |letter|
      braille = letters.fetch(letter)
      line_2.concat(braille.fetch(1))
      end

    line_3 = ""
    input_to_letters.each do |letter|
      braille = letters.fetch(letter)
      line_3.concat(braille.fetch(2))
      end

   "#{line_1}\n#{line_2}\n#{line_3}"
  end
end

practice = NightWriter.new
puts practice.encode_input_to_braille("Hello, world!")
