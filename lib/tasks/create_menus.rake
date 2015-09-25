namespace :db do
    desc "Create menu for weekdays"
    
    task create_menus: :environment do
        weekdays = %w[monday tuesday wednesday thursday friday saturday sunday ]
        weekdays.each {|w| Menu.create!(weekday:w)}
        
    end
end