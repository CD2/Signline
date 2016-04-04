task gen_pages: :environment do
  
  @signline.pages.create!(
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

  @shop.pages.create!(
    name: 'Home Page',
    url_alias: '',
    )

end

