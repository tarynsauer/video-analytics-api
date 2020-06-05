namespace :auth do
  task :create_admin => :environment do
    puts "Creating admin..."
    user = User.find_or_initialize_by(name: ENV['ADMIN_NAME'])
    unless user.persisted?
      user.update(password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD'])
    end
    puts "User #{user.name} exists!" if user.persisted?
  end
end
