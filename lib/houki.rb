require "houki/version"
require "houki/config"
require "houki/options"
require "houki/executors/directory"

module Houki
  def self.run(options)
    config = Config.parse(options)

    if config['Directory']
      Houki::Executors::Directory.run(config['Directory'])
    end
  end
end
