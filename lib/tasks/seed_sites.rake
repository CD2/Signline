task gen_sites: :environment do 
  
  @signline = Site.create!(
    name: "Signline",
    subdomain: "www",
    logo: File.open(Rails.root + 'seeds/images/signline/logo.png'),
    color: "#2F3033",
    default: true
  )
    
  @shop = Site.create!(
    name: 'Shop',
    subdomain: "shop", 
    color: "#1B1B1B",
  )

  @shield_and_protect = Site.create!(
    name: 'Shield and Protect',
    subdomain: 'shieldandprotect',
    color: '#EEC106'
    )

end