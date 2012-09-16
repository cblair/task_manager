class Specification < ActiveRecord::Base
  has_many :requirements
  belongs_to :task_category
  belongs_to :category
end
