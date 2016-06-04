task gen_sites: :environment do 
  
  @signline = Site.create!(
    name: "Signline",
    subdomain: "www",
    logo: File.open(Rails.root + 'seeds/images/signline/logo.png'),
    color: "#2F3033",
    default: true
  )
    
  @shop = Site.create!(
    name: 'Retail',
    subdomain: "shop", 
    color: "#B72C2C",
  )

  @shield_and_protect = Site.create!(
    name: 'Shield and Protect',
    subdomain: 'shieldandprotect',
    color: '#EEC106'
    )

  @car_and_bike = Site.create!(
    name: 'Car and Bike Accessories',
    subdomain: 'carandbike',
    color: '#44b5ca'
  )
  @electronics = Site.create!(
     name: 'Electronics',
     subdomain: 'electronics',
     color: '#007CC2'
  )

  @printing = Site.create!(
      name: 'Printing',
      subdomain: 'printing',
      color: '#BF724B'
  )

end
