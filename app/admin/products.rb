ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :author, :description, :price, :stock, :image, :category_ids => []
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :author, :description, :price, :stock]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do
    attributes_table do
      row :image do
        image_tag url_for(product.image.variant(resize_to_limit: [200, 100])) if product.image.attached?
      end

      row :title
      row :author
      row :description
      row :price
      row :stock

      row "Categories" do |product|
        product.categories.map(&:name).join(", ")
      end

    end
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :author
      f.input :description
      f.input :price
      f.input :stock
      f.input :image, as: :file
      f.input :categories, as: :check_boxes
    end
    f.actions
 end
end
