class PostSerializer < ActiveModel::Serializer
  attributes :id, :post_type, :content, :created_at, :updated_at
  belongs_to :course
  belongs_to :user
end
