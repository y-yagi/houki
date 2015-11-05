require 'test_helper'
require 'tmpdir'

class ConfigTest < Minitest::Test
  def setup
    @cwd = Dir.pwd
  end

  def teardown
    Dir.chdir(@cwd)
  end

  def test_that_file_is_deleted
    Dir.mktmpdir do |dir|
      Dir.chdir(dir)

      FileUtils.touch('a.txt')
      FileUtils.touch('b')
      FileUtils.touch('.a')
      Dir.mkdir('directory')

      Houki::Executors::Directory.run([dir], need_agree: false)

      refute File.exists?('a.txt')
      refute File.exists?('b')
      refute File.exists?('.a')
      refute Dir.exists?('directory')
    end
  end
end
