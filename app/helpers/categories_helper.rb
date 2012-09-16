module CategoriesHelper
  def destroy_category_and_ancestors(c)
    #set tasks point this to point to nik
    Task.where(:category_id => c.id).each do |task|
      task.task_category_id = nil
      task.save
    end
      
    Category.where(:category_id => c.id).each do |child_c|
      #recursively destroy children
      destroy_category_and_ancestors(child_c)
      
      child_c.destroy
    end
  end
end
