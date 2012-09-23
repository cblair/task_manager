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

  #Get all category options, with indentation  
  def get_all_category_select_options()
    o = []
    Category.where(:category_id => nil).each do |c|
      get_category_select_options(c).each do |c_option|
        o << c_option
      end
    end
    return o
  end
  
  #Makes form select_options, indenting the children
  def get_category_select_options(c, level=0)
    retval = []
    retval << [('-' * level) + c.name, c.id]
    c.categories.each do |child_c|
      get_category_select_options(child_c, level + 1).each do |child_c|
        retval << child_c
      end
    end
    
    return retval
  end
end
