
# class FileReader
#
#   def read
  reader = File.open(ARGV[0], "r")

  incoming_message = reader.read


  char_count = incoming_message.length

  reader.close


  braille_text = "#{incoming_message}\n" * 3


  writer = File.open(ARGV[1], "w")

  writer.write(braille_text)

  writer.close

  p "Created '#{ARGV[1]}' containing #{char_count} characters"
#   end
# end
