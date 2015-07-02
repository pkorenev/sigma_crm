module Angular
  module Generators
    module ResourceHelpers
      def application_name
        if defined?(Rails) && Rails.application
          ENV['NG_APP_OBJECT'] || Rails.application.class.name.split('::').first
        else
          "application"
        end
      end

      def module_var_name
        application_name
      end

      def assets_path
        "app/assets"
      end

      def angular_path
        #"#{assets_path}/javascripts/angular"
        "#{assets_path}/ng"
      end

      def angular_templates_path
        "#{assets_path}/templates"
      end

      def angular_spec_path
        "spec/javascripts/angular"
      end

      def resource_name
        file_name
      end

      def edit_controller_name
        "edit_#{resource_name}_controller".camelize
      end

      def new_controller_name
        "new_#{resource_name}_controller".camelize
      end

      def index_controller_name
        "#{resource_name.pluralize}_controller".camelize
      end

      def show_controller_name
        "show_#{resource_name}_controller".camelize
      end
    end
  end
end