ActiveAdmin.register Host do
  permit_params :name, :address, :region_id
  includes :region

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :region_id
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
      f.input :region_id
    end
    f.actions
  end

end
