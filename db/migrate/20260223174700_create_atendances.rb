class CreateAtendances < ActiveRecord::Migration[8.0]
  def change
    create_table :atendances do |t|
      t.string :stripe_customer_id

      t.timestamps
    end
  end
end
