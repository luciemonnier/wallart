ActiveAdmin.register SubscriptionType do
  permit_params :name, :price_cents, :level
end
