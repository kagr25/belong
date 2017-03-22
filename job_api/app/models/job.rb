class Job < ActiveRecord::Base

  after_create :job_process
  enum status: %w(created process done)

  def job_process
    self.update_attributes(status: :process)
    result = post_call({url: 'http://localhost:3001/job/process'}.merge({self.to_hash}))
  end

  def to_hash
    return {
      id: self.id,
      num1: self.num1,
      num2: self.num2,
    }
  end
end
