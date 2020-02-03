# Use this file to easily define all of your cron jobs.
every 1.day, at: '11:30 pm' do
  rake "cron:update_playlists"
end

every 1.day, at: '12:00 am' do
  rake "cron:fetch_analytics"
end

# Let whenever write your job into the crontab:
### bundle exec whenever --update-crontab
# Learn more: http://github.com/javan/whenever

# Other commands
#
# Display crontab: crontab -l
# Wipe crontab of your whenever task: bundle exec whenever --clear-crontab
