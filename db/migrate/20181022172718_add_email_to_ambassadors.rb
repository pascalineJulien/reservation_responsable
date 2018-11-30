class AddEmailToAmbassadors < ActiveRecord::Migration[5.1]
  def change
    add_column :ambassadors, :email, :string
  end
end
