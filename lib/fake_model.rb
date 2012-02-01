require 'active_support'
require 'active_record'

module FakeModel
  extend ActiveSupport::Concern

  include ActiveRecord::Validations
  include ActiveRecord::Reflection 
  include ActiveModel::Conversion
  include ActiveRecord::Callbacks

  def initialize (attributes = {})
    attributes.each{|k,v| self.send "#{k}=", v}
    super
  end

  included do 
     def persisted?
       false
     end
     def new_record?
       true
     end
     def attributes
       Hash[self.class.fake_attributes.map { |name, _| [name, self.send(name)] }]
     end
  end

  module ClassMethods
    def fake *attributes   
      @attributes = attributes
      attributes.each{|attr| self.send :attr_accessor , attr}
    end

    def fake_attributes
      @attributes
    end

  end

end
