module OrdersHelper

  def destroy_order     
    @order = current_order
    @order.destroy if @order
    session[:order_id] = nil
  end

  def current_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    return nil
  end

  def formatted_address address
    name = address.name
    add_one = address.address_one
    add_two = address.address_two
    city = address.city
    county = address.county
    postcode = address.postcode

    content_tag(:div, name) +
    content_tag(:div, add_one) +
    content_tag(:div, add_two) +
    content_tag(:div, city) +
    content_tag(:div, county) +
    content_tag(:div, postcode)
  end

  def order_name order
    name = order.name || current_user.try(:name) || ""
  end

  def order_email order
    name = order.email || current_user.try(:email) || ""
  end

end
