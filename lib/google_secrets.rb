require "google/cloud/secret_manager"
require "google/cloud/env"

module GoogleSecrets
  RETRY_ATTEMPTS = 3
  RETRY_BASE_DELAY = 0.5 # seconds, doubled each attempt
  CALL_TIMEOUT = 10 # seconds per Secret Manager API call

  def self.fetch(secret_id)
    # 1. Always prioritize environment variables (essential for Cloud Run secret mapping)
    return ENV[secret_id] if ENV[secret_id].present?

    # 2. If not in ENV, try to fetch from GCP Secret Manager
    begin
      env = Google::Cloud::Env.new
      project_id = env.project_id || ENV['GCP_PROJECT_ID']

      if project_id.blank?
        return nil
      end

      client = Google::Cloud::SecretManager.secret_manager_service do |config|
        config.timeout = CALL_TIMEOUT
      end
      name = client.secret_version_path(
        project: project_id,
        secret:  secret_id,
        version: "latest"
      )

      with_retries(secret_id) do
        client.access_secret_version(name: name).payload.data
      end
    rescue => e
      Rails.logger.warn "GCP Secret Manager: Could not fetch #{secret_id}. Error: #{e.message}"
      nil
    end
  end

  def self.with_retries(secret_id)
    attempts = 0
    begin
      yield
    rescue GRPC::Unavailable, GRPC::DeadlineExceeded => e
      attempts += 1
      raise if attempts >= RETRY_ATTEMPTS

      delay = RETRY_BASE_DELAY * (2**(attempts - 1))
      Rails.logger.warn "GCP Secret Manager: transient error fetching #{secret_id} (attempt #{attempts}/#{RETRY_ATTEMPTS}): #{e.message}. Retrying in #{delay}s"
      sleep delay
      retry
    end
  end
  private_class_method :with_retries
end
