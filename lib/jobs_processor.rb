# frozen_string_literal: true

require 'active_support/all'

class JobsProcessor
  def process(jobs_list)
    @jobs_list = jobs_list
    @processed_jobs = []
    @jobs_in_progress = []

    while @jobs_list.count.positive?
      job = @jobs_list.keys.first
      process_job(job)
    end

    @processed_jobs.join
  end

  private

  def process_job(job)
    @jobs_in_progress << job
    dependency = @jobs_list[job]

    if dependency.present?
      raise "Jobs can't have circular dependencies" if @jobs_in_progress.include?(dependency)
      process_job(dependency) if @jobs_list.keys.include?(dependency)
    end

    @processed_jobs << job
    @jobs_list.delete(job)
    @jobs_in_progress.delete(job)
  end
end
