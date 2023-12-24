# frozen_string_literal: true

require "redis"
require "connection_pool"

REDIS_POOL = ConnectionPool.new(size: 10) { Redis.new(url: ENV.fetch("REDIS_URL", ENV["REDIS_URL"])) }

# GEO_REDIS_URL 은 9번 데이터 베이스 고정
GEO_REDIS_POOL = ConnectionPool.new(size: 10) { Redis.new(url: ENV.fetch("GEO_REDIS_URL", ENV["GEO_REDIS_URL"])) }

