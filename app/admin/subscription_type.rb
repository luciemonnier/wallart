ActiveAdmin.register SubscriptionType do
  permit_params :name, :price_cents, :level, :rentals_number
end
