# frozen_string_literal: true

class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.integer :name
      t.references :reactionable, polymorphic: true, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
