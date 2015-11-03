require 'fileutils'

module Houki::Executors
  class Directory
    EXCLUDED_DIRS = ['.', '..']

    def self.run(paths)
      paths.each do |path|
        root_dirs = Dir.entries(path).reject { |f| EXCLUDED_DIRS.include?(f) }
        FileUtils.rm_r(root_dirs.collect { |f| File.join(path, f) })
      end
    rescue Errno::ENOENT
    end
  end
end
