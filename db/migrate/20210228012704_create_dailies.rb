class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.string :date
      t.string :source
      t.string :content

      t.timestamps
    end
  end
end
