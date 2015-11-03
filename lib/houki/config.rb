require 'yaml'

module Houki
  class Config
    DEFAULT_CONFIG_FILE = "#{ENV["HOME"]}/.houki.yml"

    def self.parse(options)
      config_file = DEFAULT_CONFIG_FILE

      if options[:config_file]
        config_file = options[:config_file]
      end
      YAML.load_file(config_file)
    end
  end
end
