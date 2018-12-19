module Brightcove
  class AnalyticsApiError < StandardError; end

  class AnalyticsApi
    OAUTH_ENDPOINT = "https://oauth.brightcove.com/v4/access_token"
    API_ROOT = "https://analytics.api.brightcove.com/v1/data"
    FIELDS = %w(
    video_engagement_50,
    video_engagement_25,
    video_engagement_100,
    video_engagement_1,
    video_duration,
    video,
    play_rate,
    play_request,
    engagement_score,
    bytes_delivered,
    ad_mode_complete,
    ad_mode_begin,
    video_engagement_75,
    video_impression,
    video_name,
    video_percent_viewed,
    video_seconds_viewed,
    video_view,
    video.reference_id,
    video_download_request,
    video_download_complete,
    video_download_cancellation,
    video_download_error
    )

    def initialize(account_id:, client_id:, client_secret:)
      @base_url = "#{API_ROOT}?accounts=#{account_id}"
      @client_id = client_id
      @client_secret = client_secret
      _set_token
    end

    def self.default_api
      account_id = ENV['BRIGHTCOVE_ACCOUNT_ID']
      client_id = ENV['BRIGHTCOVE_CLIENT_ID']
      client_secret = ENV['BRIGHTCOVE_CLIENT_SECRET']

      if [account_id, client_id, client_secret].any? { |c| c.to_s.empty? }
        raise AuthenticationError, 'Missing Brightcove API credentials'
      end

      @default_api ||= new(
        account_id: account_id,
        client_id: client_id,
        client_secret: client_secret)
    end

    def get_videos(video_ids)
      _set_token if @token_expires < Time.now
      response = _get_video_data(video_ids)

      case response.code
      when 200
        response
      when 401
        _set_token
        response = _get_video_data(video_ids)

        _raise_account_error if response.code == 401

        response
      else
        raise AnalyticsApiError, response.to_s
      end
    end

    private

    def _get_video_data(video_ids)
      HTTP.auth("Bearer #{@token}").get("#{@base_url}&dimensions=video&where=video==#{video_ids}&fields=#{FIELDS.join(',')}")
    end

    def _set_token
      response = HTTP.basic_auth(user: @client_id, pass: @client_secret)
                     .post(OAUTH_ENDPOINT,
                           form: { grant_type: "client_credentials" })
      token_response = response.parse

      if response.status == 200
        @token = token_response.fetch("access_token")
        @token_expires = Time.now + token_response.fetch("expires_in")
      else
        raise AuthenticationError, token_response.fetch("error_description")
      end
    end

    def _raise_account_error
      raise AuthenticationError, 'Token valid but not for the given account_id'
    end
  end
end
