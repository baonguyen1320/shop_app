ActiveAdmin.register Product do
  permit_params :id, :category_id, :name, :content, :price,
                :buyer, :data_file, :published, :manufacturer,
                :tags, :langugage

  index do
    selectable_column
    column :id
    column :category_id
    column :name
    column :price
    column :buyer
    column :manufacturer
    column :langugage
    column :published
    column :tags
    actions
  end

  show do |t|
    attributes_table do
      row :id
      row :category_id
      row :name
      row 'Content' do
        t.content.html_safe
      end
      row :price
      row :buyer
      row :manufacturer
      row :langugage
      row :published
      row :tags
    end
  end

  form html: {enctype: 'multipart/form-data'} do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :content, as: :ckeditor
      f.input :price
      f.input :buyer
      f.input :manufacturer
      f.input :langugage
      f.input :published
      f.input :tags
    end
    f.actions
  end

end
