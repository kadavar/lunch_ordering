namespace :db do
  desc "Create roles for users"

  task create_roles: :environment do
    role = %w[admin user]
    role.each { |r| Role.create!(role: r) }

  end
end