class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  attr_accessible :title, :comment, :user_id
  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'
  belongs_to :user
end
