# frozen_string_literal: true

require 'active_support/all'

class JobsProcessor
  def process(jobs_list)
    @jobs_list = jobs_list
    @processed_jobs = []

    while @jobs_list.count.positive?
      job = @jobs_list.keys.first
      process_job(job)
    end

    @processed_jobs.join
  end

  private

  def process_job(job)
    dependency = @jobs_list[job]

    if dependency.present? && @jobs_list.keys.include?(dependency)
      process_job(dependency)
    end

    @processed_jobs << job
    @jobs_list.delete(job)
  end
end
