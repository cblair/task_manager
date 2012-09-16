class Task < ActiveRecord::Base
  attr_accessible :name, :task_desc, :est_hour, :est_minute, :act_hour, 
                  :act_minute, :priority, :category_id
  belongs_to :task_category
  belongs_to :category
end
