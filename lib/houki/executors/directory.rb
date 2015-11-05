require 'fileutils'
require 'terminal-table'
require 'highline/import'

module Houki::Executors
  class Directory
    EXCLUDED_DIRS = ['.', '..']

    def self.run(directories, need_agree: true)
      table = Terminal::Table.new(title: 'Directories', rows: directories.combination(1).to_a)
      $stdout.puts table

      return if need_agree && !agree('Are you sure you want to delete directories? ')

      directories.each do |directory|
        root_dirs = Dir.entries(directory).reject { |f| EXCLUDED_DIRS.include?(f) }
        FileUtils.rm_r(root_dirs.collect { |f| File.join(directory, f) })
      end

      $stdout.puts 'Removed the files under the directories'
    end
  end
end
