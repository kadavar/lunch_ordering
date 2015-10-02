namespace :db do
  desc "Create food"

  task create_food: :environment do
    first = (1..32).to_a
    first.each { |w| Food.create!(name: 'first'+w.to_s, price: w*20, course: "first") }

    first.each { |w| Food.create!(name: 'second'+w.to_s, price: w*25, course: "second") }


    first.each { |w| Food.create!(name: 'drink'+w.to_s, price: w*10, course: "drink") }

  end
end