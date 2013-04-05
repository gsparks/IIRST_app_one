class Appender

attr_reader :code, :destination_type, :path

    @directories               = Hash.new
    @directories["controller"] = "./app/controllers"
    @directories["model"]      = "./app/models"
    @directories["view"]       = "./app/views"

    def initialize(destination_type, code)
      @destination_type = destination_type
      @code             = code
      @directories[@destination_type] ? @path = @directories[@destination_type] : @path = nil
      insert()
    end

    def insert(where)
      if (@path)
        File.open(@path, where) { |file| file.puts @code }
      end
    end
end
