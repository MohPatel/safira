ActiveAdmin.register Product do
 permit_params :name, :price, :description, :sale, :priceonsale, :category_id

end
