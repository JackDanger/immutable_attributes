# Include hook code here
require 'immutable_attributes'

ActiveRecord.send :include, ImmutableErrors
ActiveRecord::Base.extend ImmutableAttributes
