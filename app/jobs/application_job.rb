class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock.
  retry_on ActiveRecord::Deadlocked, attempts: 3, wait: :polynomially_longer

  # Most jobs are safe to ignore if the underlying records are no longer available.
  discard_on ActiveJob::DeserializationError
end
