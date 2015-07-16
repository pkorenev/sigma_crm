module ActiveRecordExtensions
  extend ActiveSupport::Concern

  module ClassMethods
    def delegate_with_setter *methods
      delegate *methods
      attr_accessible *methods
      delegate *(methods.map{|m| e = m; e = "#{m}=".to_sym if !m.is_a?(Hash); e  })

    end

    def human_model_name(options = 1)
      if options.is_a?(Numeric)
        count = options
      end

      if options.is_a?(Hash)
        if options[:count]
          count = options[:count]
        end

        if options[:multiple]
          count = 2
        end
      end

      if I18n.locale == :uk
        count_range = 1
        if (c = count % 10) >= 5 || c == 0 || count >= 5 && count <= 20
          count_range = 5
        end

        if count % 10 == 2
          count_range = 2
        end

        I18n.t("models.#{name.underscore}")[count_range]

      else
        model_name.human(count: count)
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtensions)