ActiveAdmin.register Media do
  permit_params :title, :portrait, :description, :category_id, :price, :artist_id, :subscription_type_id
end
