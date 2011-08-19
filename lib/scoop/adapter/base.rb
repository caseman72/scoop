module Scoop
  module Adapter
    class Base
      include Common
      attr_accessor :last_tried

      def differ?
        return true if App.force
        return false if remote_revision == @last_tried
        @last_tried = remote_revision
        local_revision != @last_tried
      end
      alias :change? :differ?

      def local_revision
        raise "must implement for adapter"
      end
      def remote_revision
        raise "must implement for adapter"
      end
    end
  end
end
