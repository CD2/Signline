class OrderMailer < ApplicationMailer

  def notify_signline order
    @order = order
    @email = order.email
    mail to: "jason@signsandprinting.co.uk", subject: "An order has been made", from: "web@signsandprinting.co.uk"
  end

  def notify_buyer order
    @order = order
    @email = order.email
    mail to: @email, subject: "Thank you for your order", from: "jason@signsandprinting.co.uk"
  end


end
