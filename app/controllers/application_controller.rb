require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session

  before_action :add_view_paths

  attr_accessor :current_view_folder


  def render_unauthorized
    render file: Rails.root.join("public/401.html"), layout: false, status: 401
  end

  def render_not_found
    render file: Rails.root.join("public/404.html"), layout: false, status: 404
  end

  def site_home
    render template: "layouts/application", layout: false
  end

  def set_csrf_headers
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end





  def add_view_paths
    base_views_path = Rails.root.join("app/views")
    new_view_paths = self.class.ancestor_classes(false, ApplicationController).reverse.map{|c| s = c.to_s; s[0, s.index("Controller")].underscore }.map{|s| base_views_path + (s) }.select{|vp| File.exists?(vp) }

    new_view_paths.each do |path|
      prepend_view_path(path)
    end
  end

  def resolve_super(current_file) # __FILE__



    @current_view_folder ||= view_paths[1].instance_variable_get(:@path).to_s

    folders = view_paths.map{|vp| vp.instance_variable_get(:@path).to_s }

    if current_file
      template_name_parts = File.basename(current_file).split('.')
      template_name = template_name_parts[0, 2].join(".")

      folder = File.dirname(current_file)
      if folders.index(folder) >= 0
        @current_view_folder = folder
        parent_folders = folders[folders.index(@current_view_folder) + 1, folders.length]
      else
        folder_index = folders.index{|f| f.index(folder) >= 0 }
        @current_view_folder = folders[folder_index]
        parent_folders = folders[folder_index + 1, folders.length]

      end
    else
      parent_folders = folders[folders.index(@current_view_folder) + 1, folders.length]
    end



    folders_to_search = parent_folders



    handler_priorities = ["", :slim, :erb]

    #file_path = "#{f}/#{template_name}"
    filenames = folders_to_search.map{|f| Dir["#{f}/#{template_name}*"] }.select(&:any?).first
    file_handlers = filenames.map{|f| dir = File.dirname(f); file_name_without_handlers = "#{dir}/#{template_name}" ;  f[file_name_without_handlers.length, file_name_without_handlers.length] }

    # TODO: resolve file_name by handlers priorities
    resolved_file_name = filenames.first







    # assign template folder to @current_view_folder
    @current_view_folder = File.dirname(resolved_file_name)

    resolved_file_name
  end

  def render_super(file, options = {} )
    resolved_file_name = resolve_super(file)
    opts = {file: resolved_file_name, layout: false}.merge(options)
    render_to_string opts
    #render_to_string inline: self.inspect
    #render_to_string inline: resolved_file_name
  end

  helper_method :render_super, :resolve_super
end
