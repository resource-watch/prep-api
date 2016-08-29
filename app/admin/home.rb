ActiveAdmin.register_page "Home" do

  menu priority: 1, label: proc{ I18n.t("active_admin.home") }

  content title: proc{ I18n.t("active_admin.home") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Recent dashboards" do
          ul do
            Dashboard.all.limit(5).map do |dashboard|
              li link_to(dashboard.title, admin_dashboard_path(dashboard))
            end
          end
        end
      end

      column do
        panel "Recent widgets" do
          ul do
            Widget.all.limit(5).map do |widget|
              li link_to(widget.title, admin_widget_path(widget))
            end
          end
        end
      end

      column do
        panel "Recent insights" do
          ul do
            Insight.all.limit(5).map do |insight|
              li link_to(insight.title, admin_insight_path(insight))
            end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    end
  end
end
