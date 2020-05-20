ActiveAdmin.register Transaction do
    permit_params :crypto_price
  
    index do
      selectable_column
      id_column
      column :fiat_currency
      column :fiat_value
      column :crypto_currency
      column :crypto_price
      actions
    end
  
    filter :fiat_currency
    filter :fiat_value
    filter :crypto_currency
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :fiat_currency
        f.input :fiat_value, min: 1, max: 1000000
        f.input :crypto_currency
        f.input :crypto_price, min: 1, max: 1000000
      end
      f.actions
    end
  
  end
  