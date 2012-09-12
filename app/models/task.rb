class Task < ActiveRecord::Base
  attr_accessible :name, :task_desc, :est_hour, :est_minute, :act_hour, 
                  :act_minute, :priority
end
