module ScrewServer
  class JslintSuite

    DEFAULT_OPTIONS = {
      "bitwise" => true,
      "browser" => true,
      "eqeqeq" => true,
      "immed" => true,
      "newcap" => true,
      "nomen" => true,
      "regexp" => true,
      "undef" => true,
      "white" => true,
      "sloppy" => true,
      "vars" => true,
      "nomen" => true,
      "regexp" => true,
      "plusplus" => true,
      "indent" => true,
    }

    attr_accessor :name, :file_list, :options

    def initialize(n)
      @name = n
    end

    def file_list=(v)
      @file_list = v.map { |file| File.expand_path(file) }
    end

    def self.suites_from(file)
      @suites = []
      eval(IO.read(file), binding, file)
      @suites
    end

    def options_with_defaults
      DEFAULT_OPTIONS.merge(self.options || {})
    end

    private

    def self.jslint(name)
      suite = JslintSuite.new(name)
      yield suite
      @suites << suite
    end
  end
end
