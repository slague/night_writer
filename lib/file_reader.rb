class FileReader

  def open_the_file
    filename = ARGV[0]
    File.read(filename)
  end
end