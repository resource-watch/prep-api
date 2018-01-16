ActiveAdmin.register Dashboard do
  config.per_page = 20
  config.sort_order = 'created_at_desc'

  filter :title
  filter :summary
  filter :content
  filter :attribution
  filter :dashboards
  filter :published
  filter :partner
  filter :indicator
  filter :insights
  filter :tools
  filter :updated_at
  filter :created_at

  controller do
    def permitted_params
      params.permit(:id, dashboard: [:title, :published, :partner_id, :indicator_id,
                                     :summary, :content, :related_datasets, :attribution,
                                     :image, dashboard_ids: [], insight_ids: [], tool_ids: []])
    end
  end

  index do
    column :title
    column :summary
    column :published
    column :partner
    column :indicator
    column :updated_at
    column :created_at
    actions
  end

  form multipart: true do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :published
      f.input :partner
      f.input :indicator, include_blank: false
      f.input :summary
      f.input :content
      f.input :related_datasets
      f.input :attribution
      f.input :dashboards, as: :check_boxes, collection: Dashboard.where.not(id: object.id)
      f.input :insights, as: :check_boxes, collection: Insight.all
      f.input :tools, as: :check_boxes, collection: Tool.all
      f.input :image, as: :file, hint: f.object.image.present? ? \
        image_tag(f.object.image.url) : content_tag(:span, 'No image yet')
    end
    f.actions
  end

  show do |d|
    attributes_table do
      row :title
      row :slug
      row :summary
      row :content
      row :published
      row :image do
        image_tag(d.image.url(:thumb)) unless d.image.blank?
      end
      row :partner
      row :indicator
      row :related_datasets
      row :attribution
      row :dashboards do
        d.dashboards
          .map { |r| link_to(r.title, manager_dashboard_path(r)) }
          .join
          .html_safe
      end
      row :insights do
        d.insights
          .map { |r| link_to(r.title, manager_insight_path(r)) }
          .join(', ')
          .html_safe
      end
      row :tools do
        d.tools
          .map { |r| link_to(r.title, manager_tool_path(r)) }
          .join(', ')
          .html_safe
      end
      row :updated_at
      row :created_at
    end
  end

end
