module JudgeHelper
  def relative_to(competition, time)
    start_time = competition.start_time
    duration = time.to_i - start_time.to_i
    minutes = duration / 60
    seconds = duration % 60
    return "#{t :in} #{minutes}:#{seconds} #{t :minutes}"
  end
end
