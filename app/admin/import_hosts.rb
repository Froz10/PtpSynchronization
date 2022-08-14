# frozen_string_literal: true
ActiveAdmin.register_page "Import Hosts" do
  page_action :import_hosts, method: :post do

    if params[:exel_file].present?
      HostBulkService.call params[:exel_file]
      redirect_to admin_hosts_path, notice: "Hosts imported!"
    else
      flash[:error] = 'Something was wrong'
      redirect_to admin_import_hosts_path
    end
  end

  content title: "Import Hosts" do
    columns do
      panel "Import hosts to database" do
        active_admin_form_for :hosts, url: admin_import_hosts_import_hosts_path do |f|
          f.inputs do
            f.input :exel_file, as: :file
          end
          f.actions do
            f.submit "Import to database"
          end
        end
      end
    end
  end
end
