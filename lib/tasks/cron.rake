namespace :cron do
  task :update_playlists => :environment do
    puts "Updating playlists..."
    Brightcove::Fetch.playlist_cms
    puts "Done."
  end

  task :fetch_analytics => :environment do
    puts "Fetching playlist data..."
    Brightcove::Fetch.playlist_analytics
    puts "Done."
  end

  task :send_email => :environment do
    CsvMailer.send_csv.deliver_later
  end
end
