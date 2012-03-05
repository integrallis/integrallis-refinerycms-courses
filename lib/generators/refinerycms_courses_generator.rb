class RefinerycmsCourses < Refinery::Generators::EngineInstaller

  source_root File.expand_path('../../../', __FILE__)
  engine_name "courses"
  
  def run_dependency_generators
    self.class.superclass.send(:alias_method, :new_generate, :generate)
    self.class.superclass.send(:remove_method, :generate)
    begin
      puts "------------------------"
      puts "Running generators for integrallis-refinerycms-courses dependencies..."
      puts "------------------------"
      generate "acts_as_taggable_on:migration"
      generate "comment"
      generate "formtastic:install"
      puts "------------------------"
      puts "Now you can run:"
      puts "rake db:migrate"
      puts "------------------------"
    ensure
      self.class.superclass.send(:alias_method, :generate, :new_generate)
      self.class.superclass.send(:remove_method, :new_generate)
    end
  end

end
