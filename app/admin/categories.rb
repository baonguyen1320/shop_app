ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :icon, :tag, :parent_id, :published, :slug
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :icon, :tag, :parent_id, :published, :slug]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :title
  filter :parent
  filter :tag
  filter :published

  show do |_|
    attributes_table do
      row :parent
      row :id
      row :title
      row :icon
      row :published
      row :tag
      row :slug
    end
  end

  form do |f|
    f.inputs 'Category Details Active Admin' do
      f.input :parent
      f.input :title
      f.input :icon
      f.input :published
      f.input :tag
    end
    actions
  end

end
