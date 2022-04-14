class AddCheckConstraint < ActiveRecord::Migration[7.0]
  def change
    add_check_constraint :users, "email IS NOT NULL", name: "users_email_null", validate: false
  end
end
