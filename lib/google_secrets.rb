require "google/cloud/secret_manager"
require "google/cloud/env"

module GoogleSecrets
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

      client = Google::Cloud::SecretManager.secret_manager_service
      name = client.secret_version_path(
        project: project_id,
        secret:  secret_id,
        version: "latest"
      )
      
      client.access_secret_version(name: name).payload.data
    rescue => e
      Rails.logger.warn "GCP Secret Manager: Could not fetch #{secret_id}. Error: #{e.message}"
      nil
    end
  end
end
