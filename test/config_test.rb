require 'test_helper'

class ConfigTest < Minitest::Test
  def test_that_specified_config_is_used
    options = Houki::Options.parse!(['-c', 'test/files/directory.yml'])
    config = Houki::Config.parse(options)

    expect = { 'Directory' => ['/tmp/a', '/tmp'] }
    assert_equal expect, config
  end
end
