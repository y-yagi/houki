require 'optparse'
require 'set'

module Houki::Options
  class << self
    def parse!(args)
      get_options(args)
    end

    def get_options(args)
      options = {}

      parser = OptionParser.new do |opts|
        opts.banner = "Usage: houki [options]"

        opts.separator "Configuration files:"
        opts.on "-c", "--config-file FILE", "Use specified configuration file. Default is $HOME/.houki.yml" do |file|
          options[:config_file] = File.expand_path(file)
        end
      end

      parser.parse!(args)
      options
    end
  end
end
