class ClientsController < ResourcesController
  def resource_class
    Client
  end

  def index
    super
    @group_array = Client.group_counts.map {|group| group.name}
    @status_array = Client.status_counts.map {|status| status.name}
    @managers = Manager.all
  end
end
