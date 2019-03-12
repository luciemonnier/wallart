ActiveAdmin.register ActsAsTaggableOn::Tag, as: "Media Tags" do
  permit_params :name
end
