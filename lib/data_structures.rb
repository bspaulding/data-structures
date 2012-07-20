module DataStructures; end

Dir[ File.join(__FILE__, 'data_structures', '*_structure.rb') ].each {|file| require file }

module DataStructures
  def self.included(base)
    base.extend(ClassMethods)
  end

  def ClassMethods
    def use_structure(name)
      raise DataStructures::StructureNotFound.new("Structure #{name} is undefined.") unless DataStructures.constants.map(&:to_sym).include?(name.to_s.classify.to_sym)
      
      send(:include, DataStructures.const_get(name.to_s.classify))
    end
  end

  class StructureNotFound < StandardError; end
end

ActiveRecord::Base.send(:include, DataStructures) if defined? ActiveRecord::Base