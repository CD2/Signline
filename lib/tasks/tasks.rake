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
  Rake::Task["gen_products"].invoke


  Rake::Task["beeswift"].invoke

  Category.where('id>13').update_all(parent_id: 9)
  last = Category.ids.max

  Rake::Task["import_celtrade"].invoke

  Category.where("id>#{last}").update_all(parent_id: 8)
end
