require 'test/unit'
require 'rubygems'
require 'activerecord'
require File.join(File.dirname(__FILE__), '..', 'lib', 'immutable_attributes')

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :dbfile  => ":memory:"
)
ActiveRecord::Schema.define do
  create_table :records do |table|
    table.column :name, :string
    table.column :body, :string
  end
end

class Record < ActiveRecord::Base
  attr_immutable :name
end

class ImmutableAttributesTest < Test::Unit::TestCase

  def test_immutable_attribute_can_be_set
    assert Record.new(:name => 'record name')
  end

  def test_immutable_attribute_cannot_be_changed
    record = Record.create!(:name => 'record name')
    assert_raises(ActiveRecord::ImmutableAttributeError) { record.update_attributes(:name => 'new name') }
  end
end
