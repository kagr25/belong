class JobController < ApplicationController

  def job_status
    job = Job.find(params[:id])
    render json: {job_status: job.status}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: 'Job does not exit with this id' }, status: 400
  end

  def post_job
    job = Job.create(num1: params[:num1], num2: params[:num2], status: :created)
    render json: {job_id: job.id, message: 'Successfully create the job'}, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: 'Please retry again.' }, status: 400
  end

  def job_update
    job = Job.find(params[:id])
    job.update_attributes(status: :done, sum: params[:sum])
    render json: {message: 'Job updated!' }, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: 'Job id incorrect' }, status: 400
  end

end
