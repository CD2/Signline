task gen_pages: :environment do
  
  @signline = Site.find_by(subdomain: 'www')
  @shop = Site.find_by(subdomain: 'shop')
  @shield_and_protect = Site.find_by(subdomain: 'shieldandprotect')

  Page.destroy_all

  @signline.add_page(
    name: 'Home Page',
    banner: File.open(Rails.root + 'seeds/images/signline/home_banner.jpg'),
    body: File.open(Rails.root + 'seeds/pages/signline/home.html').read,
    layout: '',
    url_alias: '',
    )

  Page.create!(
    name: 'Privacy Policy',
    body: File.open(Rails.root + 'seeds/pages/privacy_policy.html').read,
    page_title: 'Privacy Polcy',
    url_alias: 'privacy_policy',
    global: true,
    )

  Page.create!(
    name: 'Terms and Conditions',
    body: File.open(Rails.root + 'seeds/pages/terms_and_conditions.html').read,
    page_title: 'Terms and Conditions',
    url_alias: 'terms_and_conditions',
    global: true,
    )

  @shop.add_page(
    name: 'Home Page',
    body: 'This is the shop',
    url_alias: '',
    )

  @shield_and_protect.add_page(
    name: 'Shield and Protect&#8482; paint protection film for all vehicles, boats and aircraft.',
    url_alias: '',
    body: '<p>Pre-cut kits are available for practically all motorcycles &amp; cars, contact us with the make, model and year of registration for your vehicle and we can tell you if a kit already exists.</p>
<p>In addition the film is used for motorcycle helmets, mountain bike frames, screens for items such as sat navs, mobile phones, there is no limit to the applications stopping damage from chips &amp; abrasive objects.</p>
<p>The film will stop most stone chips from stones travelling at 100mph+, the servcie life of the film under vertical outdoor exposure in the normal climate of central Europe is 7 years.</p>
<p>Kits start off at £60 for motorcycles &amp; scale up on areas protected through to cars &amp; commercial vehicles.</p>
<p>We can supply additional parts to those in any kits, for example full coverage of bonnets &amp; full wings using 1.5m wide rolls we hold in stock, prices available upon application.</p>
<p>There are variations of the film for automotive, marine &amp; aircraft use, contact us with your enquiry and we will specify the material and quote accordingly.</p>
<p>The paint protection film used in our Shield and Protect department is the only film of this type that we know of that is manufactured within the European Union, a full EU origin product and manufactured to our high standards too, we believe that no other installer of kits or manufacturer of films can make the same claim.</p>
<p>The majority of other paint protection films are made in the USA, China and the Far East, all of which are far more polluting to the environment than what we have to comply with within the European Union.</p>
<p>Shield and Protect Film is also thicker than the equivalents you may find.</p>
<p>As with all paint protection films, none are invisible depsite any claims that are made to that effect, it is a protective product, it can be seen but is not obvious to anyone who does not know there is a film on there that it has been fitted, even if you are aware the film has been fitted it is then normally only visible from within a few metres.</p>
<p>We strive for a near perfect finish, the purpose of the film is to protect the factory paintwork but we cannot apply a self adhesive film to factory paintwork and expect it to look as if no film has been fitted, although for the majority of the time you cannot see the film.</p>
<p>It is a protective product rather than a vehicle enhancement and it is always a consideration to either have exposed factory paintwork that is prone to stone chips or a film to protect the factory paintwork that isn\'t exactly the same finish as the paint, but will protect it from being damaged by stone chips.</p>
<p>Please do not polish or wash your vehicle where the film has been fitted for 7 days as this can cause the film to lift or move, this is not our liability to rectify, it takes 3-4 weeks for the film to fully cure, pressure washing or machine polishing is also to be avoided, as are abrasive polishes, do not do anything to the film until you have read the care advice for it, if you have not received this within a few days of the install please get in touch.</p>
<p>Some discolouration may be seen when any paint protection film is used on white or other very light coloured paintwork, the film could also discolour if there is a lack of care by the owner of the vehicle, to have as nice a product as possible regular washing and applying a coat of polish is essential.</p>
<p>This should be carried out every 1-2 weeks although leaving the car dirty within this period could lead to permanent discolouration, do not use road traffic film removers or other chemicals, the polish to be used must be a wax-free water-based polish.</p>'
    )

  @shield_and_protect.add_page(
    name: 'Installation',
    url_alias: 'installation',
    menu_item_name: 'Installation',
    body: '<p>Because there is no stiff topcoat to contend with, installing Nano-Fusion Protection&#8482; film is easier...</p>
<ul><li>More conformable, easier to work onto the contours of the vehicle’s surface</li>
<li>More flexible—compresses and expands easily for smooth finishing on any install</li>
<li>More tackable—the adhesive is designed to tack and hold using the alcohol solution—60/40 solution of water (60) and 70% isopropyl alcohol (40)</li>
<li>Easy release—using the soap (slip) solution—3 drops of baby shampoo in a quart of water—as needed to achieve the best install possible</li>
<li>More positionable—with the soap (slip) solution the film lifts up and can be positioned readily and as often as needed for the best fit.</li>
<li>Same Tools, Better Outcome</li></ul>
<p>You just need a soap (slip) solution and alcohol solution (see training video), squeegees and lint free towels, plus the appropriate film pattern for the vehicle. A typical install takes about an hour.</p>'
)
    @shield_and_protect.add_page(
        name: 'Materials',
        url_alias: 'materials',
        menu_item_name: 'Materials',
        body: '<p>Nano-Fusion Protection is a patent-pending film technology that makes existing topcoats obsolete.</p>
<p>A topcoat is a layer of generally stiffer material laminated to a flexible urethane film base. Current topcoats make PPFs more difficult to install and weather poorly over time. There can be separation at the boundary, causing crazing and stress cracking, which really affects the appearance.</p>
<p>Nano-Fusion Technology infuses the urethane film with clear penetrating protection. Nano-Fusion PPF is more conformable, easier to install, retains its gloss, and resists yellowing and cracking better than other films on the market.</p>
<p>The proof is provided by the best warranty in the business: Nano-Fusion Protection is backed by a 7-year warranty.</p>'
        )

    @shield_and_protect.add_page(
        name: 'Protection',
        url_alias: 'protection',
        menu_item_name: 'Protection',
        body: '<p>A warranty is a legal document and obligation binding a company financially to the performance of its products and services. Usually, certain conditions and limitations apply.</p>
        <p>To provide a warranty, a company must have confidence that its products will perform as stated.</p>
        <p>Lifetime warranty</p>
        <p>We are confident in the performance of the paint protection film featuring Nano-Fusion technology, that we are providing a LIFETIME warranty, the best in the business.</p>
        <p>Our PPF utilizing Nano-Fusion technology is warranted to be free of defects in manufacturing and workmanship for life.</p>
        <p>To arrive at this point, we conducted extensive testing which has proven to us that this PPF is the best on the market, resisting yellowing and cracking better than any other film available. The warranty protects the dealer’s customer, the dealer and you.</p>'
)



    @signline.add_page(
        name: 'About Us',
        url_alias: 'about-us',
        menu_item_name: 'About Us',
        body: '<h1>About Us</h1>
<h2>Founding</h2>
<p>SignLine began in 1993, initially Jason the proprietor worked mainly providing design and installation services to a local sign makers, once a decent retail client base was achieved Jason moved away from being mainly a trade supplier to supplying retail clients, SignLine still enjoys good relationships with trade clients and enjoys being able to supply retail clients too. </p>
<p>We are very careful to keep the two area\'s separate and client confidentiality comes before increasing revenues using knowledge of our trade clients contacts, we are highly ethical, moral and believe we are one of the best sign making firms in the country providing high quality products using European Union origin materials only at very competitive prices. </p>
<h2>Materials</h2>
<p>We pay up to six times as much for our materials than those using cheap, polluting, sub-standard Chinese and far eastern materials, yet we supply products at around the same cost to you. </p>
<p>Savings made using sub-standard materials are often not reflected in the cost to the end user, it just makes for higher profits, but at what cost in reality. <br>
</p>
<p>Our conscience and that of our clients is clear knowing the origin of all our products is from within the European Union, to exacting standards, with full backup and support and meeting all regulations we in Europe have to meet to protect our surroundings, wildlife, habitats and environments. </p>
<h2>Premises</h2>
<p>After manufacturing from our premises in which had minimal space for our works we moved into new premises in 2002.</p>
<p>The new premises are called Signs &amp; Print House as this relates to exactly what we do.</p>
<p>There are two floors, 1st floor is our studio area &amp; reception where we would be pleased to greet any of our customers who visit us.</p>
<p>We are also able to display on screen your requirements, make adjustments &amp; supply any samples that are required.</p>
<h2>Fitting Unit</h2>
<p>This is the ideal place for the application of graphics to vehicles ranging from motorbikes, cars, small vans to fuel tankers, box lorries and articulated lorries. </p>
<p>Unlike fitting on site we have the facility to get vehicles under cover &amp; in  a temperature controlled environment, ensuring application at any time of the year is carried out to the film manufacturers specification for the warranty to be in place &amp; to be sure of a top notch job. </p>
<p> This gives us and our clients a big advantage in that at any time of the year graphics can be fitted to your vehicle at the manufacturers specifications, any supplier without this facility would generally simply apply the graphics anyway, which if they do, at worst are only likely to fail, or at least have a much shorter life. </p>
<p>We are fortunate to have an ample parking area and along with being situated in a rural setting here in South Norfolk, only a short distance from the A140 between Long Stratton and Diss making us very easy to find and visit, visiting us is a relaxed experience. </p>'
        )

    @signline.add_page(
        name: 'Case Histories',
        url_alias: 'case-histories',
        menu_item_name: 'Case Histories',
        body: '<h1>Case Histories</h1>
<p>Case Histories</p>
<p>AYTON PRODUCTS</p>
<p>Brief. To manufacture &amp; fit various aluminium composite signage at Head  Office &amp; various sites around East Anglia carrying the new corporate name change from Ayton Asphalte  to Ayton Products &amp; then a further change to all signs on the logo for  Ayton Products.</p>
<p>TOUCAN TOOL HIRE</p>
<p>Brief. To produce &amp; fit new corporate style signage to all branches &amp; vehicle graphics to all vehicles.</p>'
        )

    @signline.add_page(
        name:  'Company Policy',
        url_alias: 'company-policy',
        menu_item_name:  'Company Policy',
        body: '<h1>Company Policy</h1>
<h2>Terms and Conditions </h2>
<p>STANDARD CONDITIONS</p>
<p>DEFINITIONS - In these conditions the expression \'the product\' refers to any manufactured/supplied</p>
<p>item, drawings/designs produced by SignLine for the Customer.</p>
<p>COPYRIGHT - On full payment of the final invoice Copyright of the product belongs fully to the Customer.</p>
<p>SignLine reserves the right to Copyright all drawings &amp; layouts until such time as this passes to customer</p>
<p>on full &amp; final payment of relative invoices.</p>
<p>If you do not order SignLine reserve the right to Copyright indefinately.</p>
<p>If these terms are broken SignLine will issue you an invoice for the drawings.</p>
<p>CONFIDENTIALITY - Both parties undertake to keep confidential all information which is either
designated as confidential by the disclosing party, or which is by its nature to be regarded as confidential whether written or oral, that its respective employees, agents or sub-contractors shall have obtained or received in the course of negotiations or completing the contract.</p>
<p>Disclosing prices or our designs &amp; layouts to our competitors is deemed in breach of the above.</p>
<p>FORCE MAJEURE - Neither party will be liable to the other party for any delay, or failure to perform its obligations, as a result of any cause beyond its reasonable control including, but not limited to, any industrial dispute.</p>
<p>NOTICES - Any notice, request, instruction or other document to be given hereunder shall be deliveredby hand, or sent by first class post, or emailed to the addressee\'s registered office.</p>
<p>COMPLIANCE WITH RULES AND REGULATIONS - SignLine shall ensure that when any of its obligations are performed on the Customer\'s premises, all reasonable rules and regulations in force, and made known by the Customer to SignLine, are complied with by SignLine.</p>
<p>PRICES &amp; PAYMENT - Account Holders: On confirmation, from the customer to proceed with at the agreed costings SignLine will issue an invoice shortly after delivery or fitting of the finished product for the outstanding balance. </p>
<p>Non Account holders: Where the price is a known we will issue an invoice which needs to be paid in full before commencing of works, any additional costs will be invoiced separately after completion.</p>
<p>Estimates, these are provided when we do not know what the final cost will be, an estimate is just that, a best guess, an approximation, the final cost can vary significantly, up to and including over 100%. If you wish to limit this you can with prior notification to us so we can let you know when we have reached the estimated cost and if you wish us to continue we can or we can stop at that point. All final costs are based exactly on materials and time taken to complete the job, you pay only for all the works carried out, we get paid for all the works we have carried out. This is fairer than a quote as if we quote and we take longer to complete we lose out, if we don\'t take as long to complete the client loses out, some types of work we cannot quote as we just don\'t know what the final cost will be.</p>
<p>Quotes and estimates are vaild for 30 days from the date they are given, we reserve the right to increase or decrease prices if you order after this period. The price difference a short period after this time would be minimal if any, or it could increase over months and years, i.e. some clients order 2 years after a quote or estimate was given so the price may of gone up significantly after a period of this length.</p> 
<p>Any issues with any invoices or payments must be brought to our attention within 7 working days of receipt, we will investigate any claims and reply within 7 working days, any further complaints or replies to the outcome of the investigation must be made within 7 working days, after this period we will assume the claim or query has been satisfied.</p>
<p>CANCELLATION - The Customer can cancel the contract or order at any time in writing without giving any reason or any notice period. At such a time as a written notice to cancel the contract is received by SignLine an invoice will be issued to the Customer for any work completed to date based on a reasonable hourly rate &amp; materials processed &amp; work already undertaken. Upon cancellation of the contract or order for any reason, the Customer must destroy all relating information supplied by SignLine on the product whether in written or electronic form.</p>
<p>NON-PAYMENT - In the event of non-payment by the Customer, SignLine, at its discretion, may elect to treat the contract or order as cancelled or continue the contract or leave products in place as long as it sees fit and seek continuingor final payment from the Customer until the contract or order is cancelled by the customer in accordance with these Conditions.</p>
<p>ALL GOODS REMAIN THE PROPERTY OF SignLine UNTIL PAID FOR IN FULL. WE RESERVE THE RIGHT TO REMOVE ANY PRODUCTS THAT ARE NOT PAID FOR IN FULL, STORAGE OF THOSE PRODUCTS &amp; IF REQUIRED THE RE-FITTING ONCE THE PRODUCTS HAVE BEEN PAID FOR, WHETHER VOLUNTARILY OR BY COURT ORDER.</p>
<p>NO AMENDMENTS OR ALTERATIONS TO THESE CONDITIONS SHALL BE EFFECTIVE UNLESS AGREED IN WRITING.</p>
<p>THESE CONDITIONS APPLY IN SUBSTITUTION FOR ANY PREVIOUS CONDITIONS.</p>
<p>2nd Edition, July 2002.</p><p>© 2015, SignLine, Norfolk, ENGLAND.</p>
Our designs are protected by the Copyright, Designs and Patents Act 1988, unauthorised use of this is deemed as copyright  theft under this law, we invoice a minimum of £250 and any legal fees for unauthorised use of our designs and intellectual property.'
        )

    @signline.add_page(
        name: 'Our Materials',
        url_alias: 'our-materials',
        menu_item_name: 'Our Materials',
        body: 
'<h1>Our Materials</h1>
<p>Cut graphics, vinyl lettering, are all cut from pre-coloured rolls of film, coloured throughout the film, has warranty, lovely depth of colour, individual letters cut from a roll of film, the excess or anything other than what is required is removed, this is called weeding, then covered with application paper so we can lift the graphics off the backing sheet and apply lines of text, logo\'s etc in one piece, remove the application paper at the end, done job.</p>
<p>If someone quotes or specifies to you a 5 to 7 year film, there is no such thing, if it was an honest description based on the majority of the range is 5 year, being all the colours, we would call it a 5 year film. A film range termed as 5 to 7 years actually means the colours have a 5 year warranty or estimated life, black and white have a 7 year warranty or estimated life. The higher grade although may be a longer term film than you require also means it will not shrink or lift as lower grades tend to, it will have a higher gloss finish and have no imperfections.</p>
<p>Digital printing, this is in essence a giant desktop printer but much bigger so it is operated on a stand, for vehicle graphics we print to the surface of white or transparent film, as it is a layer of ink on top of film we laminate for extra abrasion and ultra violet durability, without any laminate prints can fade quite quickly.</p>
<p>The laminate makes years of life difference to the print, we tend to recommend cut graphics for longevity but as time has gone on we have found despite what suppliers say, our laminated prints look good 7 years later, cut graphics from our film look good a decade and beyond later.</p>'
        )
  signline_pages = {"Vehicle Graphics" => {
      body: "signline/vehicle_graphics.html",
      image: "vehicle_graphics.jpg"
  },
      "Vehicle Wrapping" => {
      body: "signline/vehicle_wrapping.html",
      image: "vehicle_wrapping.jpg"
  },
      "Digital Printing" => {
      body: "signline/digital_printing.html",
      image: "digital_printing.jpg"
  },
      "Road & Safety Signs" => {
      body: "signline/road_safety_signs.html",
      image: "road_safety_signs.jpg"
  },
      "Stationary Printing" => {
      body: "signline/stationary_printing.html",
      image: "stationary_printing.jpg"
  },
      "Engraving CNC Router" => {
      body: "signline/cnc_router.html",
      image: "cnc_router.jpg"
  },
      "Banners & Flags" => {
      body: "signline/banners_and_flags.html",
      image: "banners_and_flags.jpg"
  },
      "Window Tint & Frost" => {
      body: "signline/window_tints.html",
      image: "window_tints.jpg"
  },
      "Resprays & Race Reps" => {
      body: "signline/resprays_and_race_reps.html",
      image: "resprays_and_race_reps.jpg"
  },
      "Shop & Unit Signs" => {
      body: "signline/shop_unit_signs.html",
      image: "shop_unit_signs.jpg"
  },
      "Panel Signs" => {
      body: "signline/panel_signs.html",
      image: "panel_signs.jpg"
  },
      "Screen Printing" => {
      body: "signline/screen_printing.html",
      image: "screen_printing.jpg"
  },
      "Corporate Workwear" => {
      body: "signline/corporate_workwear.html",
      image: "corporate_workwear.jpg"
  },
      "Vehicle Registration Plates" => {
      body: "signline/number_plates.html",
      image: "number_plates.jpg"
  },
      "Promotional Products" => {
      body: "signline/promotional_products.html",
      image: "promotional_products.jpg"
  },
      "Tradeshop" => {
      body: "signline/tradeshop.html",
      image: "tradeshop.jpg"
  }}
  signline_pages.each do |k, v|
    @signline.add_page(
                 name: k,
                 url_alias: k.parameterize,
                 menu_item_name: k,
                 body: File.open(File.join(Rails.root, "seed_html/#{v[:body]}")).read,
                 side: true,
                 published: true,
                 #remote_banner_url: "http://cd2dev11.co.uk/signline_seed_images/page_images#{v[:image]}"
    )
  end

  shield_and_protect_pages = {"Bike Protection" => {
      body: "shield/bikeprotection.html",
      image: "motorbike_protection_banner.jpg"
  },
      "Car Protection" => {
      body: "shield/carprotection.html",
      image: "car_protection_banner.jpg"
  }}

  shield_and_protect_pages.each do |k, v|
    @shield_and_protect.add_page(
        name: k,
        url_alias: k.parameterize,
        menu_item_name: k,
        body: File.open(File.join(Rails.root, "seed_html/#{v[:body]}")).read,
        side: true,
        published: true,
    #remote_banner_url: "http://cd2dev11.co.uk/signline_seed_images/page_images#{v[:image]}"
    )
    end

    printing_pages = {
        "Business Cards" => {
        body: "printing/business_cards.html",
        image: "business_cards_banner.jpg"
    },
        "Leaflets" => {
        body: "printing/leaflets.html",
        site_id: 2,
        menu: 1,
        image: "leaflets_banner.jpg"
    },
        "Booklets" => {
        body: "printing/booklets.html",
        site_id: 2,
        menu: 1,
        image: "booklets_banner.jpg"
    },
        "Folders" => {
        body: "printing/folders.html",
        image: "folders_banner.jpg"
    },
        "Letterheads" => {
        body: "printing/letterheads.html",
        image: "letterheads_banner.jpg"
    },
        "Postcards" => {
        body: "printing/postcards.html",
        image: "postcards_banner.jpg"
    }

    }

  printing_pages.each do |k, v|
    @printing.add_page(
        name: k,
        url_alias: k.parameterize,
        menu_item_name: k,
        body: File.open(File.join(Rails.root, "seed_html/#{v[:body]}")).read,
        side: true,
        published: true,
    #remote_banner_url: "http://cd2dev11.co.uk/signline_seed_images/page_images#{v[:image]}"
    )
  end
end
