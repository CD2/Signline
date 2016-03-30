namespace :images do 
  desc "Reprocess Images"
  task product_images: :environment do 
    ProductImage.all.each do |model|
      model.image.recreate_versions!
    end
  end
end


desc "Reset and Reinitialise site"
task reset_all: :environment do 
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke
  Rake::Task["sites:create"].invoke
  Rake::Task["pages:make"].invoke
end
