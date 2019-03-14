ActiveAdmin.register Media do
  permit_params :title, :description, :category_id, :price, :artist_id, :subscription_type_id
end
