

require_relative './snake_case'

# - - - - - - - - - - - - - - - - - - - - - - - -
# set defauls ENV-vars for all externals
# unit-tests can set/reset these

def env_root(suffix = '')
  'DIFFER_CLASS_' + suffix
end

def env_map
  {
    env_root('LOG')   => 'ExternalStdoutLogger',
    env_root('SHELL') => 'ExternalSheller',
    env_root('GIT')   => 'ExternalGitter',
    env_root('FILE')  => 'ExternalFileWriter'
  }
end

env_map.each do |key,name|
  ENV[key] = name
  require_relative "./#{name.snake_case}"
end

# - - - - - - - - - - - - - - - - - - - - - - - -

require_relative './name_of_caller'
require_relative './unslashed'

module Externals # mix-in

  def log  ; @log   ||= external; end
  def shell; @shell ||= external; end
  def git  ; @git   ||= external; end
  def file ; @file  ||= external; end

  private

  def external
    name = env_root(name_of(caller).upcase)
    var = unslashed(ENV[name] || fail("ENV[#{name}] not set"))
    Object.const_get(var).new(self)
  end

  include NameOfCaller
  include Unslashed

end
