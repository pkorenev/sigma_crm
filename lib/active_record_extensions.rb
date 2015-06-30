module ActiveRecordExtensions
  extend ActiveSupport::Concern

  module ClassMethods
    def delegate_with_setter *methods
      delegate *methods
      attr_accessible *methods
      delegate *(methods.map{|m| e = m; e = "#{m}=".to_sym if !m.is_a?(Hash); e  })

    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtensions)