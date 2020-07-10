Delayed::Worker.logger = Logger.new(File.join(Rails.root, "log", "delayed_job.log"))
Delayed::Worker.default_queue_name = "tasks"
Delayed::Worker.max_attempts = 5
if ENV["LONG_RUNNING_QUEUE"].present?
  Delayed::Worker.max_run_time = 45.minutes
else
  Delayed::Worker.max_run_time = 5.minutes
end

module JobPreparerExtension
  def set_queue_name
    super
    debug_queue = ENV["DJ_DEBUG_QUEUE_PREPEND"]

    if debug_queue.present?
      options[:queue] = "#{debug_queue}_#{options[:queue]}"
      # puts "MONKYPATCH JobPreparer: QUEUE NAME #{options[:queue]}"
    end
  end
end

module Delayed
  module Backend
    class JobPreparer
      prepend JobPreparerExtension
    end
  end
end
