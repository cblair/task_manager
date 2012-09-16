class Requirement < ActiveRecord::Base
  belongs_to :specification
  belongs_to :task_category
  belongs_to :category
end
