ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :subscription_type_id, :photo
end
