namespace :sites do 
  desc "Initialise Sites and Components"
  task create: :environment do 
    @sites = {
      "Signline" => {
        url: "http://signline:3000", 
        color: "#000",
        logo: "signline_logo.png",
        banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
      "Printing Goods" => {
        url: "http://printing:3000", 
        color: "#000",
        logo: "printing_logo.png",
        banner_image: "printing_banner.jpg",
        home_body: "printing_home.html"
        }, 
      "Car and Bike Accessories" => {
        url: "http://carandbike:3000", 
        color: "#000",
        logo: "carandbike_logo.png",
                banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
      "Shield & Protect" => {
        url: "http://shieldandprotect:3000", 
        color: "#000",
        logo: "shieldandprotect_logo.png",
                banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
      "Slate Signs" => {
        url: "http://slatesigns:3000", 
        color: "#000",
        logo: "slatesigns_logo.png",
                banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
      "Outdoor Furniture" => {
        url: "http://outdoor:3000", 
        color: "#000",
        logo: "outdoor_logo.png",
        banner_image: "outdoor_banner.jpg",
        home_body: "outdoor_home.html"
        }, 
      "Animal Feed" => {
        url: "http://animalfeed:3000", 
        color: "#000",
        logo: "animalfeed_logo.png",
        banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
      "Retail" => {
        url: "http://retail:3000", 
        color: "#000",
        logo: "retail_logo.png",
        banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
      "Eduart" => {
        url: "http://eduart:3000", 
        color: "#000",
        logo: "eduart_logo.png",
        banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
      "Electronics" => {
        url: "http://electronics:3000", 
        color: "#000",
        logo: "electronics_logo.png",
        banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
    }
    @sites.each_with_index do |(k, v), i|
      i == 0 ? default_site = true : default_site = false
      @site = Site.create!(name: k, email: "web@signandprinting.co.uk", home_body: File.open(File.join(Rails.root, "seed_html/#{v[:home_body]}")).read, machine_name: k.gsub(" ", "").downcase, default_site: default_site, active:true, color: v[:color], banner_image: File.open(File.join(Rails.root, "seed_images/#{v[:banner_image]}")), logo: File.open(File.join(Rails.root, "seed_images/#{v[:logo]}")))
      Url.create!(url: v[:url], site_id: @site.id)
    end
  end
end