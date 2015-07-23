module ActiveRecordExtensions
  extend ActiveSupport::Concern

  module ClassMethods


    def custom_delegate(*methods, **options)

      if options[:to].is_a?(Array)
      else
        return delegate *methods, **options
      end



      file, line = caller.first.split(':', 2)
      line = line.to_i

      to = options[:to]

      allow_nil = true if to.is_a?(Array)
      prefix = options[:prefix]



      methods.each do |method|
        # Attribute writer methods only accept one argument. Makes sure []=
        # methods still accept two arguments.
        definition = (method =~ /[^\]]=$/) ? 'arg' : '*args, &block'

        # The following generated method calls the target exactly once, storing
        # the returned value in a dummy variable.
        #
        # Reason is twofold: On one hand doing less calls is in general better.
        # On the other hand it could be that the target has side-effects,
        # whereas conceptually, from the user point of view, the delegator should
        # be doing one call.



          method_name = method
          method_name = "#{prefix}_#{method}" if prefix.present?

          if to.is_a?(Array)
            to_source = [
                "object_names = [#{to.map{|o| ":#{o}" }.join(',')}]",
                "val = nil",
                "object_names.each do |obj_name|",
                #"  if !_.nil? || nil.respond_to?(:#{method})",
                "  obj = send(obj_name)",
                "  val = obj.#{method}(#{definition})",
                #"  end",
                "  if !val.nil?",
                "    break",
                "  end",
                "end",
                "val"

            ].join(";")
          end

          method_def = [
              "def #{method_name}(#{definition})",
              to_source,
              "end"
          ].join ';'


        module_eval(method_def, file, line)
      end
    end

    def delegate_with_setter *methods

      custom_delegate *methods
      attr_accessible *methods



      custom_delegate *(methods.map{|m| e = m; e = "#{m}=".to_sym if !m.is_a?(Hash); e  })

    end

    def human_model_name(options = 1)
      if options.is_a?(Symbol) || options.is_a?(String)
        return I18n.t("models.#{name.underscore}.#{options}")
      end

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