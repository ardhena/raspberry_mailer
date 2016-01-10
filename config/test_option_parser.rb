module Config
  class TestOptionParser
    attr_reader :args

    def initialize(args)
      @args = args
    end

    def quick
      return true if args.include?('-q') || args.include?('--quick')
      false
    end
  end
end
