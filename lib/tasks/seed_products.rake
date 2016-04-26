task gen_products: :environment do 

  Dir.chdir(Rails.root + 'seeds/products')
  Dir.glob('*').each do |folder|
    next unless File.directory? folder
    seed_file = folder + '/seed.yml'
    prod_data = YAML::load_file(seed_file)
    prod_data.each do |product|
      product["images"].try!(:map!) { |image| File.open(File.join(folder + '/' + image)) }
      Product.create!(product)
    end
  end


end
