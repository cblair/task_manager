module MilestonesHelper
  include TasksHelper
  
  def milestone_is_complete(milestone)
    retval = true #until proven false
    milestone.tasks.each do |task|
      retval = retval & task.completed
    end
    
    return retval
  end
  
  def get_total_milestone_act_and_est_time(milestone)
    milestone_total_act_minutes = 0
    milestone_total_est_minutes = 0
    milestone.tasks.each do |task|      
      begin
        total_est_minute = (task.est_hour * 60) + task.est_minute 
        milestone_total_est_minutes += total_est_minute
      rescue
        milestone_total_est_minutes = 0
      end
      begin
        #total_act_minute = (task.act_hour * 60) + task.act_minute
        total_act_minute = get_task_total_act_minutes(task)

        milestone_total_act_minutes += total_act_minute
      rescue
        milestone_total_act_minutes += 0
      end
    end
    
    milestone_total_act_hours = milestone_total_act_minutes / 60 
    milestone_total_est_hours = milestone_total_est_minutes / 60
    
    return {
            :milestone_total_act_hours => milestone_total_act_hours,
            :milestone_total_est_hours => milestone_total_est_hours
           }
  end
  
end
