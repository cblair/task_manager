class Category < ActiveRecord::Base
  has_many :categories
  has_many :tasks
  has_many :specifications
end
