class CreateGossipsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips_tags do |t|
      t.references :tag, foreign_key: true
      t.references :gossip, foreign_key: true
    end
  end
end
