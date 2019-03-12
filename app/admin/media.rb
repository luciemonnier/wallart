ActiveAdmin.register Media do
  permit_params :title, :description, :price, :artist_id, :subscription_type, :category
end
