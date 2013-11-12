require "simple_contractx/engine"

module SimpleContractx
  mattr_accessor :project_class, :show_project_path, :project_resource
  
  def self.project_class
    @@project_class.constantize
  end
end
