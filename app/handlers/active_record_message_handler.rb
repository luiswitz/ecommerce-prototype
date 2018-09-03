module Handlers
  class ActiveRecordMessageHandler
    def handle(active_record_object)
      if active_record_object.errors.any?
        error_message = active_record_object.errors.full_messages.map do |error|
          error
        end.join(', ')

        return error_message
      end

      if active_record_object.persisted?
        return "#{active_record_object.class} was saved successfully"
      end

    end
  end
end
