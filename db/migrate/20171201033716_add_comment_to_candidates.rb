class AddCommentToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates,:comment,:text
  end
end
