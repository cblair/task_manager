module CategoriesHelper
  def destroy_category_and_ancestors(c)
    #set tasks that point this to point to nil
    c.tasks.each do |task|
      task.category_id = nil
      task.save
    end
    
    #set specs that point this to point to nil
    c.specifications.each do |specification|
      specification.category_id = nil
      specification.save
    end
      
    Category.where(:category_id => c.id).each do |child_c|
      #recursively destroy children
      destroy_category_and_ancestors(child_c)
      
      child_c.destroy
    end
  end
end
