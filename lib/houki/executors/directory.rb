require 'fileutils'
require 'terminal-table'
require 'highline/import'

module Houki::Executors
  class Directory
    EXCLUDED_DIRS = ['.', '..']

    def self.run(directories)
      table = Terminal::Table.new(title: 'Directories', rows: directories.combination(1).to_a)
      $stdout.puts table

      if agree('Are you sure you want to delete directories? ')
        directories.each do |directory|
          root_dirs = Dir.entries(directory).reject { |f| EXCLUDED_DIRS.include?(f) }
          FileUtils.rm_r(root_dirs.collect { |f| File.join(directory, f) })
        end
      end
    rescue Errno::ENOENT
    end
  end
end
