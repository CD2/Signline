namespace :pages do 
  desc "Reprocess Images"
  task make: :environment do 

pages = {"About Us" => {
    body: "<h2>Founding</h2>
<p>SignLine began in 1993, initially Jason the proprietor worked mainly providing design and installation services to a local sign makers, once a decent retail client base was achieved Jason moved away from being mainly a trade supplier to supplying retail clients, SignLine still enjoys good relationships with trade clients and enjoys being able to supply retail clients too.
</p>
<p>We are very careful to keep the two area's separate and client confidentiality comes before increasing revenues using knowledge of our trade clients contacts, we are highly ethical, moral and believe we are one of the best sign making firms in the country providing high quality products using European Union origin materials only at very competitive prices.
</p>
<h2>Materials</h2>
<p>We pay up to six times as much for our materials than those using cheap, polluting, sub-standard Chinese and far eastern materials, yet we supply products at around the same cost to you.
</p>
<p>Savings made using sub-standard materials are often not reflected in the cost to the end user, it just makes for higher profits, but at what cost in reality. <br>
</p>
<p>Our conscience and that of our clients is clear knowing the origin of all our products is from within the European Union, to exacting standards, with full backup and support and meeting all regulations we in Europe have to meet to protect our surroundings, wildlife, habitats and environments.
</p>
<h2>Premises</h2>
<p>After manufacturing from our premises in which had minimal space for our works we moved into new premises in 2002.</p>
<p>The new premises are called Signs &amp; Print House as this relates to exactly what we do.</p>
<p>There are two floors, 1st floor is our studio area &amp; reception where we would be pleased to greet any of our customers who visit us.</p>
<p>We are also able to display on screen your requirements, make adjustments &amp; supply any samples that are required.</p>
<h2>Fitting Unit</h2>
<p>This is the ideal place for the application of graphics to vehicles ranging from motorbikes, cars, small vans to fuel tankers, box lorries and articulated lorries.
</p>
<p><img hspace='5' src='../images/uploaded_images/FittingUnit1.jpg' alt='' style='width: 175px;height: 134px;'><img width='200' hspace='5' height='132' src='../images/uploaded_images/FittingUnit2.jpg' alt=''><img width='200' hspace='5' height='134' src='../images/uploaded_images/FittingUnit3.jpg' alt=''>
</p>
<p>Unlike fitting on site we have the facility to get vehicles under cover &amp; in 
a temperature controlled environment, ensuring application at any time of the year is carried out to the film manufacturers specification for the warranty to be in place &amp; to be sure of a top notch job.
</p>
<p> This gives us and our clients a big advantage in that at any time of the year graphics can be fitted to your vehicle at the manufacturers specifications, any supplier without this facility would generally simply apply the graphics anyway, which if they do, at worst are only likely to fail, or at least have a much shorter life.
</p>
<p>We are fortunate to have an ample parking area and along with being situated in a rural setting here in South Norfolk, only a short distance from the A140 between Long Stratton and Diss making us very easy to find and visit, visiting us is a relaxed experience.
</p>"},
"Contacts" => {
  body: "something"
},
"Projects" => {
  body: "something"
},
"New" => {
  body: "something"
},
"Comapny Policy" => {
  body: "something"
},
"Materials" => {
  body: "something"
}
}

  pages.each do |k, v|
    Rails.logger.debug v
    @page = Page.create(name: k, body: v[:body], site_id: 1, published: true)
    MenuItem.create(name: @page.name, menu_type: 1, site_id: @page.site_id, page_id: @page.id)
  end

  end
end


