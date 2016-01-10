# TODO
# - maybe use OptionParser
# - allow to load test files via options
# - create options for app also (separate classes)

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
