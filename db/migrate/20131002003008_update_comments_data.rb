class UpdateCommentsData < ActiveRecord::Migration
  def change
    Comment.all.each do |comment|
      comment.update(:commentable_id => comment.link_id, commentable_type: 'Link')
    end

    remove_column :comments, :link_id
  end
end
