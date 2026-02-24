class AddUserAndEventToAtendances < ActiveRecord::Migration[8.0]
  def change
    add_reference :atendances, :user, null: false, foreign_key: true
    add_reference :atendances, :event, null: false, foreign_key: true
  end
end
