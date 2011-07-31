module Scoop
  module Common
    def config
      App.conf
    end
    def logger
      @logger ||= Scoop[:debug] ? Logger.new($stdout) : Logger.new(config[:logfile])
    end
    def debug(str)
      logger.debug str if Scoop[:debug]
    end
    def exec(cmd)
      debug "Executing: #{cmd}"
      result = `#{cmd} 2>&1`
      debug result.chomp
      return $?.exitstatus, result
    end

    protected
    def config_file
      Scoop[:config_file] || YAML.load_file((Scoop.root + 'config/config.yml').to_s)
    end
  end
end
