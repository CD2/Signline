namespace :images do 
  desc "Reprocess Images"
  task product_images: :environment do 
    ProductImage.all.each do |model|
      model.image.recreate_versions!
    end
  end
end

task reset_all: :environment do 
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["seed_db"].invoke
end


task seed_db: :environment do
  Rake::Task["db:migrate"].invoke
  Rake::Task["gen_sites"].invoke
  Rake::Task["gen_pages"].invoke
  Rake::Task["gen_users"].invoke
  Rake::Task["gen_categories"].invoke
end

task seed_products: :environment do 

  Rake::Task["threeem"].invoke
  Rake::Task["animal"].invoke
  Rake::Task["car"].invoke
  Rake::Task["celtrade"].invoke  

end
