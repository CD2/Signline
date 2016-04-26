task gen_pages: :environment do
  
  @signline = Site.find_by(subdomain: 'www')
  @shop = Site.find_by(subdomain: 'shop')
  @shield_and_protect = Site.find_by(subdomain: 'shieldandprotect')

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

end