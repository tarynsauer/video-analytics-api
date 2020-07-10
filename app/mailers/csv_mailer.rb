class CsvMailer < ApplicationMailer
  def send_csv
    csv_data = PlaylistData.as_csv
    attachments["Playlists-#{Date.today}.csv"] = { mime_type: "text/csv", content: csv_data }
    mail(to: ENV['CSV_EMAIL_ADDRESS'], subject: "Latest Playlist Data-#{Date.today}.csv") do |format|
      format.text
      format.html
    end
  end
end
