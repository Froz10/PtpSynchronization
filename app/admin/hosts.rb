ActiveAdmin.register Host do
  permit_params :name, :address, :region_id
  includes :region

  action_item :export_from_database do
    link_to "Export from database", 
            export_from_database_admin_host_path(id: "export-from-database"), 
            method: :get
  end

  action_item :import_to_database do
    link_to "Import to database", 
            admin_import_hosts_path, 
            method: :get
  end

  member_action :export_from_database, method: :get do
    @hosts = Host.all
    render xlsx: 'hosts', layout: false, handlers: [:axlsx], formats: [:xlsx], template: 'users/hosts'
  end

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :region_id do |host|
      host.region.name
    end
    column :created_at
    actions
  end

  filter :created_at

  show do
    attributes_table do
      row :name
      row :address
      row :region_id
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :region_id, as: :select, collection: Region.all.map { |region| [region.name, region.id] }
    end
    f.actions
  end

end
