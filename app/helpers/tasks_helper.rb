module TasksHelper
  include WorkTimesHelper

  def get_task_total_act_minutes(task)
    begin
      retval = (task.act_hour * 60) + task.act_minute
    #one of the values was nil
    rescue 
      retval = 0
    end  

    task.work_times.each do |work_time|
      retval += get_work_time_in_seconds(work_time) / 60
    end
    
    return retval
  end
  
end
