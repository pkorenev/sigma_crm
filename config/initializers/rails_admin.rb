RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Address do
    visible false
  end

  config.model Agreement do
    visible false
  end

  config.model ApartmentDetails do
    visible false
  end

  config.model ApartmentInfo do
    visible false
  end

  config.model Asset do
    visible false
  end

  config.model Building do
    visible false
  end

  config.model Apartment do
    visible true

    list do
      field :full_address
      #field :rooms_count
      field :level
      field :status

    end
  end

  config.model ApartmentHouse do
    visible false
  end

  config.model BuildingComplex do
    visible true

    list do
      field :name
    end
  end

  config.model Penthouse do
    visible false
  end

  config.model BuildingComplexLink do
    visible false
  end

  config.model BuildingView do
    visible false
  end

  config.model ClientTag do
    visible false
  end

  config.model ClientGroupTag do
    visible false
  end

  config.model ClientStatusTag do
    visible false
  end

  config.model Comment do
    visible false
  end

  config.model ManagerClientLink do
    visible false
  end

  config.model PenthouseDetails do
    visible false
  end

  config.model Role do
    visible false
  end

  config.model User do
    visible false
  end

  config.model Admin do
    visible false
  end

  config.model Client do
    visible false
  end

  config.model Manager do
    visible false
  end

  config.model UserInfo do
    visible false
  end
end
