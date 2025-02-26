require_relative 'differ_test_base'

class ExternalsTest < DifferTestBase

  def self.hex_prefix
    '7A9'
  end

  test '920',
  'default file is ExternalDiskWriter' do
    assert_equal 'ExternalDiskWriter', disk.class.name
  end

  # - - - - - - - - - - - - - - - - -

  test 'C8F',
  'default git is ExternalGitter' do
    assert_equal 'ExternalGitter', git.class.name
  end

  # - - - - - - - - - - - - - - - - -

  test '3EC',
  'default log is ExternalStdoutLogger' do
    assert_equal 'ExternalStdoutLogger', log.class.name
  end

  # - - - - - - - - - - - - - - - - -

  test '1B1',
  'default shell is ExternalSheller' do
    assert_equal 'ExternalSheller', shell.class.name
  end

end
