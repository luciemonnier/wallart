ActiveAdmin.register Artist do
  permit_params :name, :description, :photo
end
