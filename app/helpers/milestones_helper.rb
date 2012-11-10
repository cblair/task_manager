module MilestonesHelper
  
  def milestone_is_complete(milestone)
    retval = true #until proven false
    milestone.tasks.each do |task|
      retval = retval & task.completed
    end
    
    return retval
  end
  
end
