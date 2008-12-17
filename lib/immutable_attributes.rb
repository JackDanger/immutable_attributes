require 'rubygems'
require 'activerecord'

module ImmutableErrors
  class ImmutableAttributeError < ActiveRecord::ActiveRecordError
  end
end

module ImmutableAttributes
  VERSION = "1.0.3"
  def attr_immutable(*args)
    args.each do |meth|
      class_eval do
        define_method("#{meth}=") do |value|
          new_record? || read_attribute(meth).nil? ?
            write_attribute(meth, value) :
            raise(ActiveRecord::ImmutableAttributeError, "#{meth} is immutable!")
        end
      end
    end
  end

  def validates_immutable(*attr_names)
    config = { :on => :update, :if => lambda {|x| true}, :message => "can't be changed" }
    config.update(attr_names.extract_options!)

    @immutables = attr_names

    attr_names.each do |meth|
      class_eval do
        define_method("original_#{meth}") do
          instance_variable_get("@original_#{meth}")
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
