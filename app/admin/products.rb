ActiveAdmin.register Product do
 permit_params :name, :price, :description, :sale, :priceonsale, :category_id

 # Domain spefic language
 # Formstatic gem
 form do |f|
  f.semantic_errors # shows errors on :base
  f.inputs          # builds an input field for every attribute
  f.inputs do
    f.input :image, as: :file
  end
  f.actions         # adds the 'Submit' and 'Cancel' buttons
end
end
