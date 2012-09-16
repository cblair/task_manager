class TaskCategory < ActiveRecord::Base
  has_many :task_categories
  has_many :tasks
  has_many :specifications
end
