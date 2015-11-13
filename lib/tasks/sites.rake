namespace :sites do 
  desc "Initialise Sites and Components"
  task create: :environment do 
    @sites = {
      "Signline" => {
        url: "http://www.signsandprinting.co.uk", 
        color: "#2F3033",
        logo: "signline_logo.png",
        banner_image: "signline_banner.jpg",
        home_body: "signline_home.html"
        }, 
      "Printing Goods" => {
        url: "http://printing.signsandprinting.co.uk", 
        color: "#D30060",
        logo: "printing_logo.png",
        banner_image: "printing_banner.jpg",
        home_body: "printing_home.html"
        }, 
      "Car and Bike Accessories" => {
        url: "http://carandbike.signsandprinting.co.uk", 
        color: "#44b5ca",
        logo: "carandbike_logo.png",
          banner_image: "carandbike_banner.jpg",
        home_body: "carandbike_home.html"
        }, 
      "Shield & Protect" => {
        url: "http://shieldandprotect.signsandprinting.co.uk", 
        color: "#EEC106",
        logo: "shieldandprotect_logo.png",
                banner_image: "shieldandprotect_banner.jpg",
        home_body: "shieldandprotect_home.html"
        }, 
      #"Slate Signs" => {
      #  url: "http://slatesigns:3000", 
      #  color: "#000",
      #  logo: "slatesigns_logo.png",
      #          banner_image: "signline_banner.jpg",
      #  home_body: "slatesigns_home.html"
      #  }, 
      "Outdoor Furniture" => {
        url: "http://furniture.signsandprinting.co.uk", 
        color: "#0051ba",
        logo: "outdoor_logo.png",
        banner_image: "outdoor_banner.jpg",
        home_body: "outdoor_home.html"
        }, 
      "Animal Feed" => {
        url: "http://animalfeed.signsandprinting.co.uk", 
        color: "#B78A33",
        logo: "animalfeed_logo.png",
        banner_image: "animalfeed_banner.jpg",
        home_body: "animalfeed_home.html"
        }, 
      "Retail" => {
        url: "http://retail.signsandprinting.co.uk", 
        color: "#B73333",
        logo: "retail_logo.png",
        banner_image: "retail_banner.jpg",
        home_body: "retail_home.html"
        }, 
      "Eduart" => {
        url: "http://eduart.signsandprinting.co.uk", 
        color: "#33B757",
        logo: "eduart_logo.png",
        banner_image: "eduart_banner.jpg",
        home_body: "eduart_home.html"
        }, 
      "Electronics" => {
        url: "http://electronics.signsandprinting.co.uk", 
        color: "#007CC2",
        logo: "electronics_logo.png",
        banner_image: "electronics_banner.jpg",
        home_body: "electronics_home.html"
        }, 
    }
    @sites.each_with_index do |(k, v), i|
      if 
      i == 0 ? default_site = true : default_site = false
      @site = Site.create!(name: k, email: "web@signandprinting.co.uk", home_body: File.open(File.join(Rails.root, "seed_html/#{v[:home_body]}")).read, machine_name: k.gsub(" ", "").downcase, default_site: default_site, active:true, color: v[:color], banner_image: File.open(File.join(Rails.root, "seed_images/#{v[:banner_image]}")), logo: File.open(File.join(Rails.root, "seed_images/#{v[:logo]}")))
      Url.create!(url: v[:url], site_id: @site.id)
    end
  end
end