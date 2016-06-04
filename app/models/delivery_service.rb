class DeliveryService < ActiveRecord::Base

  def select_display
    "#{name} (£#{price})"
  end
end
