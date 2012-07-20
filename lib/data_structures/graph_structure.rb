module DataStructures::Graph
  def self.included(base)
    base.extend(ClassMethods)

    base.instance_variable_set("edge_class", define_edge_class(base))
  end

  def ClassMethods
    def self.extended(base)
      class << base
        has_many
      end
    end
  end

  private
  def define_edge_class(base)
    edge_class = Class.new(ActiveRecord::Base).instance_eval do
      belongs_to :parent, :class_name => base.to_s
      belongs_to :child, :class_name => base.to_s
    end

    Object.const_set("#{base}Edge", edge_class)
  end
end