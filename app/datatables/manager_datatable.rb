class ManagerDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari


  def url_helpers
    @_url_helpers = Rails.application.routes.url_helpers
  end

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= []
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= []
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        email: record.email,
        full_name: record.user_info.try(&:full_name),
        avatar: nil,
        address: nil,
        edit_path: url_helpers.edit_manager_path(id: record.id),
        show_path: url_helpers.manager_path(id: record.id),
        delete_path: url_helpers.manager_path(id: record.id)

        # record.email,
        # record.user_info.try(&:full_name),
        # nil,
        # nil,
        # url_helpers.edit_manager_path(id: record.id),
        # url_helpers.manager_path(id: record.id),
      ]
    end
  end

  def get_raw_records
    # insert query here
    Manager.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
