module FieldHelper
  extend ActiveSupport::Concern

  module IntanceMethods
    def field

    end
  end
end

module ResourcesHelper
  # Generates a table field.
  # See table_for for details.
  # def field(content, options = {})
  #   if content.is_a?(Symbol)
  #     return content_tag :tr do
  #       content_tag :td, content, options
  #     end
  #   end
  # end

  # Generates a table.
  # Usage:
  #   <%= table_for @users, [:name, :email, 'Registration Date', 'Comments count', '-'], model: User, id: 'table-id', class: 'table-class' do |user| %>
  #     <%= field user.name %>
  #     <%= field user.email %>
  #     <%= field user.created_at %>
  #     <%= field user.comments.count %>
  #     <%= field link_to('View', user) %>
  #   <% end %>
  def vertical_table_for(resource, headers, options = {})
    options = Defaults.get.merge options

    content_tag :table, options do
      concat (content_tag :thead do
               content_tag :tr do
                 headers.map do |header|
                   case header
                     when String
                       concat(content_tag :th, header)
                     when Symbol
                       concat(content_tag :th, options[:model].human_attribute_name(header))
                   end
                 end
               end
             end)

      concat (content_tag :tbody do
               [resource].map do |obj|
                 concat (content_tag :tr do
                          capture{ yield obj }
                        end)
               end
             end)
    end
  end

  def table_block (resource, options = {}, &block)
    resource.class.send(:include, FieldHelper)
    content_tag :table, options do
      concat capture{yield resource }
    end
  end

  def table_body (options = {}, &block)
    #resource.class.send(:include, FieldHelper)
    content_tag :tbody, options do
      concat capture{yield }
    end
  end

  def table_head options = {}
    content = capture{yield }
    content_tag :thead, options do
      concat content.html_safe!
    end
  end

  def th(field_name = nil, options = {})
    if field_name.is_a?(Hash)
      options = field_name.extract_options!
    end
    resource_class = options[:resource_class]
    if resource_class.blank? && field_name.nil?
      return content_tag :th, nil, :"data-sort-ignore" => "true"
    end
    klass = options[:resource_class] if options[:resource_class].instance_of?(Class)
    content_tag :th, raw(klass.human_attribute_name(field_name)), options
  end

  def td field_name = nil, options = {}
    resource = options[:resource]
    if resource.blank?
      return content_tag :td, "-"
    end

    content = resource.send(field_name)
    content = "-" if content.blank?
    content_tag(:td, content).html_safe
  end

  def td_actions *actions, **options


    if actions.empty?
      actions = [:show, :edit, :delete]
    end

    resource = options[:resource]

    action_paths = actions.map do |action|
      if action.in?([:show, :delete])
        url_for(resource)
      elsif action.in?([:edit])
        url_for([action, resource])
      end
    end




    return content_tag :td, class: "text-right actions" do
      content_tag :div, class: "btn-group" do
         actions.each_with_index do |action, index|
          concat link_to t("tables.actions.#{action}"), action_paths[index], class: "btn-white btn btn-xs", role: action

        end
      end
    end
  end

  def vertical_table_field field_name = nil, options = {}
    resource = options[:resource]
    if resource.blank?
      return nil
    end

    content = resource.send(field_name)
    content = "-" if content.blank?
    klass = resource.class
    label = klass.human_attribute_name(field_name)
    content_tag :tr do
      content_tag(:td, label) +
      content_tag(:td, content).html_safe
    end.html_safe

  end

  def wizard_step(name, &block)
    Docile.dsl_eval(WizardStepBuilder.new(name), &block).build
  end
end