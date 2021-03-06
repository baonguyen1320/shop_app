ActiveAdmin.register Product do
  permit_params :id, :category_id, :name, :content, :price,
                :buyer, :data_file, :published, :manufacturer,
                :tags, :langugage, :image, :older_price, :sale_time

  index do
    selectable_column
    column :id
    column :category_id
    column :name
    column :price
    column :older_price
    column :buyer
    column :manufacturer
    column :sale_time
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
      row :older_price
      row :buyer
      row :image do
        t.image? ? image_tag(t.image.url, height: '100') : content_tag(:span, 'No photo yet')
      end
      row :manufacturer
      row :sale_time
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
      f.input :older_price
      f.input :buyer
      f.input :image, as: :file, hint: f.product.image? ? image_tag(product.image.url, height: '100') : content_tag(:span, 'Pls upload image')
      f.input :manufacturer
      f.input :sale_time
      f.input :language
      f.input :published
      f.input :tags
    end
    f.actions
  end

end
