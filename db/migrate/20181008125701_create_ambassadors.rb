class CreateAmbassadors < ActiveRecord::Migration[5.1]
  def change
    create_table :ambassadors do |t|
      t.integer :source_id
      t.text  :mailer_summary
      t.text :mailer_description
      t.string :company_name
      t.string :firstname
      t.string :lastname
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        Ambassador.create_translation_table! :mailer_summary => :text, :mailer_description => :text
      end

      dir.down do
        Ambassador.drop_translation_table!
      end
    end
  end
end
