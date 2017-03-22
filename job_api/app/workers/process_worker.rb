class ProcessWorker
  include Sidekiq::Worker

  def perform(*args)
    data = Job.where(status: [:process, :created]).where('update_at > ?', Time.now - 5.mins).collect{|job| job.to_hash}
    next_time = next_time(args[0])
    data.each do |job_hash|
      result = post_call({url: 'http://localhost:3001/job/process'}.merge({job_hash}))
    end
    ProcessWorker.perform_in(next_time.seconds, next_time)
  end

  def next_time(last_time, data)
    if data.size > 0
      return 10
    else
      return last_time < 300 ? last_time * 2 : 600
    end
  end
end
