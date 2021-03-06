class Task < ActiveRecord::Base
  attr_accessible :name, :task_desc, :est_hour, :est_minute, :act_hour, 
                  :act_minute, :priority, :category_id, :milestone_id, :completed,
                  :assigned_user_id
  belongs_to :task_category
  belongs_to :category
  belongs_to :milestone
  belongs_to :user
  has_many :work_times
end
