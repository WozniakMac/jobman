# frozen_string_literal: true

class JobsList
  def initialize(hash_list)
    @hash_list = hash_list
  end

  def next?
    @hash_list.count.positive?
  end

  def next
    @hash_list.keys.first
  end

  def dependency(job)
    @hash_list[job]
  end

  def delete(job)
    @hash_list.delete(job)
  end

  def contain?(job)
    @hash_list.keys.include?(job)
  end
end
