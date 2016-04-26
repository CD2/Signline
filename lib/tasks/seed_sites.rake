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
    color: "#1B1B1B",
  )

  Site.create!(
    name: 'Shield and Protect',
    sudomain: 'shieldandprotect',
    color: '#EEC106'
  )

end