class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
=begin
      1) t.integer :subject_id, index: true OR
      2) t.references :subject
      3) t.belongs_to :subject
=end
      t.belongs_to :subject
      t.string :name
      t.string :permalink
      t.integer :position
      t.boolean :visible
      t.text :context

      t.timestamps
    end
  end
end
