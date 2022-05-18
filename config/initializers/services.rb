# config/initializers/services.rb
Services.configure do |config|
  config.logger = Services::Logger::Redis.new(Redis.new)    # see [Logging](#Logging)
  config.redis  = Redis.new                                 # optional, if `Redis.current` is defined. Otherwise it is recommended to use
                                                            # a [connection pool](https://github.com/mperham/connection_pool) here instead of simply `Redis.new`.
end
