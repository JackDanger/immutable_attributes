begin
  require 'activerecord'
rescue LoadError
  require 'active_record'
end

module ImmutableErrors
  class ImmutableAttributeError < ActiveRecord::ActiveRecordError
  end
end

module ImmutableAttributes
  VERSION = "1.0.3"
  def attr_immutable(*args)
    class_eval do
      args.each do |attr|
        define_method("#{attr}=") do |value|
          new_record? || read_attribute(attr).nil? ?
            write_attribute(attr, value) :
            raise(ActiveRecord::ImmutableAttributeError, "#{attr} is immutable!")
        end
      end
      # handle ActiveRecord::Base#[]=
      define_method :[]= do |attr, value|
        return write_attribute(attr, value) unless args.include?(attr.to_sym)
        send "#{attr}=", value
      end
    end
  end

  def validates_immutable(*attr_names)
    config = { :on => :update, :if => lambda {|x| true}, :message => "can't be changed" }
    config.update(attr_names.extract_options!)

    @immutables = attr_names

    attr_names.each do |attr|
      class_eval do
        define_method("original_#{attr}") do
          instance_variable_get("@original_#{attr}")
        end
      end
    end

    class_eval do
      def self.immutables
        @immutables
      end

      def after_initialize; end;

      def setup_originals
        self.class.immutables.each do |attr_name|
          next unless attribute_names.include? attr_name
          instance_variable_set("@original_#{attr_name}", send(attr_name.to_s))
        end
      end
      
      after_initialize :setup_originals
    end

    validates_each(attr_names, config) do |record, attr_name, value|
      next if record.send("original_#{attr_name.to_s}").nil?
      record.errors.add(attr_name, config[:message]) if record.send("original_#{attr_name.to_s}") != record.send(attr_name.to_s)
    end
  end
end

ActiveRecord.send :include, ImmutableErrors
ActiveRecord::Base.extend ImmutableAttributes
