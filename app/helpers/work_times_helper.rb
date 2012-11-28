module WorkTimesHelper
    
  def get_time_with_zone_in_seconds(twz)
    seconds = 0
    
    #if dt = DateTime.parse(twz.to_s) rescue false
    dt = DateTime.parse(twz.to_s)
    seconds = dt.hour * 3600 + dt.min * 60 #=> 37800
    #end
     
     return seconds
  end
  

  def get_work_time_in_seconds(work_time)
    start_seconds = get_time_with_zone_in_seconds(work_time.start_time)
    end_seconds = get_time_with_zone_in_seconds(work_time.end_time)
    
    return end_seconds - start_seconds  
  end

end
