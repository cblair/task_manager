class WorkTime < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :task_id
  belongs_to :task
end
