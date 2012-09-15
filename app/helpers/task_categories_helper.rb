module TaskCategoriesHelper
  def destroy_task_category_and_ancestors(tc)
    #set tasks point this to point to nik
    Task.where(:task_category_id => tc.id).each do |task|
      task.task_category_id = nil
      task.save
    end
      
    TaskCategory.where(:task_category_id => tc.id).each do |child_tc|
      #recursively destroy children
      destroy_task_category_and_ancestors(child_tc)
      
      child_tc.destroy
    end
  end
end
