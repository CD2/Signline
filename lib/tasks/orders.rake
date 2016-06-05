task create_old_orders: :environment do

  DeliveryService.create(
      name: 'Standard',
      price: 5.00,

  )

  order_1 = Order.create!(
                     email: '-@-.com',
      same_shipping_address: true,
      delivery_service_id: 1,
                     amount: 11.00,
                     payment_method: 'PayPal',
                     purchased_at: '24/05/2016'
  )
  order_1.pending!
  b = order_1.create_billing_address!(
      name: '-',
      address_one: 'Goldstraw Farm',
      address_two: 'Pethills Lane',
      city: 'Winkhill',
      county: 'Goldstraw Farm, Pethills Lane',
      postcode: 'ST137PQ'
  )
  order_1.order_items.create!(
      quantity: 2,
      name: 'REPLACEMENT KIT FOR BRIO BARS COD 700010600000',
      unit_price: 3.00,
  )
  order_1.update_attributes!(billing_address_id: b.id)
##################################################################
  order_2 = Order.create!(
      email: '-@-.com',
      same_shipping_address: true,
      delivery_service_id: 1,
      amount: 44.99,
      payment_method: 'PayPal',
      purchased_at: '01/06/2016'
  )
  order_2.pending!
  b2 = order_2.create_billing_address!(
      name: '-',
      address_one: '94 Moorside Road',
      address_two: 'Werrington',
      city: 'Stoke On Trent',
      county: 'Staffordshire',
      postcode: 'ST9 0 JF'
  )
  order_2.order_items.create!(
      quantity: 1,
      name: 'SNOOPER TPMS SP26',
      unit_price: 39.99,
  )
  order_2.update_attributes!(billing_address_id: b2.id)
end





