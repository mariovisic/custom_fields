# encoding: utf-8
module Mongoid #:nodoc:
  module Relations #:nodoc:

    # This needs to be ovveridden to fix an issue that was 
    # breaking custom_fields for mongoid newer than 2.0rc7
    # This does introduce an issue with references_and_referenced_in_many
    # relationships but this is workable.
    class Many < Proxy

      def build(attributes = {}, type = nil, &block)
        instantiated(type).tap do |doc|
          append(doc, default_options(:binding => true))
          doc.write_attributes(attributes)
          doc.identify
          block.call(doc) if block
        end
      end

    end

  end

end
