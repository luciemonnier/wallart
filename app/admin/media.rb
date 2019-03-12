ActiveAdmin.register Media do
  permit_params :title, :description, :photo, :price, :artist_id, :subscription_type, :category
  form do |f|
    f.inputs "Media" do
      f.input :title
      f.input :description
      f.input :price
      f.input :artist
      f.input :subscription_type
      f.input :category
      f.input :tags,  # Show all tags AND checked already selected one (by relations through :tags - input must named :tags)
        as: :select,
        multiple: :true,
        collection: ActsAsTaggableOn::Tag.select(:id, :name).all
    end
    f.actions
  end
end
