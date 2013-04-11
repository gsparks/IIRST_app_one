class Appender

  attr_reader :code, :destination_type, :path

  def initialize(path, code, mode, erase_all)
    @path = path
    @code = code
    insert(mode, erase_all)
  end

  def insert(mode, start_over)
    File.new(@path, "w") if start_over
    if (mode == 'bottom')
      if (@path)
        File.open(@path, 'a+') { |file| file.puts @code }
      end
    elsif (mode == 'top')
      if (@path)
        newfile = File.new(@path + ".new","w")
        newfile.puts @code
        
        oldfile = File.open(@path, "r+")
        oldfile.each_line { |line| newfile.puts line}
        
        oldfile.close()
        newfile.close()
        
        File.delete(@path)
        File.rename(@path + ".new", @path)
      end
    end
  end
end
