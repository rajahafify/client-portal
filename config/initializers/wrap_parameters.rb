# frozen_string_literal: true

ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: []
end

ActiveSupport.on_load(:active_record) do
  self.implicit_order_column = "created_at"
end
