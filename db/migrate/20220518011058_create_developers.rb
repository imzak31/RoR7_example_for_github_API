class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|
      t.string :username
      t.integer :public_repos
      t.string :full_name
      t.string :location
      t.json :language_proeficiency

      t.timestamps
    end
  end
end
