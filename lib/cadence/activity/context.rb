# This context class is available in the activity implementation
# and provides context and methods for interacting with Cadence
#
require 'cadence/uuid'
require 'cadence/activity/async_token'

module Cadence
  class Activity
    class Context
      attr_reader :metadata

      def initialize(connection, metadata)
        @connection = connection
        @metadata = metadata
        @async = false
      end

      def async
        @async = true
      end

      def async?
        @async
      end

      def async_token
        AsyncToken.encode(
          metadata.domain,
          metadata.id,
          metadata.workflow_id,
          metadata.workflow_run_id
        )
      end

      def heartbeat(details = nil)
        logger.debug('Activity heartbeat')
        connection.record_activity_task_heartbeat(task_token: task_token, details: details)
      end

      def logger
        Cadence.logger
      end

      def run_idem
        UUID.v5(metadata.workflow_run_id.to_s, metadata.id.to_s)
      end
      alias idem run_idem

      def workflow_idem
        UUID.v5(metadata.workflow_id.to_s, metadata.id.to_s)
      end

      def headers
        metadata.headers
      end

      private

      attr_reader :connection

      def task_token
        metadata.task_token
      end
    end
  end
end
