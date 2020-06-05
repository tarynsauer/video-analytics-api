every 1.day, at: '11:00 pm' do
  rake "cron:update_playlists"
end

every 1.day, at: '12:00 am' do
  rake "cron:fetch_analytics"
end
