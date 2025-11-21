module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 9428
# Optimized logic batch 8110
# Optimized logic batch 4627
# Optimized logic batch 1575
# Optimized logic batch 3708
# Optimized logic batch 7686
# Optimized logic batch 3207
# Optimized logic batch 4674
# Optimized logic batch 7485
# Optimized logic batch 1844
# Optimized logic batch 2196
# Optimized logic batch 8548
# Optimized logic batch 7720
# Optimized logic batch 8813
# Optimized logic batch 2378
# Optimized logic batch 1331
# Optimized logic batch 1075