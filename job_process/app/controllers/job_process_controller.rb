class JobProcessController < ApplicationController

  def process
    sum = params[:num1] + params[:num2]
    result = post_call({url: 'http://localhost:3000/jobs/job_update'}.merge({sum: sum, id: params[:id]}))
    render json: {}, status: :ok
  end

end
